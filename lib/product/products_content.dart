import 'package:flutter/material.dart';
import 'card_widget.dart';
import 'product_model.dart';
import 'read_from_json.dart';

class ProductsContent extends StatelessWidget {
  final String query;
  const ProductsContent({Key? key, required this.query}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
          future: readFromJson(query),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final data = snapshot.data as List<ProductModel>;
              return ListView.builder(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                physics: BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final prodModel = data[index];
                  return CardWidget(productModel: prodModel);
                },
              );
            } else {
              return Center(
                child: Text('${snapshot.error}'),
              );
            }
          }),
    );
  }
}
