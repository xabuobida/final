import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testbuild/view/home/home.dart';
import 'package:testbuild/viewModel/SignUp/states.dart';

import '../../viewModel/SignUp/cubit.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}


class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerPhone = TextEditingController();
    TextEditingController controlleradreesses = TextEditingController();
        TextEditingController controlleradreessesstreet = TextEditingController();
    TextEditingController controlleradreessescity = TextEditingController();
    TextEditingController controlleradreessescountry = TextEditingController();



  @override
  void dispose() {
    controllerEmail.dispose();
    controllerName.dispose();
    controllerPassword.dispose();
    controllerPhone.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: Scaffold(
        appBar: AppBar(),
        body: BlocConsumer<SignUpCubit, SignUpStates>(
          builder: (context, state) {
            if (state is SignUpLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView(children: [
                              Center(child: Image.asset('lib/images/market.png')),

                 Center(
                   child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                    child: Text(
                      "Sign up",
                      style: TextStyle(fontSize: 35),
                    ).tr(),
                                 ),
                 ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 30.0, right: 20, left: 20),
                  child: TextField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: "Name"),
                    keyboardType: TextInputType.name,
                    controller: controllerName,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 30.0, right: 20, left: 20),
                  child: TextField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: "E-mail"),
                    controller: controllerEmail,
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 30.0, right: 20, left: 20),
                  child: TextField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: "Phone"),
                    controller: controllerPhone,
                    keyboardType: TextInputType.phone,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 30.0, right: 20, left: 20),
                  child: GestureDetector(
                    onTap: () {
                      context.read<SignUpCubit>().selectDateTime(context);
                    },
                    child: AbsorbPointer(
                      child: TextField(
                        readOnly: true,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText:
                                "${context.read<SignUpCubit>().selectTime}"),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 30.0, right: 20, left: 20),
                  child: TextField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: "Password"),
                    controller: controllerPassword,
                    obscureText: true,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 30.0, right: 20, left: 20),
                  child: TextField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: "street"),
                    controller: controlleradreessesstreet,
                    obscureText: false,
                  ),
                ),
                 Padding(
                  padding:
                      const EdgeInsets.only(top: 30.0, right: 20, left: 20),
                  child: TextField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: "city"),
                    controller: controlleradreessescity,
                    obscureText: false,
                  ),
                ),
                 Padding(
                  padding:
                      const EdgeInsets.only(top: 30.0, right: 20, left: 20),
                  child: TextField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: "country"),
                    controller: controlleradreessescountry,
                    obscureText: false,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20),
                  child: SizedBox(
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () {
                          context.read<SignUpCubit>().signUpUser(

                                email: controllerEmail.text.trim(),
                                password: controllerPassword.text.trim(),
                                name: controllerName.text,
                                phone: controllerPhone.text.trim(),
                                date: context
                                    .read<SignUpCubit>()
                                    .selectTime
                                    .toString(),
                                    adreessescity: controlleradreessescity.text,
                                    adreessescountry: controlleradreessescountry.text,
                                    adreessesstreet: controlleradreessesstreet.text,

                              );
                        },
                        child: const Text(
                          "Let's go",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ).tr()),
                  ),
                )
              ]);
            }
          },
          listener: (context, state) {
            //
            if (state is SignUpSuccessState) {
              //
              var snackBar = SnackBar(
                content: Text(
                  "Welcome ${state.msg!}",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ).tr(),
                backgroundColor: Colors.green,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                  (route) => false);
            }
          },
        ),
      ),
    );
  }
}
