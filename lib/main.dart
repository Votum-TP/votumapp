import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:votum/pages/autentication_otp/otp_page.dart';
import 'package:votum/pages/elections_page/VotoEnviado.dart';
import 'package:votum/pages/elections_page/election_page.dart';
import 'package:votum/pages/elections_page/election_result.dart';
import 'package:votum/pages/elections_page/vote_page.dart';
import 'package:votum/pages/face_authentication_page/authentication_page.dart';
import 'package:votum/pages/face_authentication_page/face_noverify.dart';
import 'package:votum/pages/face_authentication_page/face_verify.dart';
import 'package:votum/pages/instruction_page/instruction.dart';
import 'package:votum/pages/login_page/login_page.dart';
import 'package:votum/pages/splash/splash.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
    );
    return MaterialApp(
      title: 'Votum',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: InstructionScreen(electionId: '1',),
      initialRoute: '/',
      routes: {
        'elections': (context) => VotePage(),
      },
    );
  }
}


