import 'package:flutter/material.dart';
import 'package:nine_lesson/pages/hotels_list.dart';

class MyListView extends StatelessWidget {
  const MyListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: hotels.length,
        itemBuilder: (((context, index) {
          return SafeArea(
            child: Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              elevation: 5,
              margin: const EdgeInsets.only(top: 10, right: 10, left: 10),
              child: Column(
                children: [
                  FadeInImage(
                    placeholder: const AssetImage("assets/basketball.gif"),
                    image: AssetImage("assets/images/${hotels[index].poster}"),
                    height: 200,
                    width: 1000,
                    fit: BoxFit.none,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    child: Row(
                      children: [
                        Text(hotels[index].name),
                        const Spacer(),
                        MaterialButton(
                          onPressed: () {
                            print("go detail");
                            Navigator.pushNamed(context,
                                "details/${hotels[index].uuid}/${hotels[index].name}");
                          },
                          color: Colors.blue,
                          textColor: Colors.white,
                          child: const Text("Подробнее"),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        })));
  }
}
