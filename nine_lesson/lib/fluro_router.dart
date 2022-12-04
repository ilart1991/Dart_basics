import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:nine_lesson/details_page.dart';
import 'package:nine_lesson/home_page.dart';

class RouterFluro {
  static FluroRouter fluroRouter = FluroRouter();

  static var homeHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return MyHomePage();
  });

  static var detailsHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return DetailsPage(
      title: params["hotelName"][0],
    );
  });

  static initRoutes() {
    fluroRouter.define("home",
        handler: homeHandler, transitionType: TransitionType.native);
    fluroRouter.define("details/:hotelName",
        handler: detailsHandler, transitionType: TransitionType.native);
  }
}
