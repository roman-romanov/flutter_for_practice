import 'package:flutter/material.dart';

class Application extends StatefulWidget {
  final String title;
  const Application({Key? key, required this.title}) : super(key: key);

  @override
  _Application createState() => _Application();
}

class _Application extends State<Application> with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return DefaultTabController(
          length: 3,
           child:
          Scaffold(
              body:
                  SafeArea(
                  child:
                  ConstrainedBox(
                      constraints: BoxConstraints(
                          maxHeight: MediaQuery.of(context).size.height),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TabBar(controller: _tabController, tabs: [
                              Tab(icon: Icon(Icons.directions_car, color: Colors.black)),
                              Tab(icon: Icon(Icons.directions_transit, color: Colors.black)),
                              Tab(icon: Icon(Icons.directions_bike, color: Colors.black))
                            ]),
                            Expanded(
                                child: TabBarView(
                                    controller: _tabController,
                                    children: const [
                                  Icon(Icons.directions_car),
                                  Icon(Icons.directions_transit),
                                  Icon(Icons.directions_bike),
                                ]))
                          ])) )),
              );
    });
  }
}
