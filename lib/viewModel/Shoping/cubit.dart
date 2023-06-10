
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:testbuild/model/cartmodel.dart';

import 'package:testbuild/viewModel/Shoping/state.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitState());
  List<CartModel> data0 = [];
void getdata(){
  FirebaseFirestore.instance.collection('Cart').where('uid',isEqualTo: FirebaseAuth.instance.currentUser!.uid.toString()).get().then((value) {
    print('${value.docs.toString()}');
     for (var element in value.docs) {
        data0.add(CartModel.fromJson(element.data()));
      }
      emit(ShopSuccustState());
  });
}
}
