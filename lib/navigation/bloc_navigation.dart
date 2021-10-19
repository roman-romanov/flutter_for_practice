import 'package:flutter_bloc/flutter_bloc.dart';
import '../menu_list.dart';
import '../search_product.dart';

enum NavigationEvents {
  productSearch,
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  NavigationBloc() : super(const MenuList());

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.productSearch:
        yield const SearchProduct();
        break;
    }
  }
}
