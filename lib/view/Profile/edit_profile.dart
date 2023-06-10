import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testbuild/viewModel/Profile/states.dart';

import '../../viewModel/Profile/cubit.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController controllerDate = TextEditingController();
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerMobile = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();

  var dateof = DateTime.now();
  @override
  void dispose() {
    controllerDate.dispose();
    controllerMobile.dispose();
    controllerName.dispose();
    controllerEmail.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit()
        ..getdata()
        ..getdata(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
        ),
        body: BlocConsumer<ProfileCubit, ProfileStates>(
          builder: (context, state) {
            return context.read<ProfileCubit>().data0.isEmpty
                ? CircularProgressIndicator()
                : ListView(
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      Center(
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            CircleAvatar(
                              radius: 70,
                              child: !context.read<ProfileCubit>().isPick!
                                  ? Image.network(
                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCp_ByMCZW8m0s3KmAbIENDvR2Zc_HkBJyYw&usqp=CAU",
                                      fit: BoxFit.cover,
                                    )
                                  : Image.file(
                                      File(context
                                          .read<ProfileCubit>()
                                          .image!
                                          .path),
                                      fit: BoxFit.fitWidth,
                                    ),
                            ),
                            CircleAvatar(
                              radius: 20,
                              child: IconButton(
                                  onPressed: () {
                                    // Open the Camera
                                    context.read<ProfileCubit>().imagePick();
                                  },
                                  icon: const Icon(
                                    Icons.photo_camera_rounded,
                                    color: Colors.white,
                                  )),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 20),
                        child: TextField(
                          controller: controllerName,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText:
                                  "name ${context.read<ProfileCubit>().data0.where((element) {
                                        var x = element.email ==
                                            '${FirebaseAuth.instance.currentUser!.email}';
                                        return x;
                                      }).first.name} "),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 20),
                        child: TextField(
                          controller: controllerMobile,
                          decoration:  InputDecoration(
                              border: OutlineInputBorder(), hintText: "phone  ${context.read<ProfileCubit>().data0.where((element) {
                                        var x = element.email ==
                                            '${FirebaseAuth.instance.currentUser!.email}';
                                        return x;
                                      }).first.phone}"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 20),
                        child: TextField(
                          controller: controllerEmail,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(), hintText: " email ${context.read<ProfileCubit>().data0.where((element) {
                                        var x = element.email ==
                                            '${FirebaseAuth.instance.currentUser!.email}';
                                        return x;
                                      }).first.email}"),
                        ),
                      ),
 Padding(
                  padding:
                      const EdgeInsets.only(top: 30.0, right: 20, left: 20),
                  child: GestureDetector(
                    onTap: () {
                      context.read<ProfileCubit>().selectDateTime(context);
                    },
                    child: AbsorbPointer(
                      child: TextField(
                        readOnly: true,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText:
                                "${context.read<ProfileCubit>().data0.where((element) {
                                        var x = element.email ==
                                            '${FirebaseAuth.instance.currentUser!.email}';
                                        return x;
                                      }).first.date}"),
                      ),
                    ),
                  ),
                ),

                      // Padding(
                      //   padding: const EdgeInsets.symmetric(
                      //       horizontal: 20.0, vertical: 20),
                      //   child: TextField(
                          
                      //     controller: controllerDate,
                      //     decoration:  InputDecoration(
                      //         border: OutlineInputBorder(), hintText: "Date  ${context.read<ProfileCubit>().data0.where((element) {
                      //                   var x = element.email ==
                      //                       '${FirebaseAuth.instance.currentUser!.email}';
                      //                   return x;
                      //                 }).first.date}"),
                      //   ),
                      // ),
                      
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(
                      //       horizontal: 20.0, vertical: 20),
                      //   child: SizedBox(
                      //     height: 50,
                      //     child: ElevatedButton(
                      //       onPressed: () async {
                      //         DateTime? newDate = await showDatePicker(
                      //             context: context,
                      //             initialDate: dateof,
                      //             firstDate: DateTime(1930),
                      //             lastDate: DateTime.now());
                      //         if (newDate == null) {
                      //           return null;
                      //         }
                      //         setState(() {
                      //           dateof = newDate;
                      //         });
                      //       },
                      //       child: const Text(
                      //         "Select Date",
                      //         style: TextStyle(fontSize: 20),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 20),
                        child: SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              context.read<ProfileCubit>().uploadImage(
                                    name: controllerName.text,
                                    phone: controllerMobile.text.trim(),
                                    date: controllerDate.text,
                                  );
                                  context.read<ProfileCubit>().editprofilef(date: controllerDate.text,email: controllerEmail.text,name: controllerName.text,phone: controllerMobile.text);
                            },
                            child: const Text(
                              "Save",
                              style: TextStyle(fontSize: 20),
                            ).tr(),
                          ),
                        ),
                      )
                    ],
                  );
          },
          listener: (context, state) {},
        ),
      ),
    );
  }
}
