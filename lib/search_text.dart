import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_for_practice/custom_appbar.dart';
import 'product/product_model.dart';
import 'package:flutter/services.dart' as rootBundle;

class SearchText extends StatefulWidget {
  const SearchText({Key? key}) : super(key: key);

  @override
  _SearchTextState createState() => _SearchTextState();
}

class _SearchTextState extends State<SearchText> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        appBar: CustomAppBar(),
        body: FutureBuilder(
            future: _readFromJson(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text('${snapshot.error}'),
                );
              } else if (snapshot.hasData) {
                final data = snapshot.data as List<ProductModel>;
                return ListView.builder(
                    physics: BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 0.5,
                        margin: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 6.0),
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  height: 50.0,
                                  width: 85.0,
                                  child: Image(
                                      image: NetworkImage(
                                          data[index].imageUrl.toString()),
                                      fit: BoxFit.fill)),
                              Expanded(
                                  child: Container(
                                child: Column(
                                  children: [
                                    ListTile(
                                      title: Text(
                                        'Maxsulot nomi: ${data[index].name}',
                                        style: TextStyle(fontSize: 18.0),
                                      ),
                                      subtitle: Text(
                                          'Kategoriya: ${data[index].category}'),
                                    ),
                                    ListTile(
                                      minVerticalPadding: 0.0,
                                      title: Text(
                                          'Yangi narxi: ${data[index].price}'),
                                      subtitle: Text(
                                          'Eski narxi: ${data[index].oldPrice}'),
                                    ),
                                  ],
                                ),
                              ))
                            ],
                          ),
                        ),
                      );
                    });
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
      );
    });
  }
}

Future<List<ProductModel>> _readFromJson() async {
  final jsonData =
      await rootBundle.rootBundle.loadString('lib/product/json/product.json');
  final jsonDecoder = json.decode(jsonData) as List<dynamic>;
  return jsonDecoder
      .map((dataOfJson) => ProductModel.fromJson(dataOfJson))
      .toList();
}
