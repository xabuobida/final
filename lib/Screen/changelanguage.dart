import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ChangeLanguage extends StatefulWidget {
  const ChangeLanguage({super.key});

  @override
  State<ChangeLanguage> createState() => _ChangeLanguageState();
}

class _ChangeLanguageState extends State<ChangeLanguage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Language Setting').tr(),
      ),
      body: Center(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('To Change Language Click button').tr(),
            IconButton(onPressed: (){
              LocalizationChecker();
              print(LocalizationChecker.changeLanguage(context).toString());
            }, icon: Icon(Icons.language_outlined)),
          ],
        ),
      ),
    );
  }
}

class LocalizationChecker {
  static changeLanguage(BuildContext context){
    Locale ? currentLocal =EasyLocalization.of(context)!.currentLocale;
    if (currentLocal == const Locale('en','US')) {
      EasyLocalization.of(context)!.setLocale(const Locale('ar','DZ'));
      var snackBar = SnackBar(
                            content: Text(
                              "The change was successful",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ).tr(),
                            backgroundColor: Colors.green,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    else{
            EasyLocalization.of(context)!.setLocale(const Locale('en','US'));
            var snackBar = SnackBar(
                            content: Text(
                              "The change was successful",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            backgroundColor: Colors.green,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);

    }
  }
}
