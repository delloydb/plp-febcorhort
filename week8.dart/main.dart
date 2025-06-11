import 'package:flutter/material.dart';
import 'send_money_page.dart';
import 'login_page.dart';

void main() => runApp(SendMoneyApp());

class SendMoneyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Money Transfer',
      theme: ThemeData(primarySwatch: Colors.teal),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/dashboard': (context) => SendMoneyPage(),
      },
    );
  }
}
