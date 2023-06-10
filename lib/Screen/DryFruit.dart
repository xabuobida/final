import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testbuild/Screen/Details.dart';
import 'package:testbuild/viewModel/HomePage/cubit.dart';
import 'package:testbuild/viewModel/HomePage/state.dart';

import '../custom_widget/fu_card.dart';

class DryFruitScreen extends StatelessWidget {
  const DryFruitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var DryFruitref =
        FirebaseFirestore.instance.collection('Organic Vegetables').get();

    return Stack(children: [
      Scaffold(
        body: FutureBuilder(
          future: DryFruitref,
          builder: (context, snapshot) {
            return FutureBuilder(
              future: DryFruitref,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.separated(

                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Details(
                                image:
                                    snapshot.data!.docs[index].data()['image'],
                                title:
                                    snapshot.data!.docs[index].data()['title'],
                                price:
                                    snapshot.data!.docs[index].data()['price'],
                                uid: FirebaseAuth.instance.currentUser!.uid,
                              ),
                            ),
                          );
                        },
                        child: FuCard(
                          price:
                              '${snapshot.data!.docs[index].data()['price']}',
                          title:
                              '${snapshot.data!.docs[index].data()['title']}',
                          image:
                              '${snapshot.data!.docs[index].data()['image']}',
                        ),
                      );
                    }, separatorBuilder: (BuildContext context, int index) { return Divider(color: Colors.black,
                    height:0.6,); },
                  );
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }
                if (snapshot.hasError) {
                  return Text('Error data');
                }
                ;
                return Text('data');
              },
            );
          },
        ),
      ),
    ]);
  }
}
