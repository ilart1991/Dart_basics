import 'package:flutter/material.dart';
import 'package:seven_lesson/parts/vars.dart';

class MyArtistsList extends StatelessWidget {
  const MyArtistsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
  }
}
