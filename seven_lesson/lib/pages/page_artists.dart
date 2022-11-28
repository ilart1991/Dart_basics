import 'package:flutter/material.dart';
import 'package:seven_lesson/parts/vars.dart';

import '../widgets/my_drawer.dart';

class PageArtists extends StatelessWidget {
  const PageArtists({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: myDrawer,
      body: artistsList,
    );
  }
}
