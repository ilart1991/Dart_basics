import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../details.dart';

List<Widget> photos = [];
List<String> paidServices = [];
List<String> freeServices = [];
String country = "";
String city = "";
String street = "";
String raiting = "";
Map<String, dynamic> errorMap = {"test": "message"};

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key, required this.uuid, required this.hotelName});
  final String uuid;
  final String hotelName;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  bool isError = false;
  bool isComplete = false;

  @override
  initState() {
    super.initState();
  }

  Future<int> getResponse() async {
    final response =
        await http.get(Uri.parse("https://run.mocky.io/v3/${widget.uuid}"));

    if (response.statusCode == 404) {
      errorMap = jsonDecode(response.body);
    }

    var data = jsonDecode(response.body);
    Details details = Details.fromJson(data);

    country = details.address.country;
    city = details.address.city;
    street = details.address.street;
    raiting = details.rating.toString();

    for (int i = 0; i < details.photos.length; i++) {
      photos.add(Image.asset("assets/images/${details.photos[i]}"));
    }

    for (int i = 0; i < details.services.paid.length; i++) {
      paidServices.add(details.services.paid[i]);
    }

    for (int i = 0; i < details.services.free.length; i++) {
      freeServices.add(details.services.free[i]);
    }
    return response.statusCode;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                photos.clear();
                freeServices.clear();
                paidServices.clear();
                Navigator.pop(context, false);
              },
              icon: const Icon(Icons.arrow_back)),
          title: Text(widget.hotelName),
        ),
        body: FutureBuilder(
          future: getResponse(),
          builder: (context, snapshot) {
            if (!snapshot.hasError &&
                snapshot.connectionState == ConnectionState.done) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CarouselSlider(
                    items: photos,
                    options: CarouselOptions(
                        height: 200,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 1)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Text("Страна: "),
                            Text(country,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                        Row(
                          children: [
                            const Text("Город: "),
                            Text(city,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                        Row(
                          children: [
                            const Text("Улица: "),
                            Text(street,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                        Row(
                          children: [
                            const Text("Рейтинг: "),
                            Text(raiting,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Сервисы",
                          style: TextStyle(fontSize: 28),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 8),
                                      child: Text(
                                        "Платные",
                                        style: TextStyle(fontSize: 22),
                                      ),
                                    ),
                                    ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: paidServices.length,
                                      itemBuilder: (context, index) {
                                        return Text(paidServices[index]);
                                      },
                                    ),
                                  ]),
                            ),
                            Expanded(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 8),
                                      child: Text("Бесплатные",
                                          style: TextStyle(fontSize: 22)),
                                    ),
                                    ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: freeServices.length,
                                      itemBuilder: (context, index) {
                                        return Text(freeServices[index]);
                                      },
                                    ),
                                  ]),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else if (snapshot.hasError &&
                snapshot.connectionState == ConnectionState.done) {
              return Center(
                child: Text(errorMap.values.elementAt(0)),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}
