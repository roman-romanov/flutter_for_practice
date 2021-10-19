import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc_navigation.dart';

class PatternBloc extends StatelessWidget {
  const PatternBloc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<NavigationBloc>(
        create: (context) => NavigationBloc(),
        child: BlocBuilder<NavigationBloc, NavigationStates>(
          builder: (context, navigationState) {
            return navigationState as Widget;
          },
        ),
      ),
    );
  }
}
