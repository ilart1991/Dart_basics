import 'package:flutter/material.dart';
import 'package:seven_lesson/widgets/my_drawer.dart';

class PageHome extends StatelessWidget {
  const PageHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: myDrawer,
      backgroundColor: Colors.red[100],
      body: Center(
          child: Text(
        "Home",
      )),
    );
  }
}
