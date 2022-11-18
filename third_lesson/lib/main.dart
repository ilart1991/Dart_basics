// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  List<Widget> images = [
    Image.asset("assets/images/image1.jpg"),
    Image.asset("assets/images/image2.jpg"),
    Image.asset("assets/images/image3.jpg")
  ];

  @override
  String svgPath = "assets/images/leaf.svg";
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My app name"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            SvgPicture.asset(
              svgPath,
              width: 200,
              height: 200,
            ),
            CarouselSlider(
                items: images,
                options: CarouselOptions(
                    height: 300,
                    reverse: true,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 1))),
          ],
        ),
      ),
    );
  }
}
