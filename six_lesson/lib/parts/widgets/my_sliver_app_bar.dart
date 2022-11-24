import 'package:flutter/material.dart';
import 'my_list_view.dart';

CustomScrollView myCustomScrollView = CustomScrollView(
  slivers: [
    SliverAppBar(
      expandedHeight: 240,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: false,
        title: const Text(
          "Page title",
        ),
        background: Image.network(
          "https://picsum.photos/1200/511",
          fit: BoxFit.none,
          color: Colors.black38,
          colorBlendMode: BlendMode.overlay,
        ),
      ),
    ),
    SliverList(delegate: myListView.childrenDelegate),
  ],
);
