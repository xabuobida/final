import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class textfieldinfo extends StatelessWidget {
  final double width, hight;
  const textfieldinfo({
    super.key,
    required this.width,
    required this.hight,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Container(
        width: width,
        height: hight,
        child: TextField(
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 50),
              border: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder()),
          style: Theme.of(context).textTheme.headline6,
          keyboardType: TextInputType.emailAddress,
          inputFormatters: [LengthLimitingTextInputFormatter(3)],
        ),
      ),
    );
  }
}
