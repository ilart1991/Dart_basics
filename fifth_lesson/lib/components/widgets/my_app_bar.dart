import 'package:flutter/material.dart';

AppBar myAppBar = AppBar(
  actions: [
    Builder(
        builder: ((context) => IconButton(
            onPressed: (() {
              Scaffold.of(context).openEndDrawer();
            }),
            icon: const Icon(Icons.person))))
  ],
  title: Text("test title"),
  bottom: const TabBar(tabs: [
    Tab(
      text: "First",
      icon: Icon(Icons.catching_pokemon),
    ),
    Tab(
      text: "Second",
      icon: Icon(Icons.pin_invoke_outlined),
    ),
    Tab(
      text: "Third",
      icon: Icon(Icons.phonelink_erase),
    )
  ]),
);
