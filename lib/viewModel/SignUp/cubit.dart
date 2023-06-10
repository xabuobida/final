import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:testbuild/viewModel/SignUp/states.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(SignUpInitState());
  DateTime selectTime = DateTime.now();
  //
  void signUpUser(
      {String? email,
      String? password,
      String? name,
      String? phone,
      String? date,
      String? adreessescountry,
      String? adreessescity,
      String? adreessesstreet}) {
    //
    emit(SignUpLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    )
        .then((value) {
      saveDate(email, value.user!.uid.toString(), name, phone, date,
          adreessescountry, adreessescity, adreessesstreet);
    }).catchError((onError) {
      //
      log(onError.toString());
      emit(SignUpErrorState());
    });
  }

  void saveDate(String? email, String? uid, String? name, String? phone,
      String? date, String? adreessescity, adreessesstreet, adreessescountry) {
    FirebaseFirestore.instance.collection("users").doc(uid).set({
      "name": name,
      "email": email,
      "phone": phone,
      "date": date,
      "uid": uid,
      "adreessescountry": adreessescountry,
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCp_ByMCZW8m0s3KmAbIENDvR2Zc_HkBJyYw&usqp=CAU',
      "adreessesstreet": adreessesstreet,
      "adreessescity": adreessescity,
    }).then((value) {
      //
      emit(SignUpSuccessState(msg: email));
    }).catchError((onError) {
      //
      emit(SignUpErrorState());
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
}
