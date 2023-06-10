import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class introPage3 extends StatefulWidget {
  const introPage3({super.key});

  @override
  State<introPage3> createState() => _introPage3State();
}

class _introPage3State extends State<introPage3> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(
              height: 160,
            ),
            Image.asset('lib/images/5.png'),
            SizedBox(
              height: 20,
            ),
            Text(
              'Delivery Arrived',
              style: TextStyle(fontFamily: 'Poppins-SemiBold'),
            ).tr(),
            SizedBox(
              height: 10,
            ),
            Text(
              'Order is arrived at your Place',
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
