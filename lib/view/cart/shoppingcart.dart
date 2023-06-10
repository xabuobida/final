import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testbuild/Screen/changeAdress.dart';
import 'package:testbuild/viewModel/Shoping/cubit.dart';
import 'package:testbuild/viewModel/Shoping/state.dart';

import '../home/home.dart';
class shoppingcart extends StatelessWidget {
  final String? price;
  final String? title;
  final String? image;
  shoppingcart({super.key, this.price, this.title, this.image});

  @override
  
  Widget build(BuildContext context) {
    var cartref = FirebaseFirestore.instance.collection('Cart').where('uid',isEqualTo: FirebaseAuth.instance.currentUser!.uid).get();
    return BlocProvider(
      create: (context) => ShopCubit()..getdata(),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text(
              'Shopping Cart',
              style: TextStyle(fontSize: 14),
            ),
          ),
          body: BlocConsumer<ShopCubit,ShopStates>(
            builder: (context, state) {
              return Column(
                children: [
                  Container(
                      height: 54,
                      width: double.infinity,
                      color: Colors.white,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Icon(Icons.location_on),
                            const Text(
                              'amman',
                              style: TextStyle(fontSize: 14),
                            ),
                            const Icon(Icons.arrow_downward),
                            InkWell(
                              onTap: () {
                                 Navigator.of(context).push(
                      MaterialPageRoute(
                      
                      builder: (context)=> changeadress()
                      
                       ),
                    
                     );
                              },
                              child: const Text(
                                'Change Address',
                                style:
                                    TextStyle(fontSize: 14, color: Colors.blueAccent),
                              ),
                            ),
                          ])),
                  Container(
                      height: 40,
                      width: double.infinity,
                      color: Colors.grey[300],
                      child:
                          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            'Vegetables',
                            style: TextStyle(fontSize: 14),
                          ),
                        )
                      ])),
                  Expanded(
                    child: FutureBuilder(
                      
                      future:cartref,
                      builder: (context, snapshot) {
                      return FutureBuilder(
                        
                        future: FirebaseFirestore.instance.collection('Cart').where('uid',isEqualTo: FirebaseAuth.instance.currentUser!.uid).get(),
                        builder: (context, snapshot) {
                          
                            if (snapshot.hasData) {
                               return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        return Dismissible(
                          onDismissed: (direction)async {
                           await FirebaseFirestore.instance.collection('Cart').doc(snapshot.data!.docs[index].id).delete();
                          },
                          key: UniqueKey(),
                          child: cardofshopping(
                            image:'${snapshot.data!.docs[index].data()['image']}',
                            price: '${snapshot.data!.docs[index].data()['price']}',
                            title: '${snapshot.data!.docs[index].data()['title']}',
                          ),
                        );
                      },
                    );
                              
                            }
                            if (snapshot.connectionState==ConnectionState.waiting) {
                              return const Center(child: CircularProgressIndicator());
                              
                            }
                            if (snapshot.hasError) {
                              return const Text('Error data');
                              
                            };
                            return const Text('data');
                      },);
                    },),
                  )
                ],
              );
            },
            listener: (context, state) {
            },
          )
        ),
      ),
    );
  }
}

class cardofshopping extends StatelessWidget {
  final String? price;
  final String? title;
  final String? image;

  const cardofshopping({
    super.key,
    this.price,
    this.title,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;
    return Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  height: heightScreen * 0.19,
                  width: widthScreen * 0.3,
                  child: Image.network(
                    '${image}',
                    fit: BoxFit.fill,
                  )),
              SizedBox(width: widthScreen * 0.05),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${title}',
                    style: const TextStyle(fontSize: 10),
                  ),
                  SizedBox(
                    height: heightScreen * 0.04,
                  ),
                  Text('${price}', style: const TextStyle(fontSize: 10)),
                  SizedBox(
                    height: heightScreen * 0.04,
                  ),
                  const Text('150 Per/ kg', style: TextStyle(fontSize: 10))
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text('Rs 40 Saved', style: TextStyle(fontSize: 10)),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                
                  SizedBox(
                    height: heightScreen * 0.07,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: heightScreen * 0.04,
                        width: widthScreen * 0.06,
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(color: Colors.black)),
                            child: const Center(
                              child: Text(
                                '-',
                                style: TextStyle(fontSize: 20),
                              ),
                            )),
                      ),
                      const Text('1'),
                      SizedBox(
                        width: widthScreen * 0.01,
                      ),
                      SizedBox(
                        height: heightScreen * 0.04,
                        width: widthScreen * 0.06,
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(color: Colors.black)),
                            child: const Center(
                              child: Text(
                                '+',
                                style: TextStyle(fontSize: 20),
                              ),
                            )),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
