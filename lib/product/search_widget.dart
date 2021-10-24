import 'package:flutter/material.dart';
import 'package:flutter_for_practice/styles/styles.dart';

class SearchWidget extends StatefulWidget {
  final String text;
  final ValueChanged<String> onChanged;
  final String hintText;

  const SearchWidget(
      {Key? key,
      required this.text,
      required this.onChanged,
      required this.hintText})
      : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Align(
      widthFactor: 0.9,
      child: Container(
        height: 42,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
          border: Border.all(color: Colors.black26),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Stack(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 11),
                  suffixIcon: widget.text.isNotEmpty
                      ? GestureDetector(
                          child: Icon(Icons.close),
                          onTap: () {
                            controller.clear();
                            widget.onChanged('');
                            FocusScope.of(context).requestFocus(FocusNode());
                          })
                      : Icon(Icons.search),
                  hintText: widget.hintText,
                  hintStyle: widget.text.isEmpty ? styleHint : styleActive,
                  border: InputBorder.none),
              onChanged: widget.onChanged,
            ),
          ],
        ),
      ),
    );
  }
}
