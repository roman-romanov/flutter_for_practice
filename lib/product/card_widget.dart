import 'package:flutter/material.dart';
import 'package:flutter_for_practice/styles/colors.dart';
import 'package:flutter_for_practice/styles/const.dart';
import 'package:flutter_for_practice/styles/styles.dart';
import 'product_model.dart';
import 'red_line_widget.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    Key? key,
    required this.productModel,
  }) : super(key: key);

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: InkWell(
        onTap: () {},
        splashColor: grey.shade200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                  height: 120,
                  padding: EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Image.network('${productModel.imageUrl}',
                      fit: BoxFit.contain)),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Арт: ${productModel.article}',
                    style: oldPriceStyle,
                  ),
                  Text('${productModel.name}'),
                  Row(
                    children: [
                      Column(children: [
                        Text('${productModel.price} ₽', style: priceStyle),
                        CustomPaint(
                            foregroundPainter: RedLinePaint(),
                            child: Text('${productModel.oldPrice} ₽',
                                style: oldPriceStyle)),
                      ]),
                      IconButton(onPressed: () {}, icon: shoppingCart)
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
