import 'dart:convert';
import 'package:flutter/services.dart' as rootBundle;
import 'product_model.dart';

Future<List<ProductModel>> readFromJson() async {
  final jsonData =
      await rootBundle.rootBundle.loadString('lib/product/json/product.json');
  final jsonDecoder = json.decode(jsonData) as List<dynamic>;
  return jsonDecoder
      .map((dataOfJson) => ProductModel.fromJson(dataOfJson))
      .toList();
}
