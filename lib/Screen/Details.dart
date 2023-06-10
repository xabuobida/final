import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testbuild/view/cart/shoppingcart.dart';
import '../view/home/home.dart';
import '../viewModel/HomePage/cubit.dart';
import '../viewModel/HomePage/state.dart';
import '../viewModel/Shoping/state.dart';

class Details extends StatelessWidget {
  final String? title, price, image, uid, desc;

  Details({super.key, this.title, this.price, this.image, this.uid, this.desc});

  @override
  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_sharp)),
        title: Text(
          'Details',
          style: TextStyle(fontFamily: 'Poppins-MediumItalic'),
        ).tr(),
      ),
      body: Padding(
          padding: EdgeInsets.all(20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              width: widthScreen * 0.8,
              height: 176,
              child: Image.network(
                '${image!}',
                fit: BoxFit.fill,
              ),
            ),
            Row(
              children: [
                Text(
                  '$title',
                  style:
                      TextStyle(fontFamily: 'Poppins-SemiBold', fontSize: 18),
                ),
              ],
            ),
            Flexible(
              child: Text(
                '$desc',
                maxLines: 10,
                style: TextStyle(fontFamily: 'Poppins', fontSize: 12),
              ),
            ),
            SizedBox(
              height: heightScreen * 0.03,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: heightScreen * 0.2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '$price \$ Per/ kg',
                      style: TextStyle(
                          fontFamily: 'Poppins-SemiBold', fontSize: 16),
                    ),
                    SizedBox(
                      height: heightScreen * 0.19,
                    ),
                    Container(
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () {
                          FirebaseFirestore.instance.collection('Cart').add({
                            'title': '$title',
                            'price': '$price',
                            'image': '$image',
                            'uid':
                                '${FirebaseAuth.instance.currentUser!.uid.toString()}',
                            'cartid':
                                '${FirebaseFirestore.instance.collection('Cart').doc().get().then((value) {})}',
                          }).then((value) => (value) {});
                          var snackBar = SnackBar(
                            content: Text(
                              "Add To Cart SuccessFully ",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            backgroundColor: Colors.green,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green, // Background color
                        ),
                        child: const Text(
                          'Add To Cart',
                          style: TextStyle(fontSize: 14),
                        ).tr(),
                      ),
                    ),
                  ],
                )
              ],
            )
          ])),
    );
  }
}
