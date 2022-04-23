import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../models/product.dart';
import '../models/products.dart';
import '../models/response.dart' as re;

class ProductsProvider extends ChangeNotifier {
  int selectedCategory = 0;
  bool isSelected = false;
  String _password = '';
  String _email = '';
  Product? product;
  Map<String, dynamic> map = {};
  List<Product> products = [];
  List<dynamic> categories=[];

  int get category => selectedCategory;
  bool get selected => isSelected;
  Map get loginInfo => map;

  void changeSel(){
    isSelected = !isSelected;
    notifyListeners();
  }

  void setMap() {
    map = {
      'email': _email,
      'password': _password,
    };
  }

  void changeCategory(int index) {
    selectedCategory = index;
    isSelected = true;
    notifyListeners();
  }

  List<dynamic> changeCatData(List<dynamic> newCat) {
    categories = newCat;
    notifyListeners();
    return categories;
  }

  List<Product> get getProduct => products;
  List<dynamic> get getCategoriesName => categories;

   Future<re.Response> loginRequest(String email, String password) async {
    Response response = await Dio().post(
        'http://restapi.adequateshop.com/api/authaccount/login?email=${email}&password=${password}');
    print(response.data);
  return re.Response.fromJson(response.data);
   }

  Future<Products> getProducts(String name) async {
    Response response =
        await Dio().get('https://fakestoreapi.com/products/category/$name');
    //products.clear();
    //products = (response.data as List).map((x) => Product.fromJson(x)).toList();
    //print(products);
    //print((Products.fromJson(response.data)).pproducts);
    return Products.fromJson(response.data);
  }

  Future<List<dynamic>> getCategories() async {
    Response response =
        await Dio().get('https://fakestoreapi.com/products/categories');
     categories = response.data  ;
    // print(categories);
    //print(response.data);
    // print(Category.fromJson(response.data));
    changeCatData(categories);
    return response.data;

  }


  // Future <List<Product>> getAllData(){
  //   DataService dataService = DataService();
  //   return dataService.dio.;

}
