import 'package:agenda_de_contatos/screens/home/home.dart';
import 'package:agenda_de_contatos/screens/new_contact/new_contact.dart';
import 'package:flutter/material.dart';
import 'package:agenda_de_contatos/screens/color_schemes.g.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Agenda de contatos",
      routes: {
        "/": (context) => const Home(),
        "/new": (context) => const NewContact(),
      },
      initialRoute: "/",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
      ),
      // darkTheme: ThemeData(
      //   useMaterial3: true,
      //   colorScheme: darkColorScheme,
      // ),
    ),
  );
}
