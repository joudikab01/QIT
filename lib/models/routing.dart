import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:qit_test/screens/screens.dart';


class Routing {
  static final router = FluroRouter();

  static final Handler _loginHandler = Handler(
      handlerFunc: (context, Map<String, dynamic> params) => LoginScreen());

  static final Handler _mainHandler = Handler(
      handlerFunc: (context, Map<String, dynamic> params) => ProductsPage(
          ));

  static void setupRouter() {
   router.define('/login', handler: _loginHandler);
    router.define('/products', handler: _mainHandler);
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return const Scaffold();
    });
  }
}
