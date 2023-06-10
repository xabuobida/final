import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class notification extends StatefulWidget {
  const notification({super.key});

  @override
  State<notification> createState() => _notificationState();
}

class _notificationState extends State<notification> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Notification',
            style: TextStyle(fontSize: 14),
          ),
        ),
        body: ListView.separated(
            itemBuilder: (context, index) {
              return cartitem();
            },
            separatorBuilder: (context, index) {
              return Divider(
                color: Colors.grey,
                height: 2,
              );
            },
            itemCount: 5),
      ),
    );
  }
}

class cartitem extends StatelessWidget {
  const cartitem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          height: 120,
          width: double.infinity,
          color: Colors.white,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            SizedBox(
                height: 90, width: 90, child: Image.asset('lib/images/7.jpg')),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 20, 0, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Buy 1kg Get 200gm Free'),
                  Text(
                    'Buy 1 Get 1 Free for small sizes',
                    style: TextStyle(fontSize: 10),
                  ),
                  Text(' Until Feb 27,2021 .'),
                  Text('Few minutes ago'),
                ],
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.dehaze_outlined),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ]),
    );
  }
}
