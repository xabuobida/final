import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:testbuild/Screen/verfiy/page1_ver.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {


  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: heightScreen * .05,
              ),
              Image.asset('lib/images/market.png'),
              Text(
                'Fruit Market',
                style: TextStyle(
                    fontSize: 42,
                    fontFamily: 'Poppins-SemiBold',
                    color: Colors.green),
              ).tr(),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 56, 20, 64),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Enter Your Mobile Number',
                      hintStyle: TextStyle(fontSize: 12, fontFamily: 'Poppins'),
                      enabledBorder: OutlineInputBorder()),
                ),
              ),
              Text(
                'OR',
                style: TextStyle(fontSize: 14, fontFamily: 'Poppins-SemiBold'),
              ).tr(),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                      onPressed: () {},
                      icon: Container(
                          width: widthScreen * .09,
                          height: heightScreen * .04,
                          child: Image.asset('lib/images/g.png')),
                      label: Text('Log in With')),
                  SizedBox(
                    width: 5,
                  ),
                  ElevatedButton.icon(
                      onPressed: () {},
                      icon: Container(
                          width: widthScreen * .09,
                          height: heightScreen * .04,
                          child: Image.asset('lib/images/f.png')),
                      label: Text('Log in With').tr()),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
