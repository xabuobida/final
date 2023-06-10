import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testbuild/Screen/Details.dart';
import 'package:testbuild/custom_widget/fu_card.dart';

import 'package:testbuild/viewModel/HomePage/cubit.dart';
import 'package:testbuild/viewModel/HomePage/state.dart';

class FruitScreen extends StatelessWidget {
  const FruitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var  Fruitsref =
        FirebaseFirestore.instance.collection('Mixed Vegetables Pack').get();

    return Stack(children: [
      Scaffold(
        body: FutureBuilder(
          future: Fruitsref,
          builder: (context, snapshot) {
            return FutureBuilder(
              future: Fruitsref,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.separated( separatorBuilder: (BuildContext context, int index) { return Divider(color: Colors.black,
                    height:0.6,); },
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: () {
                          
                  
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Details(
                                image: snapshot.data!.docs[index].data()['image'],
                                title: snapshot.data!.docs[index].data()['title'],
                                price:snapshot.data!.docs[index].data()['price'],
                                uid: FirebaseAuth.instance.currentUser!.uid,
                              ),
                            ),
                          );
                        },
                        child: FuCard(
                          price: '${snapshot.data!.docs[index].data()['price']}',
                          title: '${snapshot.data!.docs[index].data()['title']}',
                          image: '${snapshot.data!.docs[index].data()['image']}',
                        ),
                      );
                    },
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
