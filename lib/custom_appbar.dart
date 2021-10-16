import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'styles/styles.dart';

class CustomAppBar extends StatefulWidget with PreferredSizeWidget {
  CustomAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(50);
  @override
  _SearchAppBar createState() => _SearchAppBar();
}

class _SearchAppBar extends State<CustomAppBar> {
  void _onMenuList() => Navigator.pop(context);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: <Widget>[
          Expanded(
            child: Container(
              color: Colors.white,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child:
                        IconButton(onPressed: _onMenuList, icon: iconArrowBack),
                  ),
                  Expanded(
                      flex: 5,
                      child: Stack(
                        alignment: Alignment.centerRight,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: TextField(
                              style: fontFamTNR,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.all(5),
                                label: Text('Qidiruv',
                                    style: TextStyle(color: Colors.grey)),
                                hintText: 'Mahsulotlarni qidiring...',
                                hintStyle: hintStyle,
                                filled: true,
                                fillColor: Colors.white.withAlpha(235),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 0.0, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [],
      ),
    );
  }
}
