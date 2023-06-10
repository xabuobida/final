import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:testbuild/Screen/About.dart';
import 'package:testbuild/custom_widget/textfield.dart';

class verpage4 extends StatefulWidget {
  const verpage4({super.key});

  @override
  State<verpage4> createState() => _verpage4State();
}

class _verpage4State extends State<verpage4> {
  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                SizedBox(
                  height: heightScreen * 0.15,
                ),
                Text('Enter The 4 digit code that was ').tr(),
                SizedBox(
                  height: heightScreen * 0.03,
                ),
                Text('send to your Mobile Number').tr(),
                SizedBox(
                  height: heightScreen * 0.12,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      textfield_ver(numberofdigit: 1),
                      SizedBox(
                        width: widthScreen * 0.01,
                      ),
                      textfield_ver(numberofdigit: 1),
                      SizedBox(
                        width: widthScreen * 0.01,
                      ),
                      textfield_ver(numberofdigit: 1),
                      SizedBox(
                        width: widthScreen * 0.01,
                      ),
                      textfield_ver(numberofdigit: 1),
                    ],
                  ),
                ),
                SizedBox(height: heightScreen * 0.09),
                Container(
                  alignment: const Alignment(0, 0.80),
                  child: SizedBox(
                    width: widthScreen * 0.99,
                    height: heightScreen * 0.07,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(
                          context,
                        ).pushReplacement(MaterialPageRoute(
                          builder: (context) => AboutUs(),
                        ));
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green, // Background color
                      ),
                      child: const Text(
                        'VERIFY',
                        style: TextStyle(fontSize: 14),
                      ).tr(),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(
                      context,
                    ).pushReplacement(MaterialPageRoute(
                      builder: (context) => AboutUs(),
                    ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 12, 40, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Resend Again?',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 10,
                              color: Color.fromARGB(110, 24, 143, 179)),
                        ).tr(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
