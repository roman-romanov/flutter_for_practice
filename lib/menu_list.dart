import 'package:flutter/material.dart';
import 'package:flutter_for_practice/styles/styles.dart';
import 'navigation/bloc_navigation.dart';
import 'styles/const.dart';

class MenuList extends StatefulWidget with NavigationStates {
  const MenuList({Key? key}) : super(key: key);

  @override
  State<MenuList> createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {
  @override
  Widget build(BuildContext context) {
    List<TextButton> menuList = [
      TextButton(
          style: styleTextButtonFS_20,
          onPressed: () => Navigator.pushNamed(context, '/collapse_animated'),
          child: collapseAnimatedWidget),
      TextButton(
          style: styleTextButtonFS_20,
          onPressed: () => Navigator.pushNamed(context, '/container_colors'),
          child: colorButtonContext),
      TextButton(
          style: styleTextButtonFS_20,
          onPressed: () => Navigator.pushNamed(context, '/inherited_widget'),
          child: inheritedWidget),
      TextButton(
          style: styleTextButtonFS_20,
          onPressed: () => Navigator.pushNamed(context, '/inherited_model'),
          child: inheritedModel),
      TextButton(
          style: styleTextButtonFS_20,
          onPressed: () =>
              Navigator.pushNamed(context, '/inherited_communicate'),
          child: inheritedCommunicate),
      TextButton(
          style: styleTextButtonFS_20,
          onPressed: () => Navigator.pushNamed(context, '/inherited_notifier'),
          child: inheritedNotifier),
      TextButton(
          style: styleTextButtonFS_20,
          onPressed: () => Navigator.pushNamed(context, '/json_example'),
          child: jsonExample),
      TextButton(
          style: styleTextButtonFS_20,
          onPressed: () => Navigator.pushNamed(context, '/custom_appbar'),
          child: customAppBarExample),
      TextButton(
          style: styleTextButtonFS_20,
          onPressed: () => Navigator.pushNamed(context, '/search_product'),
          child: searchProduct),
    ];
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        appBar: AppBar(title: appBarMenuTitle),
        body: SafeArea(
          child: ListView.separated(
            physics:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            itemCount: menuList.length,
            separatorBuilder: (context, index) => Divider(),
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: mainAxisAlignmentLeft,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: menuList[index],
                  ),
                ],
              );
            },
          ),
        ),
      );
    });
  }
}
