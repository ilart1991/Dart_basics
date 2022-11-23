import 'package:flutter/material.dart';
import 'package:fifth_lesson/components/widgets/containers/etc/variables_for_widgets.dart';

Drawer myEndDrawer = Drawer(
  child: Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(radius: 60, backgroundImage: NetworkImage(imgUrl)),
        const Text("Артем Ильинский"),
      ],
    ),
  ),
);
