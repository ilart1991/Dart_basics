import 'package:flutter/material.dart';
import 'package:six_lesson/parts/my_app.dart';
import 'package:six_lesson/parts/widgets/my_sliver_app_bar.dart';
import 'parts/widgets/my_list_view.dart';
import 'package:six_lesson/parts/widgets/my_lay_builder.dart';
import 'package:six_lesson/parts/widgets/my_text_field.dart';

void main() {
  runApp(MyApp());
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // body: Center(child: myListView), // Задание 1
        // body: myCustomScrollView, // Задание 2
        // body: myLayBuilder, // Задание 3
        // body: myTextField, // Задание 4
        );
  }
}
