import 'package:flutter/material.dart';
import 'package:votum/pages/autentication_otp/otp_page.dart';
import 'package:votum/pages/elections_page/election_page.dart';
import 'package:votum/pages/elections_page/vote_page.dart';
import 'package:votum/pages/face_authentication_page/authentication_page.dart';
import 'package:votum/pages/login_page/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Votum',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AuthenticationPage(),
      initialRoute: '/',
      routes: {
        'elections': (context) => VotePage(),
        'otp': (context) => OtpPage(),
      },
    );
  }
}


