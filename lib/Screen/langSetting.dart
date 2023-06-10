import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:testbuild/Screen/changeAdress.dart';

class langsetting extends StatefulWidget {
  const langsetting({super.key});

  @override
  State<langsetting> createState() => _langsettingState();
}

class _langsettingState extends State<langsetting> {
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(
        builder: (context) => changeadress(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: Text(
          'Language Setting',
          style: TextStyle(fontSize: 14),
        ).tr(),
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Language',
                style: TextStyle(fontSize: 14),
              ).tr(),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Language',
                    style: TextStyle(fontSize: 14),
                  ).tr(),
                  Text(
                    'English (United States)',
                    style: TextStyle(fontSize: 14),
                  ),
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.arrow_forward_ios))
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
