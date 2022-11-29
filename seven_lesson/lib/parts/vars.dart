import 'package:flutter/material.dart';

List jsonList = [];
Map<String, String> jsonMap = {};

Map<String, Icon> drawerItems = {
  "Home": const Icon(Icons.home),
  "Albums": const Icon(Icons.queue_music),
};

int currentIndex = 0;

ListView drawerList = ListView.builder(
  scrollDirection: Axis.vertical,
  shrinkWrap: true,
  itemCount: drawerItems.length,
  itemBuilder: (context, index) {
    return ListTile(
      tileColor: currentIndex == index ? Colors.blue : Colors.transparent,
      textColor: currentIndex == index ? Colors.white : Colors.black,
      leading: drawerItems.values.elementAt(index),
      title: Text(drawerItems.keys.elementAt(index)),
      trailing: const Icon(Icons.arrow_right),
      onTap: () {
        currentIndex = index;
        if (index == 0) {
          Navigator.pushNamed(context, "home");
        } else if (index == 1) {
          Navigator.pushNamed(context, "artists");
        }
      },
    );
  },
);

ListView artistsList = ListView.builder(
  scrollDirection: Axis.vertical,
  shrinkWrap: true,
  itemCount: jsonMap.length,
  itemBuilder: (context, index) {
    return ListTile(
      title: Text(jsonMap.keys.elementAt(index)),
      onTap: () {
        Navigator.pushNamed(
            context, "details/${jsonMap.keys.elementAt(index)}");
      },
    );
  },
);
