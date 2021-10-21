import 'package:flutter/material.dart';
import 'package:flutter_for_practice/product/red_line.dart';
import 'package:flutter_for_practice/styles/styles.dart';
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
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          final prodModel = data[index];
                          return buildProductModel(prodModel);
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

  Widget buildProductModel(ProductModel productModel) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Stack(
        children: [
          ListTile(
            contentPadding: EdgeInsets.all(10),
            //dense: true,
            leading: Image.network(
              '${productModel.imageUrl}',
              fit: BoxFit.cover,
              width: 100,
              height: 100,
            ),
            title: Text('Арт: ${productModel.id}\n${productModel.name}'),
            subtitle: Text('Kategoriya: ${productModel.category}'),
            isThreeLine: true,
          ),
          Positioned.fill(
            top: 55,
            child: ListTile(
              dense: true,
              title: Text(
                '${productModel.price} so\'m',
                style: priceStyle,
              ),
              subtitle: Row(
                children: [
                  CustomPaint(
                    foregroundPainter: RedLinePaint(),
                    child: Text('${productModel.oldPrice} so\'m'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void searchProductModel(String query) {
    final List<ProductModel> dataJson = [];
    final pm = dataJson.where((products) {
      final nameLower = products.name!.toLowerCase();
      final articleLower = products.id!.toLowerCase();
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
