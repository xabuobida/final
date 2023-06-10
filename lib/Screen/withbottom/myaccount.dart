import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testbuild/Screen/About.dart';
import 'package:testbuild/Screen/changelanguage.dart';
import 'package:testbuild/Screen/supportpage.dart';
import 'package:testbuild/view/Profile/edit_profile.dart';
import 'package:testbuild/viewModel/Profile/cubit.dart';
import 'package:testbuild/viewModel/Profile/states.dart';

import '../../view/Signin/Signin.dart';
import '../changeAdress.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ccc) => ProfileCubit()..getdata()..getinfo(),
      child: Scaffold(
        body: BlocConsumer<ProfileCubit, ProfileStates>(
          builder: (ccc, state) {
            return ccc.read<ProfileCubit>().infolist.isEmpty
                ? Center(child: CircularProgressIndicator())
                : Column(children: [
                    Container(
                      width: double.infinity,
                      height: 229,
                      color: Colors.green,
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 65,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: SizedBox(
                                    height: 85,
                                    width: 85,
                                    child:  ccc.read<ProfileCubit>().infolist.isEmpty ? Image.network(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCp_ByMCZW8m0s3KmAbIENDvR2Zc_HkBJyYw&usqp=CAU"):Image.network(
                                      '${ccc.read<ProfileCubit>().infolist[0].image}',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              '${ccc.read<ProfileCubit>().infolist[0].name}',
                              style: TextStyle(
                                  fontFamily: 'Poppins-SemiBold',
                                  fontSize: 16,
                                  color: Colors.white),
                            ),
                            Text(
                              '${ccc.read<ProfileCubit>().infolist[0].email}',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 12,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AboutUs(),
                                  ));
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.info,
                                  color: Colors.green,
                                ),
                                SizedBox(
                                  width: 18,
                                ),
                                Text(
                                  'About',
                                  style: TextStyle(fontSize: 14),
                                ).tr()
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ChangeLanguage(),
                                  ));
                            },
                            child: Row(
                              children: [
                                Icon(Icons.language, color: Colors.green),
                                SizedBox(
                                  width: 18,
                                ),
                                Text(
                                  'Change Languages',
                                  style: TextStyle(fontSize: 14),
                                ).tr()
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => changeadress(),
                                  ));
                            },
                            child: Row(
                              children: [
                                Icon(Icons.location_on, color: Colors.green),
                                SizedBox(
                                  width: 18,
                                ),
                                Text(
                                  'Change Address',
                                  style: TextStyle(fontSize: 14),
                                ).tr()
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EditProfile(),
                                  ));
                            },
                            child: Row(
                              children: [
                                Icon(Icons.edit, color: Colors.green),
                                SizedBox(
                                  width: 18,
                                ),
                                Text(
                                  'Edit Profile',
                                  style: TextStyle(fontSize: 14),
                                ).tr()
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SupportPage(),
                                  ));
                            },
                            child: Row(
                              children: [
                                Icon(Icons.support, color: Colors.green),
                                SizedBox(
                                  width: 18,
                                ),
                                Text(
                                  'Support Page',
                                  style: TextStyle(fontSize: 14),
                                ).tr()
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          InkWell(
                            onTap: () {
                              //
                              FirebaseAuth.instance.signOut().then((value) {
                                //
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SigInScreen()),
                                  (route) => false,
                                );
                              }).catchError((e) {
                                //
                              });
                            },
                            child: Row(
                              children: [
                                Icon(Icons.logout, color: Colors.green),
                                SizedBox(
                                  width: 18,
                                ),
                                Text(
                                  'Log Out',
                                  style: TextStyle(fontSize: 14),
                                ).tr()
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]);
          },
          listener: (ccc, state) {},
        ),
      ),
    );
  }
}
