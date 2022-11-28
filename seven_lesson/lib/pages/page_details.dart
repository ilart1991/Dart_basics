import 'package:flutter/material.dart';
import 'package:seven_lesson/parts/vars.dart';

class PageDetails extends StatelessWidget {
  const PageDetails({super.key, required this.artistData});
  final String artistData;

  @override
  Widget build(BuildContext context) {
    String artistInfo = "";

    for (int i = 0; i < jsonMap.length; i++) {
      if (artistData == jsonMap.keys.elementAt(i)) {
        artistInfo = jsonMap.values.elementAt(i);
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(artistData.toUpperCase()),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
            child: Text(
          artistInfo,
        )),
      )),
    );
  }
}
