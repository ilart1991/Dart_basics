import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:seven_lesson/parts/vars.dart';

import '../parts/fetch_file.dart';
import '../widgets/my_drawer.dart';

class PageArtists extends StatefulWidget {
  PageArtists({Key? key}) : super(key: key);
  @override
  _PageArtistsState createState() => _PageArtistsState();
}

class _PageArtistsState extends State<PageArtists> {
  late Future _future;

  @override
  void initState() {
    Future<List> getJson =
        fetchFileFromAssets("assets/artists.json").then((jsonData) {
      jsonList = json.decode(jsonData); // получаем json
      jsonMap = {for (var v in jsonList) v["name"]: v["about"]}; // делаем map
      return jsonList;
    });

    _future = getJson;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            appBar: AppBar(),
            drawer: myDrawer,
            body: artistsList,
          );
        } else {
          return Center(child: Text('Загрузка данных'));
        }
      },
    );
  }
}
