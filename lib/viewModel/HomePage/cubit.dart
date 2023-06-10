

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:testbuild/model/homemodel.dart';
import 'package:testbuild/viewModel/HomePage/state.dart';

class HomeCubit extends Cubit  <HomeStates>{





  HomeCubit():super(HomeInitState());
   List<homemodel>data0=[];
   List<homemodel>data1=[];
   List<homemodel>data2=[];
final   List<homemodel>data3=[];


   void getdata(){
    FirebaseFirestore.instance.collection('Allium Vegetabels').get().then((value){
      for (var element in value.docs) {
        data0.add(homemodel.fromJson(element.data()));
                data3.add(homemodel.fromJson(element.data()));

        
      }
                      emit(HomeSuccustState());

    });
    FirebaseFirestore.instance.collection('Mixed Vegetables Pack').where('title').get().then((value){
      for (var element in value.docs) {
        data1.add(homemodel.fromJson(element.data()));
                data3.add(homemodel.fromJson(element.data()));
                print(data3);

      }
                      emit(HomeSuccustState());

    });
    FirebaseFirestore.instance.collection('Organic Vegetables').get().then((value){
      for (var element in value.docs) {
        data2.add(homemodel.fromJson(element.data()));
                data3.add(homemodel.fromJson(element.data()));

      }
                      emit(HomeSuccustState());

    });
   }

}