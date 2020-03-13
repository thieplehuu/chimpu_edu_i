import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chimpu_edu_i/authentication/bloc/authentication.dart';
import 'package:chimpu_edu_i/services/authenticate.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthenticateService authenticateService;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({
    @required this.authenticateService,
    @required this.authenticationBloc,
  })  : assert(authenticateService != null),
        assert(authenticationBloc != null);

  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();

      try {
        final response = await authenticateService.authenticate(
          username: event.username,
          password: event.password,
          accountType: authenticationBloc.accountType
        );
        if(response.code == 200){          
          authenticationBloc.add(LoggedIn(token: response.token));
          yield LoginInitial();
        } else {
          yield LoginFailure(error: response.message);
        }
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
  }
}
