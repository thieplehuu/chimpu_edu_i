import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chimpu_edu_i/pages/blocs/main/bloc/main_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final MainBloc mainBloc;    

  LoginBloc({
    @required this.mainBloc,
  })  : assert(mainBloc != null);

  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();

      try {
        final mainService = this.mainBloc.mainService;
        final response = await mainService.authenticate(
          username: event.username,
          password: event.password,
          accountType: event.accountType
        );
        if(response.code == 200){          
          mainBloc.add(LoggedIn(token: response.token));
          yield LoginOK();
        } else {
          yield LoginFailure(error: response.message);
        }
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
  }
}
