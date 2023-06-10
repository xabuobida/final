import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SupportPage extends StatefulWidget {
  @override
  State<SupportPage> createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  @override
  Widget build(BuildContext context) {

String? encodeQueryParameters(Map<String, String> params) {
  return params.entries
      .map((MapEntry<String, String> e) =>
          '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
      .join('&');
}
// ···
  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: 'fruitsuporrted@gmail.com',
    query: encodeQueryParameters(<String, String>{
      'subject': 'Help And advice for app',
    }),
  );

  launchUrl(emailLaunchUri);

    var store_phone='0785798537';
    return Scaffold(
      appBar: AppBar(
        title: Text('Support').tr(),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.mail),
            title: Text('Email').tr(),
            subtitle: Text('support@example.com'),
            onTap: () async {
            launchUrl(emailLaunchUri);
            },
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text('Phone').tr(),
            subtitle: Text('+ 962 0785798538 '),
            onTap: () async {
            launch('tel:${9620785798538}');
            },
          ),
        ],
      ),
    );
  }

  
}
