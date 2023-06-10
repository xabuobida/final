import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testbuild/view/Profile/edit_profile.dart';
import 'package:testbuild/viewModel/Profile/states.dart';

import '../../model/ProfileModel.dart';
import '../../model/homemodel.dart';

class ProfileCubit extends Cubit<ProfileStates> {
    DateTime selectTime = DateTime.now();

  ProfileCubit() : super(ProfileInitState());
  XFile? image;
  bool? isPick = false;
  List<profilemodel> data0 = [];
  List<profilemodel> infolist = [];

  Future<void> getinfo() async {
    FirebaseFirestore.instance.collection('users').where('uid',isEqualTo: FirebaseAuth.instance.currentUser!.uid.toString()).get().then((value) {
      for (var element in value.docs) {
        infolist.add(profilemodel.fromJson(element.data()));
      }
      emit(ProfileSuccessState());
    });
  }

  Future<void> getdata() async {
    FirebaseFirestore.instance.collection('users')
      .get().then((value) {
        for (var element in value.docs) {
          data0.add(profilemodel.fromJson(element.data()));
        }
        emit(ProfileSuccessState());
      });
  }

  Future<void> imagePick() async {
    final ImagePicker picker = ImagePicker();

    image = await picker.pickImage(source: ImageSource.camera);
    isPick = true;
    emit(ProfileUpdateImageState());
  }

  Future<void> uploadImage({String? phone, String? name, String? date}) async {
    //
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    FirebaseStorage.instance
        .ref()
        .child("images/${Uri.file(image!.path).pathSegments.last}")
        .putFile(File(image!.path))
        .then((p0) {
      p0.ref.getDownloadURL().then((value) {
        print(value);
        FirebaseFirestore.instance
            .collection("users")
            .doc(prefs.getString("id"))
            .update({
          //
          "name": name,
          "date": date,
          "phone": phone,
          "image": value,
        }).then((v) {
          //

          getdata();
        }).catchError((onError) {
          //
        });
      });
    });
  }
Future<void> selectDateTime(BuildContext context) async {
    //
    final DateTime? picker = await showDatePicker(
      
      context: context,
      initialDate: selectTime,
      firstDate: DateTime(1948),
      lastDate: DateTime(2099),
    );

    if (picker != null) {
      selectTime = picker;
    }

    emit(SignUpPickDateState());
  }
 void editprofilef({String? name, String? phone, String? email,String ?date}) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid.toString())
        .update({
      'name': '$name',
      'phone': '$phone',
      'email': '$email',
      'date':'$date'
    });
  }
  
}
//  final SharedPreferences prefs = await SharedPreferences.getInstance();
//     var ssss = FirebaseFirestore.instance
//         .collection("users")
//         .doc(prefs.getString("id"))
//         .get();