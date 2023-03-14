
import 'package:frotec/screens/color_schemes.g.dart';
import 'package:frotec/screens/login/login.dart';
import 'package:frotec/screens/home/home.dart';
import 'package:frotec/screens/new_mobile/new_mobile.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Frotec",
      routes: {
        "/login": (context) => const Login(),
        "/": (context) => const Home(),
        "/new": (context) => const NewMobile(),
      },
      initialRoute: "/",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: lightColorScheme,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: darkColorScheme,
        useMaterial3: true,
      ),
    ),
  );
}
