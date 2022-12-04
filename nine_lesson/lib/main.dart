import 'dart:convert';

import 'package:flutter/material.dart';
import 'hotel.dart';
import 'my_app.dart';
import 'fluro_router.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  initState() {
    super.initState();
    RouterFluro.initRoutes(); // инициализация путей
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "home",
      onGenerateRoute: RouterFluro.fluroRouter.generator,
    );
  }
}
