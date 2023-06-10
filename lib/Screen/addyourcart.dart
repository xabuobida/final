import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testbuild/Screen/finalpage.dart';

import 'package:testbuild/Screen/verfiy/page1_ver.dart';

class addyourcart extends StatefulWidget {
  const addyourcart({super.key});

  @override
  State<addyourcart> createState() => _addyourcartState();
}

class _addyourcartState extends State<addyourcart> {
  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Add your Card',
            style: TextStyle(fontSize: 14, fontFamily: 'Poppins-SemiBold'),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: heightScreen * 0.01,
                ),
                Center(
                  child: SizedBox(
                      width: widthScreen * 0.60,
                      height: heightScreen * 0.15,
                      child: Image.asset('lib/images/mycart.png')),
                ),
                SizedBox(
                  height: heightScreen * 0.03,
                ),
                Text(
                  'Cardholder Name',
                  style: TextStyle(fontSize: 12, fontFamily: 'Poppins'),
                ),
                SizedBox(
                  height: heightScreen * 0.03,
                ),
                textcart(
                  widths: double.infinity,
                  heights: heightScreen * 0.06,
                  hint: 'Manish Chutake',
                ),
                SizedBox(
                  height: heightScreen * 0.03,
                ),
                Text(
                  'Card Number',
                  style: TextStyle(fontSize: 12, fontFamily: 'Poppins'),
                ),
                SizedBox(
                  height: heightScreen * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    textcart(
                      widths: widthScreen * 0.19,
                      heights: heightScreen * 0.06,
                      hint: 'Manish Chutake',
                    ),
                    textcart(
                      widths: widthScreen * 0.19,
                      heights: heightScreen * 0.06,
                      hint: 'Manish Chutake',
                    ),
                    textcart(
                      widths: widthScreen * 0.19,
                      heights: heightScreen * 0.06,
                      hint: 'Manish Chutake',
                    ),
                    textcart(
                      widths: widthScreen * 0.19,
                      heights: heightScreen * 0.06,
                      hint: 'Manish Chutake',
                    ),
                  ],
                ),
                SizedBox(
                  height: heightScreen * 0.03,
                ),
                Text(
                  'Valid Thru',
                  style: TextStyle(fontSize: 12, fontFamily: 'Poppins'),
                ),
                SizedBox(
                  height: heightScreen * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    textcart(
                      widths: 219,
                      heights: 45,
                      hint: 'Manish Chutake',
                    ),
                    Expanded(
                      child: textcart(
                        widths: 106,
                        heights: 45,
                        hint: 'Manish Chutake',
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'CVV/CVC',
                  style: TextStyle(fontSize: 12, fontFamily: 'Poppins'),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    textcart(
                      widths: 99,
                      heights: 45,
                      hint: 'Manish Chutake',
                    ),
                    SizedBox(
                      width: 21,
                    ),
                    Center(
                      child: Text(
                        '3 or 4 digit code',
                        style: TextStyle(fontSize: 12, fontFamily: 'Poppins'),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                SizedBox(
                  width: 18,
                  height: 13,
                  child: Checkbox(
                    value: true,
                    onChanged: (value) {
                      setState(() {
                        Icon(Icons.check);
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 47,
                ),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed('page2ver');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green, // Background color
                    ),
                    child: const Text(
                      'ADD CARD NUMBER',
                      style: TextStyle(fontSize: 14),
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

class textcart extends StatelessWidget {
  final double widths, heights;
  final String hint;
  const textcart({
    super.key,
    required this.widths,
    required this.heights,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: widths,
        height: heights,
        child: TextField(
          decoration: InputDecoration(
              hintText: '$hint ',
              filled: true,
              fillColor: Colors.white,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(1)),
              enabledBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(1))),
          style: Theme.of(context).textTheme.headline6,
          keyboardType: TextInputType.emailAddress,
          inputFormatters: [LengthLimitingTextInputFormatter(3)],
        ));
  }
}
