import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'menufood_event.dart';
part 'menufood_state.dart';

class MenuFoodBloc extends Bloc<MenuFoodEvent, MenuFoodState> {
  @override
  MenuFoodState get initialState => MenuFoodInitial();

  @override
  Stream<MenuFoodState> mapEventToState(
    MenuFoodEvent event,
  ) async* {

  }
}
