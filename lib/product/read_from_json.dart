import 'dart:convert';
import 'package:flutter/services.dart' as rootBundle;
import 'product_model.dart';

Future<List<ProductModel>> readFromJson(String query) async {
  final jsonData =
      await rootBundle.rootBundle.loadString('lib/product/json/product.json');
  final jsonDecoder = json.decode(jsonData) as List<dynamic>;
  return jsonDecoder
      .map((dataOfJson) => ProductModel.fromJson(dataOfJson))
      .where((products) {
    final nameLower = products.name!.toLowerCase();
    final articleLower = products.id!.toLowerCase();
    final categoryLower = products.category!.toLowerCase();
    final searchLower = query.toLowerCase();

    return articleLower.contains(searchLower) ||
        nameLower.contains(searchLower) ||
        categoryLower.contains(searchLower);
  }).toList();
}
