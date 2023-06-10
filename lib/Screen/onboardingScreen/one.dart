import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:google_fonts/google_fonts.dart';

class introPage1 extends StatefulWidget {
  const introPage1({super.key});

  @override
  State<introPage1> createState() => _introPage1State();
}

class _introPage1State extends State<introPage1> {
  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Container(
        width: widthScreen,
        height: heightScreen,
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(
              height: 160,
            ),
            Image.asset('lib/images/3.png'),
            SizedBox(
              height: 20,
            ),
            Text(
              'E SHOPPING',
              style: TextStyle(fontFamily: 'Poppins-SemiBold'),
            ).tr(),
            SizedBox(
              height: 10,
            ),
            Text(
              'Explore top organic fruits & grab them',
              style: TextStyle(fontFamily: 'Poppins'),
            ).tr(),
            SizedBox(
              height: 35,
            ),
          ],
        ),
      ),
    );
  }
}
