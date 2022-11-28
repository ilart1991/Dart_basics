import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:seven_lesson/parts/vars.dart';

import '../parts/fetch_file.dart';
import '../widgets/my_drawer.dart';

class PageArtists extends StatefulWidget {
  PageArtists({Key? key}) : super(key: key);
  @override
  PageArtistState createState() => PageArtistState();
}

class PageArtistState extends State<PageArtists> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: myDrawer,
      body: artistsList,
    );
  }
}
