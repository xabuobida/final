import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testbuild/view/Profile/edit_profile.dart';
import 'package:testbuild/viewModel/Profile/cubit.dart';
import 'package:testbuild/viewModel/Profile/states.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                //
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditProfile(),
                    ));
              },
              icon: Icon(Icons.edit))
        ],
      ),
      body: BlocProvider(
        create: (context) => ProfileCubit()
          ..getdata()
          ..infolist,
        child: BlocConsumer<ProfileCubit, ProfileStates>(
          builder: (context, state) {
            return context.read<ProfileCubit>().data0.isEmpty
                ? CircularProgressIndicator()
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          width: double.infinity,
                          color: Theme.of(context).primaryColor,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                radius: 70,
                                child: !context.read<ProfileCubit>().isPick!
                                    ? Image.network(
                                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCp_ByMCZW8m0s3KmAbIENDvR2Zc_HkBJyYw&usqp=CAU")
                                    : Image.network(
                                        "${context.read<ProfileCubit>().data0.where((element) {
                                              var x = element.email ==
                                                  '${FirebaseAuth.instance.currentUser!.email}';
                                              return x;
                                            }).first.image}"),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                " Name :- ${context.read<ProfileCubit>().data0.where((element) {
                                      var x = element.email ==
                                          '${FirebaseAuth.instance.currentUser!.email}';
                                      return x;
                                    }).first.name}",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 10,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 20),
                          child: TextField(
                            enabled: false,
                            decoration: InputDecoration(
                                labelText:
                                    'phone  ${context.read<ProfileCubit>().data0.where((element) {
                                          var x = element.email ==
                                              '${FirebaseAuth.instance.currentUser!.email}';
                                          return x;
                                        }).first.phone}',
                                border: OutlineInputBorder(),
                                hintText: ""),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 20),
                          child: TextField(
                            enabled: false,
                            decoration: InputDecoration(
                                labelText:
                                    '${context.read<ProfileCubit>().data0.where((element) {
                                          var x = element.email ==
                                              '${FirebaseAuth.instance.currentUser!.email}';
                                          return x;
                                        }).first.email}',
                                border: OutlineInputBorder(),
                                hintText: " email "),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 30.0, right: 20, left: 20),
                          child: AbsorbPointer(
                            child: TextField(
                              readOnly: true,
                              decoration: InputDecoration(
                                  enabled: false,
                                  prefixText: 'data',
                                  labelText:
                                      '${context.read<ProfileCubit>().data0.where((element) {
                                            var x = element.email ==
                                                '${FirebaseAuth.instance.currentUser!.email}';
                                            return x;
                                          }).first.date}',
                                  border: OutlineInputBorder(),
                                  hintText: ""),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
          },
          listener: (context, state) {},
        ),
      ),
    );
  }
}
