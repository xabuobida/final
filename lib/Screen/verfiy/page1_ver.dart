import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class verpage1 extends StatefulWidget {
  const verpage1({super.key});

  @override
  State<verpage1> createState() => _verpage1State();
}

class _verpage1State extends State<verpage1> {
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
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(
                  height: heightScreen * 0.15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Row(
                    children: [
                      SizedBox(
                          width: widthScreen * 0.15,
                          height: heightScreen * 0.07,
                          child: TextField(
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                hintText: '+91',
                                enabledBorder: OutlineInputBorder()),
                            style: Theme.of(context).textTheme.headline6,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(3)
                            ],
                          )),
                      SizedBox(
                          width: widthScreen * 0.60,
                          height: heightScreen * 0.07,
                          child: TextField(
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                hintText: '785798537',
                                enabledBorder: OutlineInputBorder()),
                            style: Theme.of(context).textTheme.headline6,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(15)
                            ],
                          ))
                    ],
                  ),
                ),
                SizedBox(height: heightScreen * 0.20),
                Container(
                  alignment: const Alignment(0, 0.80),
                  child: SizedBox(
                    width: widthScreen * 0.8,
                    height: heightScreen * 0.08,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed('page2ver');
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
