import 'dart:async';
import 'package:dio/dio.dart';
import '../models/category.dart';
import '../models/product.dart';

class DataService {
  Dio dio = Dio();

  static Future<List<Product>> getProducts(String name) async {
    Response response =
        await Dio().get('https://fakestoreapi.com/products/category/$name');
    return (response.data as List).map((x) => Product.fromJson(x)).toList();
  }

  static Future<List<Category>> getCategories() async {
    Response response =
        await Dio().get('https://fakestoreapi.com/products/categories');
    return (response.data as List).map((x) => Category.fromJson(x)).toList();
  }
}
