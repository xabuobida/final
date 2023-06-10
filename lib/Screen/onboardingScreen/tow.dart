import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class introPage2 extends StatefulWidget {
  const introPage2({super.key});

  @override
  State<introPage2> createState() => _introPage2State();
}

class _introPage2State extends State<introPage2> {
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
            Image.asset('lib/images/4.png'),
            SizedBox(
              height: 20,
            ),
            Text(
              'Delivery on the way',
              style: TextStyle(fontFamily: 'Poppins-SemiBold'),
            ).tr(),
            SizedBox(
              height: 10,
            ),
            Text(
              'Get your order by speed delivery',
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
