import 'package:flutter/material.dart';
import 'package:split_view/split_view.dart';

class SplitViewWidget extends StatefulWidget {
  const SplitViewWidget({Key? key,  this.title}) : super(key: key);
final String? title;
  @override
  _SplitViewWidget createState() => _SplitViewWidget();
}

class _SplitViewWidget extends State<SplitViewWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: SplitView(
        children: [
          SplitView(
            viewMode: SplitViewMode.Horizontal,
            indicator: SplitIndicator(viewMode: SplitViewMode.Horizontal),
            activeIndicator: SplitIndicator(
              viewMode: SplitViewMode.Horizontal,
              isActive: true,
            ),
            children: [
              Container(
                child: Center(child: Text("View1")),
                color: Colors.red,
              ),
              Container(
                child: Center(child: Text("View2")),
                color: Colors.blue,
              ),
              Container(
                child: Center(child: Text("View3")),
                color: Colors.green,
              ),
            ],
            onWeightChanged: (w) => print("Horizon: $w"),
          ),
          Container(
            child: Center(child: Text("View4")),
            color: Colors.purple,
          ),
          Container(
            child: Center(child: Text("View5")),
            color: Colors.yellow,
          ),
        ],
        viewMode: SplitViewMode.Vertical,
        indicator: SplitIndicator(viewMode: SplitViewMode.Vertical),
        activeIndicator: SplitIndicator(
          viewMode: SplitViewMode.Vertical,
          isActive: true,
        ),
        controller: SplitViewController(limits: [null, WeightLimit(max: 0.5)]),
        onWeightChanged: (w) => print("Vertical $w"),
      ),
    );
  }
}