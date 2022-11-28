import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:seven_lesson/pages/page_home.dart';

import '../pages/page_artists.dart';
import '../pages/page_details.dart';

class RouterFluro {
  static FluroRouter fluroRouter = FluroRouter();

  static var homeHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return PageHome();
  });

  static var artistsHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return PageArtists();
  });

  static var detailsHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return PageDetails(
      artistData: params["artistData"][0],
    );
  });

  static initRoutes() {
    fluroRouter.define("home",
        handler: homeHandler, transitionType: TransitionType.native);
    fluroRouter.define("artists",
        handler: artistsHandler, transitionType: TransitionType.native);
    fluroRouter.define("details/:artistData",
        handler: detailsHandler, transitionType: TransitionType.fadeIn);
  }
}
