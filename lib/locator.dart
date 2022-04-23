import 'package:get_it/get_it.dart';
import 'package:qit_test/providers/data_manager.dart';

GetIt locator = GetIt.instance;

void setupLocator(){
  locator.registerFactory(() => ProductsProvider());
}