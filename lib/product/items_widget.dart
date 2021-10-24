import 'package:flutter/material.dart';
import 'products_content.dart';
import 'product_model.dart';
import 'search_widget.dart';

class ItemsWidget extends StatefulWidget {
  @override
  ItemsWidgetState createState() => ItemsWidgetState();
}

class ItemsWidgetState extends State<ItemsWidget> {
  List<ProductModel> productModel = [];
  String query = '';

  void searchProductModel(String query) {
    final List<ProductModel> dataJson = [];
    final data = dataJson.where((products) {
      final name = products.name!.toLowerCase();
      final article = products.article!.toLowerCase();
      final category = products.category!.toLowerCase();
      final search = query.toLowerCase();

      return article.contains(search) ||
          name.contains(search) ||
          category.contains(search);
    }).toList();

    setState(() {
      this.query = query;
      this.productModel = data;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: SearchWidget(
            text: query,
            hintText: 'Поиск',
            onChanged: searchProductModel,
          ),
        ),
        body: Column(
          children: [
            ProductsContent(query: query),
          ],
        ),
      );
}
