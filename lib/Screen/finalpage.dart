import 'package:flutter/material.dart';

class finalpage extends StatefulWidget {
  const finalpage({super.key});

  @override
  State<finalpage> createState() => _finalpageState();
}

class _finalpageState extends State<finalpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 79, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 18,
                ),
                Text(
                  'Total Bill : Rs 570',
                  style: TextStyle(fontSize: 14),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                ImageIcon(AssetImage('lib/images/21.png')),
                SizedBox(
                  width: 18,
                ),
                Text(
                  'Organic Fruit Shop',
                  style: TextStyle(fontSize: 14),
                )
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Row(
                  children: [
                    Icon(Icons.location_pin),
                    SizedBox(
                      width: 18,
                    ),
                    Text(
                      'Home Adress',
                      style: TextStyle(fontSize: 14),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              width: 43,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 43),
              child: Row(
                children: [
                  Text(
                    'D Block Ram Nagar ,Near Sai Petrol \nPump Ring Road Nagpur-440001',
                    style: TextStyle(fontSize: 10, color: Colors.grey),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.black,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                'Credit/Debit Cards',
                style: TextStyle(fontSize: 16, fontFamily: 'Poppins-SemiBold'),
              ),
              Text(
                'ADD NEW CARD',
                style: TextStyle(
                    color: Colors.green, fontFamily: 'Poppins-SemiBold'),
              ),
            ]),
            Row(
              children: [
                SizedBox(
                    width: 40,
                    height: 27,
                    child: ImageIcon(AssetImage('lib/images/23.png'))),
                SizedBox(
                  width: 10,
                ),
                Column(
                  children: [Text('************4356'), Text('Manish Chutake')],
                )
              ],
            ),
            Divider(
              color: Colors.black,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Save and Pay via cards',
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                        width: 70,
                        height: 70,
                        child: Image.asset('lib/images/mastercard.png')),
                    SizedBox(
                      width: 17,
                    ),
                    Container(
                      child: SizedBox(
                          width: 70,
                          height: 70,
                          child: Image.asset('lib/images/maestro.png')),
                    ),
                    SizedBox(
                      width: 17,
                    ),
                    Container(
                      child: SizedBox(
                          width: 70,
                          height: 70,
                          child: Image.asset('lib/images/visa.png')),
                    )
                  ],
                ),
                SizedBox(
                  height: 38,
                ),
                Text(
                  'Wallet Method',
                  style:
                      TextStyle(fontSize: 16, fontFamily: 'Poppins-SemiBold'),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Container(
                      child: SizedBox(
                          width: 60,
                          height: 60,
                          child: Image.asset('lib/images/333.png')),
                    ),
                    SizedBox(
                      width: 18,
                    ),
                    Text(
                      'Phone pay',
                      style: TextStyle(fontSize: 14, fontFamily: 'Poppins'),
                    )
                  ],
                ),
                Divider(
                  color: Colors.black,
                ),
                Row(
                  children: [
                    Container(
                      child: SizedBox(
                          width: 60,
                          height: 60,
                          child: Image.asset('lib/images/googlepay.png')),
                    ),
                    SizedBox(
                      width: 18,
                    ),
                    Text(
                      'Google pay',
                      style: TextStyle(fontSize: 14, fontFamily: 'Poppins'),
                    )
                  ],
                ),
                Divider(
                  color: Colors.black,
                ),
                Row(
                  children: [
                    Container(
                      child: SizedBox(
                          width: 60,
                          height: 60,
                          child: Image.asset('lib/images/paypal.png')),
                    ),
                    SizedBox(
                      width: 18,
                    ),
                    Text(
                      'Phone pay',
                      style: TextStyle(fontSize: 14, fontFamily: 'Poppins'),
                    )
                  ],
                ),
                SizedBox(
                  height: 84,
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed('page2ver');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green, // Background color
                    ),
                    child: const Text(
                      'PAY NOW',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
