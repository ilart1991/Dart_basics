import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:seven_lesson/parts/vars.dart';
import 'parts/fetch_file.dart';
import 'parts/my_app.dart';
import 'parts/fluro_router.dart';

void main() {
  runApp(MyApp());
  fetchFileFromAssets("assets/artists.json").then((jsonData) => {
        jsonList = json.decode(jsonData), // получаем json
        jsonMap = {
          for (var v in jsonList) v["name"]: v["about"]
        }, // раскидываем в map имя и описание
      });
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);
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
