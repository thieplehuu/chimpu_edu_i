import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chimpu_edu_i/data/model/user.dart';
import 'package:equatable/equatable.dart';

part 'rollup_event.dart';
part 'rollup_state.dart';

class RollupBloc extends Bloc<RollupEvent, RollupState> {
  StreamSubscription mainSubscription;
  
  @override
  RollupState get initialState => RollupInitial();

  @override
  Stream<RollupState> mapEventToState(RollupEvent event) async* {
    /*
    if (event is InitData) {
      List<User> users = (mainBloc.state as DataLoaded).users;
      yield RollupReady(users: users);
    } else if (event is RollupUpdateUser){
      List<User> users = (state as RollupReady).users;
      yield RollupUpdate();
      mainBloc.add(UpdateUser(user:event.user));
      var users = (mainBloc.state as DataLoaded).users;
      yield RollupReady(users: users);
    }
    */
  }
}
