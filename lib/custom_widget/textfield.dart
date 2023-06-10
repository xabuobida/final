import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class textfield_ver extends StatelessWidget {
  final int numberofdigit;
  const textfield_ver({
    super.key,
    required this.numberofdigit,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: SizedBox(
          width: 52,
          height: 52,
          child: TextField(
            textAlign: TextAlign.center,
            onChanged: (value) {
              if (value == 1) {
                FocusScope.of(context).nextFocus();
              }
            },
            decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromRGBO(240, 240, 240, 1),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50))),
            style: Theme.of(context).textTheme.headline6,
            keyboardType: TextInputType.number,
            inputFormatters: [LengthLimitingTextInputFormatter(numberofdigit)],
          )),
    );
  }
}
