import 'dart:convert';

import 'package:flutter/material.dart';
import 'parts/my_app.dart';
import 'parts/fluro_router.dart';

void main() {
  runApp(MyApp());
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
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
