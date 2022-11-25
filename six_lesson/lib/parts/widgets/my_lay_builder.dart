import 'package:flutter/material.dart';
import 'package:six_lesson/parts/vars.dart';

SafeArea myLayBuilder = SafeArea(
  child: Column(
    children: [
      Expanded(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            double width = constraints.constrainWidth();
            return ListView.builder(
              scrollDirection: width > 500 ? Axis.vertical : Axis.horizontal,
              itemCount: boxes.length,
              itemBuilder: (context, index) => boxes[index],
            );
          },
        ),
      ),
    ],
  ),
);
