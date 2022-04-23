import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:qit_test/models/product.dart';

part 'products.freezed.dart';


@freezed
class Products with _$Products {
   factory Products({
    required  List<Product> pproducts
  })=_Products;
   factory Products.fromJson(List<dynamic> json) {

     List<Product> prod = [];
     prod = json.map((i)=>Product.fromJson(i)).toList();
     return Products(pproducts: prod);

   }
}
