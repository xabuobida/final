import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class favorat extends StatefulWidget {
  const favorat({super.key});

  @override
  State<favorat> createState() => _favoratState();
}

class _favoratState extends State<favorat> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Favourites',
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
    double widthScreen = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: Column(children: [
        Container(
          height: heightScreen * 0.19,
          width: widthScreen * 0.99,
          color: Colors.white,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            SizedBox(
                height: heightScreen * 0.19,
                width: widthScreen * 0.2,
                child: Image.asset('lib/images/images.jpg')),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 20, 0, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Grapes'),
                  Text(
                    'Pick up from organic farms',
                    style: TextStyle(fontSize: 10),
                  ),
                 
                  Container(
                    color: Colors.amber,
                    child: Row(
                      children: [
                        SizedBox(
                          height: heightScreen * 0.03,
                          width: widthScreen * 0.05,
                          child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black)),
                              child: Center(
                                child: Text(
                                  '-',
                                  style: TextStyle(fontSize: 20),
                                ),
                              )),
                        ),
                        Text('  1'),
                        SizedBox(
                          width: widthScreen * 0.05,
                        ),
                        SizedBox(
                          height: heightScreen * 0.03,
                          width: widthScreen * 0.05,
                          child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black)),
                              child: Center(
                                child: Text(
                                  '+',
                                  style: TextStyle(fontSize: 20),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('160 Per/ kg'),
                Container(
                  height: heightScreen * 0.04,
                  width: widthScreen * 0.17,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigator.of(context)
                      //     .pushReplacementNamed('page2ver');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green, // Background color
                    ),
                    child: const Text(
                      'Add',
                      style: TextStyle(fontSize: 8),
                    ),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ]),
    );
  }
}
