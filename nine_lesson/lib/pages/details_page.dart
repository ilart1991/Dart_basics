import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  DetailsPage({super.key, required this.uuid});
  final String uuid;

  @override
  Widget build(BuildContext context) {
    String url = "https://run.mocky.io/v3/$uuid";
    return Scaffold(
      appBar: AppBar(),
      body: Text(url),
    );
  }
}
