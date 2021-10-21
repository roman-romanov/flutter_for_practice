import 'package:flutter/material.dart';
import 'build_product_model.dart';
import 'product_model.dart';
import 'read_from_json.dart';
import 'search_widget.dart';

class ItemsWidget extends StatefulWidget {
  @override
  ItemsWidgetState createState() => ItemsWidgetState();
}

class ItemsWidgetState extends State<ItemsWidget> {
  List<ProductModel> productModel = [];
  String query = '';

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Sport Mollari'),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            buildSearch(),
            Expanded(
              child: FutureBuilder(
                  future: readFromJson(query),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text('${snapshot.hasError}'),
                      );
                    } else if (snapshot.hasData) {
                      final data = snapshot.data as List<ProductModel>;
                      return ListView.builder(
                        physics: BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          final prodModel = data[index];
                          return BuildProductModel(productModel: prodModel);
                        },
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ),
          ],
        ),
      );

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'Mahsulotlarni qidiring...',
        onChanged: searchProductModel,
      );

  void searchProductModel(String query) {
    final List<ProductModel> dataJson = [];
    final pm = dataJson.where((products) {
      final nameLower = products.name!.toLowerCase();
      final articleLower = products.article!.toLowerCase();
      final categoryLower = products.category!.toLowerCase();
      final searchLower = query.toLowerCase();

      return articleLower.contains(searchLower) ||
          nameLower.contains(searchLower) ||
          categoryLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.productModel = pm;
    });
  }
}
