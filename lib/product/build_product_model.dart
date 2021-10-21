import 'package:flutter/material.dart';
import 'package:flutter_for_practice/styles/styles.dart';

import 'product_model.dart';
import 'red_line.dart';

class BuildProductModel extends StatelessWidget {
  const BuildProductModel({
    Key? key,
    required this.productModel,
  }) : super(key: key);

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
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
            title: Text('Арт: ${productModel.article}\n${productModel.name}'),
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
}
