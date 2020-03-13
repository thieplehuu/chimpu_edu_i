import 'dart:async';

import 'package:chimpu_edu_i/services/authenticate.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'authentication.dart';


class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticateService authenticateService;
  final int accountType;
  AuthenticationBloc({@required this.authenticateService, @required this.accountType})
      : assert(authenticateService != null);

  @override
  AuthenticationState get initialState => AuthenticationUninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      final bool hasToken = await authenticateService.hasToken();

      if (hasToken) {
        yield AuthenticationAuthenticated();
      } else {
        yield AuthenticationUnauthenticated();
      }
    }

    if (event is LoggedIn) {
      yield AuthenticationLoading();
      await authenticateService.persistToken(event.token);
      yield AuthenticationAuthenticated();
    }

    if (event is LoggedOut) {
      yield AuthenticationLoading();
      await authenticateService.deleteToken();
      yield AuthenticationUnauthenticated();
    }
  }
}