import 'package:flutter/material.dart';
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
    return InkWell(
      onTap: () {},
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                  padding: EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Image.network('${productModel.imageUrl}')),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                        'Арт: ${productModel.article}\n${productModel.name}'),
                    subtitle: Text('Категория: ${productModel.category}'),
                    isThreeLine: true,
                  ),
                  Text('${productModel.price} ₽', style: priceStyle),
                  Row(
                    children: [
                      CustomPaint(
                        foregroundPainter: RedLinePaint(),
                        child: Text('${productModel.oldPrice} ₽'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    // Card(
    //   margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
    //   child: Stack(
    //     children: [
    //       ListTile(
    //         dense: true,
    //         contentPadding: EdgeInsets.all(10),
    //         leading: Image.network(
    //           '${productModel.imageUrl}',
    //           fit: BoxFit.cover,
    //           width: 100,
    //           height: 100,
    //         ),
    //         title: Text('Арт: ${productModel.article}\n${productModel.name}'),
    //         subtitle: Text('Категория: ${productModel.category}'),
    //         isThreeLine: true,
    //       ),
    //       Positioned.fill(
    //         top: 55,
    //         child: ListTile(
    //           dense: true,
    //           title: Text(
    //             '${productModel.price} ₽',
    //             style: priceStyle,
    //           ),
    //           subtitle: Row(
    //             children: [
    //               CustomPaint(
    //                 foregroundPainter: RedLinePaint(),
    //                 child: Text('${productModel.oldPrice} ₽'),
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
