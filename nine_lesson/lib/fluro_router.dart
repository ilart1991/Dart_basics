import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:nine_lesson/pages/details_page.dart';
import 'package:nine_lesson/pages/hotels_list.dart';

class RouterFluro {
  static FluroRouter fluroRouter = FluroRouter();

  static var homeHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return const HotelsList();
  });

  static var detailsHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return DetailsPage(
      uuid: params["hotelName"][0],
    );
  });

  static initRoutes() {
    fluroRouter.define("home",
        handler: homeHandler, transitionType: TransitionType.native);
    fluroRouter.define("details/:hotelName",
        handler: detailsHandler, transitionType: TransitionType.native);
  }
}
