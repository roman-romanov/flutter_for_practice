import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_for_practice/product/items_widhet.dart';
import 'navigation/bloc_navigation.dart';

class SearchProduct extends StatelessWidget with NavigationStates {
  const SearchProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: ItemsWidget(),
      );
    });
  }
}
