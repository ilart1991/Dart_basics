import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:seven_lesson/parts/vars.dart';

import '../parts/fetch_file.dart';
import '../widgets/my_drawer.dart';

class PageArtists extends StatelessWidget {
  const PageArtists({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
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
      future: getJson(),
    );
  }
}

Future<Map> getJson() async {
  fetchFileFromAssets("assets/artists.json").then((jsonData) => {
        jsonList = json.decode(jsonData), // получаем json
        jsonMap = {for (var v in jsonList) v["name"]: v["about"]}, // map
      });
  return jsonMap;
}
