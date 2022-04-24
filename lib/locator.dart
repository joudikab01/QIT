import 'package:get_it/get_it.dart';
import 'package:qit_test/providers/hlist_provider.dart';

GetIt locator = GetIt.instance;

void setupLocator(){
  locator.registerSingleton(HListMsg());
}