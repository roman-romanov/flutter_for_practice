import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_for_practice/styles/styles.dart';

import 'product_model.dart';
import 'read_from_json.dart';
import 'red_line.dart';

class ItemsWidget extends StatelessWidget {
  const ItemsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: readFromJson(),
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
                    elevation: 1.0,
                    margin:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                    child: InkWell(
                      onTap: () {},
                      highlightColor: Colors.blue.withOpacity(0.05),
                      child: Container(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                height: 100.0,
                                width: 100.0,
                                child: Image(
                                    image:
                                        NetworkImage('${data[index].imageUrl}'),
                                    fit: BoxFit.fill)),
                            Expanded(
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Text('${data[index].name}'),
                                    subtitle: Text(
                                        'Kategoriya: ${data[index].category}'),
                                  ),
                                  ListTile(
                                    title: Row(
                                      children: [
                                        Text('Yangi narxi: '),
                                        Text(
                                          '${data[index].price}',
                                          style: priceStyle,
                                        ),
                                      ],
                                    ),
                                    subtitle: Row(
                                      children: [
                                        Text('Eski narxi: '),
                                        CustomPaint(
                                          foregroundPainter: RedLinePaint(),
                                          child:
                                              Text('${data[index].oldPrice}'),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                });
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
