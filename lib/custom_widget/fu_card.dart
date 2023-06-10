import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class FuCard extends StatelessWidget {
  final String? price;
  final String? title;
  final String? image;
  const FuCard({super.key, this.price, this.title, this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        height: 260,
        width: double.infinity,
        // color: Colors.amber,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    image!,
                    height: 160,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(' Title  : ${title } ',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),).tr(),
            ), SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(' Price  : ${price } \$',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),).tr(),
            )
          ],
        ),
      ),
    );
  }
}
