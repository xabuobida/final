// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:testbuild/custom_widget/custom_appbar.dart';
// import 'package:testbuild/custom_widget/custom_drawer.dart';
// import 'package:testbuild/custom_widget/fu_card.dart';
// import 'package:testbuild/custom_widget/homecard.dart';
// import 'package:testbuild/viewModel/HomePage/cubit.dart';
// import 'package:testbuild/viewModel/HomePage/state.dart';

// class tabbarpage extends StatefulWidget {
//   const tabbarpage({super.key});
//   @override
//   State<tabbarpage> createState() => _tabbarpageState();
// }

// class _tabbarpageState extends State<tabbarpage> with TickerProviderStateMixin {
//   @override
//   Widget build(BuildContext context) {
//     double widthScreen = MediaQuery.of(context).size.width;
//     double heightScreen = MediaQuery.of(context).size.height;
//     return Stack(children: [
//       Scaffold(
//           appBar: PreferredSize(
//               preferredSize: const Size.fromHeight(100),
//               child: custom_appbar()),
//           drawer: custom_Darawer(),
//           body: Padding(
//             padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   Container(
//                     color: Colors.white,
//                     width: double.infinity,
//                     height: 20,
//                     child: Container(
//                         color: Colors.white,
//                         child: ListView.builder(
//                           itemCount: 20,
//                           itemBuilder: (context, index) {
//                             FuCard(image: 'images/fruit.png',
//                             price: '20',
//                             title: 'asdf',);
//                           },
//                         )),
//                   ),
//                 ],
//               ),
//             ),
//           )
//          ),
//       Positioned(
//         top: 99,
//         child: Column(
//           children: [
//             SizedBox(
//               width: MediaQuery.of(context).size.width * 0.99,
//               height: 50,
//               child: const Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 20),
//                 child: Card(
//                   elevation: 10,
//                   child: TextField(
//                     decoration: InputDecoration(
//                       prefixIcon: Icon(Icons.search),
//                       hintText: "search",
//                       contentPadding: EdgeInsets.all(3),
//                       enabledBorder: OutlineInputBorder(
//                         borderSide: BorderSide(width: 1, color: Colors.white),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     ]);
//   }
// }
