import 'dart:async';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:chimpu_edu_i/pages/blocs/main/bloc/main_bloc.dart';
import 'package:equatable/equatable.dart';

part 'menufood_event.dart';
part 'menufood_state.dart';

class MenuFoodBloc extends Bloc<MenuFoodEvent, MenuFoodState> {

  final MainBloc mainBloc;

  MenuFoodBloc({@required this.mainBloc});

  @override
  MenuFoodState get initialState => MenuFoodInitial();

  @override
  Stream<MenuFoodState> mapEventToState(
    MenuFoodEvent event,
  ) async* {

  }
}
