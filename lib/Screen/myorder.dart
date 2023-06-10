import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:testbuild/Screen/withbottom/favorat.dart';

class myorder extends StatefulWidget {
  const myorder({super.key});

  @override
  State<myorder> createState() => _myorderState();
}

class _myorderState extends State<myorder> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'My Orders',
            style: TextStyle(fontSize: 14),
          ).tr(),
        ),
        body: ListView.separated(
            itemBuilder: (context, index) {
              return cartitem();
            },
            separatorBuilder: (context, index) {
              return Divider(
                color: Colors.grey,
                height: 2,
              );
            },
            itemCount: 5),
      ),
    );
  }
}

class cartitem extends StatelessWidget {
  const cartitem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: Column(children: [
        Container(
          height: 120,
          width: double.infinity,
          color: Colors.white,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            SizedBox(
                height: 90, width: 90, child: Image.asset('lib/images/7.jpg')),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 20, 0, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Grapes'),
                 
                  Text('Rate this Product'),
                  Text('Delivered on 24 Feb 2021.'),
                ],
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.arrow_forward_ios_outlined),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ]),
    );
  }
}
