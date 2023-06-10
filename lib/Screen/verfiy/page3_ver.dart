import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:testbuild/Screen/verfiy/page4_ver.dart';

class verpage3 extends StatefulWidget {
  const verpage3({super.key});

  @override
  State<verpage3> createState() => _verpage3State();
}

class _verpage3State extends State<verpage3> {
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(
        builder: (context) => verpage4(),
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
            Center(child: Image.asset('lib/images/donever.png')),
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
