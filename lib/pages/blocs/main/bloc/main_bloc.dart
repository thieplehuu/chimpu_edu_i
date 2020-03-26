import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chimpu_edu_i/data/model/user.dart';
import 'package:chimpu_edu_i/services/main.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainService mainService;
  MainBloc({@required this.mainService})
      : assert(mainService != null);
  /*
  AuthenticationBloc authBloc;
  StreamSubscription authenticationSubscription;
  
  MainBloc({@required this.authBloc}) {
    authenticationSubscription = authBloc.listen((state) {
      if (state is AuthenticationAuthenticated) {
        add(LoadData());
      }
    });
  }
  */
  @override
  MainState get initialState => Initial();


  @override
  Stream<MainState> mapEventToState(
    MainEvent event,
  ) async* {
    if (event is AppStarted) {
      final String token = await mainService.getAccessToken();

      if (token != null && token.isEmpty == false) {
      final user = await mainService.getAuth();
      //  yield DataLoading();
      final users = await mainService.getStudentsTimesheet();
      yield AppReady(
        auth: user,
        users: users
      );
      } else {
        yield Unauthenticated();
      }
    } else if (event is LoggedIn) {
      await mainService.persistToken(event.token);
      yield DataLoading();
      final user = await mainService.getAuth();
      final users = await mainService.getStudentsTimesheet();
      yield AppReady(
        auth: user,
        users: users
      );
    } else if (event is LoggedOut) {
      await mainService.deleteToken();
      yield Unauthenticated();
    } else if (event is RollupUser){
      yield * _mapRollupUserToState(event);
    } else if (event is PickupUser){
      yield * _mapPickupUserToState(event);
    }
  }
  
  Stream<MainState> _mapRollupUserToState(RollupUser event) async* {
    if (state is AppReady) {
      var auth = (state as AppReady).auth;
      final List<User> updatedUsers =_mapUpdateUserToState(event.user);
      yield AppReady(auth: auth, users: updatedUsers);
      //
      // send api update user here
      //_saveUsers(updatedUsers);
      //
    }
  }

  Stream<MainState> _mapPickupUserToState(PickupUser event) async* {
    if (state is AppReady) {
      var auth = (state as AppReady).auth;
      final List<User> updatedUsers =_mapUpdateUserToState(event.user);
      yield AppReady(auth:auth, users: updatedUsers);
      //
      // send api update user here
      //_saveUsers(updatedUsers);
      //
    }
  }

  List<User> _mapUpdateUserToState(User updateUser) {

    final List<User> updatedUsers =
        (state as AppReady).users.map((user) {
      return user.id == updateUser.id ? updateUser : user;
    }).toList();

    return updatedUsers;
  }
}


