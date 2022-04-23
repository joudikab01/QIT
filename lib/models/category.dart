import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part'category.freezed.dart';


@freezed
class Category with _$Category{
  const factory Category ({required List<String> name })=_Category;
  factory Category.fromJson(List<dynamic> json) {
    List<String> names =  [];
    return Category(name: names);
  }

}