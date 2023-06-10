import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testbuild/viewModel/ChangeAdreess/states.dart';

import '../../model/adreeesses.dart';

class ChangeAdressCubit extends Cubit<ChangeAdressStates> {
  ChangeAdressCubit() : super(ChangeAdressInitState());

  final List<ChangeAdressModel> data0 = [];

  Future<void> getinfo() async {
    FirebaseFirestore.instance.collection('users').where('uid',isEqualTo: FirebaseAuth.instance.currentUser!.uid.toString()).get().then((value) {
      for (var element in value.docs) {
        data0.add(ChangeAdressModel.fromJson(element.data()));
        print(data0);
      }
      emit(ChangeAdressSuccessState());
    });
    final SharedPreferences prefs = await SharedPreferences.getInstance();
  }
}
