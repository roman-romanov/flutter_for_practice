import 'package:flutter/material.dart';

class TabBarWidget extends StatefulWidget {
  final String title;
  const TabBarWidget({Key? key, required this.title}) : super(key: key);

  @override
  _TabBarWidget createState() => _TabBarWidget();
}

class _TabBarWidget extends State<TabBarWidget> with TickerProviderStateMixin {
  TabController? _tabController;
  int currentIndex = 0;

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
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text('Ilova'),
          ),
          body: SafeArea(
            child: Container(
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TabBar(
                          labelPadding: const EdgeInsets.only(bottom: 6),
                          labelColor: Colors.orange,
                          unselectedLabelColor: Colors.black,
                          controller: _tabController,
                          onTap: (val) {
                            setState(() {
                              currentIndex = val;
                            });
                          },
                          tabs: [
                            Tab(icon: Icon(Icons.directions_car)),
                            Tab(icon: Icon(Icons.directions_transit)),
                            Tab(icon: Icon(Icons.directions_bike))
                          ]),
                      Expanded(
                          child: TabBarView(
                              controller: _tabController,
                              children: const [
                            Image(
                                image: AssetImage('assets/images/image1.jpg')),
                            Icon(Icons.directions_transit),
                            Center(
                                child: Text(
                                    'The class is blank because, in this project’s use case, you don’t need any additional data in the annotation. The global variable generateSubclass is the name of the annotation. You’ll use this name to mark a class for a generator. You can create annotations from any class that has a const constructor.'))
                          ]))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
