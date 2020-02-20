import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/home/home.dart';
import 'package:practica_integradora_uno/login/startup.dart';
import 'package:practica_integradora_uno/utils/constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget { 
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APP_TITLE,
      theme: ThemeData(
        primarySwatch: PRIMARY_COLOR,
        backgroundColor: PRIMARY_COLOR,
        accentColor: BUTTON_COLOR,
        cardColor: DESC_TEXT_COLOR,
        canvasColor: BG_COLOR,
        textTheme: TextTheme(
          body1: TextStyle(
            color: TEXT_COLOR, 
            fontFamily: 'AkzidenzGrotesk', 
            fontSize: 14, 
            fontWeight: FontWeight.bold,
          ),
          body2: TextStyle(
            color: BG_COLOR,
            fontFamily: 'AkzidenzGrotesk',
            fontSize: 12,
          ),
        ),
      ),
      home: Startup(),
    );
  }
}
