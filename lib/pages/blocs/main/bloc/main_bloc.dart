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
      //final user = await mainService.getAuth();
      //  yield DataLoading();
      final users = await mainService.getStudentsTimesheet();
      yield DataLoaded(
        users: users
      );
      } else {
        yield Unauthenticated();
      }
    } else if (event is LoggedIn) {
      await mainService.persistToken(event.token);
      yield DataLoading();
      final users = await mainService.getStudentsTimesheet();
      yield DataLoaded(
        users: users
      );
    } else if (event is LoggedOut) {
      await mainService.deleteToken();
      yield Unauthenticated();
    } else if (event is LoadData) {
      yield* _mapLoadDataToState();
    } else if (event is RollupUser){
      yield * _mapRollupUserToState(event);
    }
  }
  
  Stream<MainState> _mapLoadDataToState() async* {
    try {
      yield DataLoading();
      final users = await mainService.getStudentsTimesheet();
      yield DataLoaded(
        users: users
      );
    } catch (_) {
      yield DataNotLoaded();
    }
  }

  Stream<MainState> _mapRollupUserToState(RollupUser event) async* {
    if (state is DataLoaded) {
      final List<User> updatedUsers =_mapUpdateUserToState(event.user);
      yield DataLoaded(users: updatedUsers);
      //
      // send api update user here
      //_saveUsers(updatedUsers);
      //
    }
  }

  List<User> _mapUpdateUserToState(User updateUser) {

    final List<User> updatedUsers =
        (state as DataLoaded).users.map((user) {
      return user.id == updateUser.id ? updateUser : user;
    }).toList();

    return updatedUsers;
  }
}


