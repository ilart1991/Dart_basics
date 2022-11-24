import 'package:flutter/material.dart';

List<Widget> listData = List.generate(50, (index) {
  return Text(
    "$index ",
    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
  );
});

List<Widget> boxes = List.generate(50, (index) {
  return const Card(
    color: Colors.amber,
    child: SizedBox(
      height: 150,
      width: 150,
    ),
  );
});
