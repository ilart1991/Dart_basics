import 'package:flutter/material.dart';
import 'package:six_lesson/parts/vars.dart';

ListView myListView = ListView.separated(
  separatorBuilder: (context, index) => const Divider(
    color: Colors.black26,
  ),
  itemCount: listData.length,
  itemBuilder: (context, index) =>
      Padding(padding: const EdgeInsets.all(8), child: listData[index]),
);
