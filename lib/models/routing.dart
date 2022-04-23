import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:qit_test/screens/screens.dart';

import '../screens/loading.dart';

class Routing {
  static final router = FluroRouter();

  static Handler _loginHandler = Handler(
      handlerFunc: (context, Map<String, dynamic> params) => LoginScreen());
  static Handler _loadingHandler = Handler(
      handlerFunc: (context, Map<String, dynamic> params) => Loading());

  static Handler _mainHandler = Handler(
      handlerFunc: (context, Map<String, dynamic> params) => ProductsPage(

          ));

  static void setupRouter() {
   router.define('/login', handler: _loginHandler);
   router.define('/loading', handler: _loadingHandler);
    router.define('/products/:category', handler: _mainHandler);
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return Scaffold();
    });
  }
}
