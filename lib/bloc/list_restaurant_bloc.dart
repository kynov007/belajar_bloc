import 'package:flutter_bloc/flutter_bloc.dart';

part 'list_restaurant_event.dart';
part 'list_restaurant_state.dart';

class ListRestaurantBloc
    extends Bloc<ListRestaurantEvent, ListRestaurantState> {
  ListRestaurantBloc() : super(ListRestaurantInitial()) {
    on<ListRestaurantEvent>((event, emit) {
      // ignore: todo
      // TODO: implement event handler
    });
  }
}
