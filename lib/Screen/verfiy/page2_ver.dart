import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:testbuild/Screen/verfiy/page3_ver.dart';

class verpage2 extends StatefulWidget {
  const verpage2({super.key});

  @override
  State<verpage2> createState() => _verpage2State();
}

class _verpage2State extends State<verpage2> {
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(
        builder: (context) => verpage3(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: 180),
            Center(child: Image.asset('lib/images/proload.png')),
            SizedBox(
              height: 54,
            ),
            Text(
              'Verifying Your Mobile Number',
              style: TextStyle(fontFamily: 'Poppins'),
            ).tr(),
          ],
        ),
      ),
    );
  }
}
