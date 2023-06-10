import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:testbuild/Screen/notification.dart';
import 'package:testbuild/Screen/onpbarding.dart';
import 'package:testbuild/Screen/screenSplash.dart';
import 'package:testbuild/Screen/signup.dart';
import 'package:testbuild/Screen/verfiy/page2_ver.dart';
import 'package:testbuild/view/Profile/profile.dart';
import 'package:testbuild/view/Signin/Signin.dart';
import 'package:testbuild/view/Signup/SignUp.dart';
import 'package:testbuild/view/home/home.dart';
import 'Screen/withbottom/myaccount.dart';
import 'firebase_options.dart';

bool? islogin;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(EasyLocalization(
    child: MyApp(),
    supportedLocales: [Locale('en', 'US'), Locale('ar', 'DZ')],
    path: 'assets/translations',
    fallbackLocale: Locale('ar', 'DZ'),
  ));

  var userauth = FirebaseAuth.instance.currentUser;

  if (userauth == null) {
    islogin = false;
  } else {
    islogin = true;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      color: Colors.white,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      routes: {
        'homepge': (context) => onboarding(),
        'splashscreen': (context) => splashscreen(),
        'signup': (context) => signup(),
        'page2ver': (context) => verpage2(),
      },
      home: islogin == false ? SigInScreen() : Home(),
    );
  }
}
