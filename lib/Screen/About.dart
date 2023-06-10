

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Fruit Market').tr(),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to the Fruit Market!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ).tr(),
            SizedBox(height: 16),
            Text(
              'We are a trusted fruit market offering a wide variety of fresh and delicious fruits. Our mission is to provide high-quality fruits to our customers and promote a healthy lifestyle. With years of experience in the industry, we take pride in sourcing the finest fruits from local farms and delivering them to your doorstep.',
              style: TextStyle(fontSize: 16),
            ).tr(),
            SizedBox(height: 16),
            Text(
              'Visit us today and explore our vast selection of fruits!',
              style: TextStyle(fontSize: 16),
            ).tr(),
          ],
        ),
      ),
    );
  }
}
