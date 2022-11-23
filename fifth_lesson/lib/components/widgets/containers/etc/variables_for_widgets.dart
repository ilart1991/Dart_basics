import 'package:flutter/material.dart';

int currentIndex = 0;
String imgUrl = "http://www.rosphoto.com/images/u/articles/1510/7_5.jpg";

List<Widget> barContent = <Widget>[
  const Text(
    'PHOTO',
  ),
  const Text(
    'CHAT',
  ),
  const Text(
    'PROFILE',
  ),
];

List<BottomNavigationBarItem> items = [
  const BottomNavigationBarItem(
      icon: Icon(Icons.photo_album_rounded), label: "Photo"),
  const BottomNavigationBarItem(icon: Icon(Icons.chat_rounded), label: "Chat"),
  const BottomNavigationBarItem(
      icon: Icon(Icons.account_box_rounded), label: "Profile"),
];

Map<String, Icon> drawerItems = {
  "Home": const Icon(Icons.home),
  "Profile": const Icon(Icons.person),
  "Images": const Icon(Icons.image)
};
ListView drawerList = ListView.builder(
  scrollDirection: Axis.vertical,
  shrinkWrap: true,
  itemCount: drawerItems.length,
  itemBuilder: (context, index) {
    return ListTile(
      leading: drawerItems.values.elementAt(index),
      title: Text(drawerItems.keys.elementAt(index)),
      trailing: const Icon(Icons.arrow_right),
    );
  },
);
