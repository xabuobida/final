import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:testbuild/Screen/onpbarding.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override
  // void initState() {
  //   // TODO: implement initState
  //   Future.delayed(Duration(seconds: 3), () {
  //     Navigator.of(
  //       context,
  //     ).pushReplacement(MaterialPageRoute(
  //       builder: (context) => onboarding(),
  //     ));
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color.fromRGBO(105, 160, 58, 1),
      body: Container(
        width: widthScreen,
        height: heightScreen,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: heightScreen * 0.3,
              ),
              Center(
                child: Text(
                  'Fruit Market',
                  style: TextStyle(color: Colors.white, fontSize: 42),
                ),
              ),
              SizedBox(
                height: heightScreen * .10,
              ),
              Image.asset(
                'lib/images/fruit.png',
                fit: BoxFit.cover,
              )
            ]),
      ),
    );
  }
}
