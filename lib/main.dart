import 'package:flutter/material.dart';
import 'package:qit_test/providers/data_manager.dart';
import 'models/routing.dart';
import 'screens/screens.dart';
import 'package:fluro/fluro.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

GetIt getIt = GetIt.instance;


void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    Routing.setupRouter();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: ProductsPage(category: 'elec',),
      initialRoute: '/login',
      onGenerateRoute: Routing.router.generator,
    );
  }
}
