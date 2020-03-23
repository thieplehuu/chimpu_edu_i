part of 'main_bloc.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();
}
class AppStarted extends MainEvent {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class LoggedIn extends MainEvent {
  final String token;

  const LoggedIn({@required this.token});

  @override
  List<Object> get props => [token];

  @override
  String toString() => 'LoggedIn { token: $token }';
}

class LoggedInOk extends MainEvent {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'LoggedInOk';
}

class LoggedOut extends MainEvent {
  @override
  // TODO: implement props
  List<Object> get props => null;
}
class LoadData extends MainEvent {
  @override  
  List<Object> get props => null;
}

class RollupUser extends MainEvent{
  @override
  List<Object> get props => null;

  final User user;
  RollupUser({@required this.user});
}

class UpdateUser extends MainEvent {
  
  final User user;
  UpdateUser({@required this.user});

  @override
  List<Object> get props => null;
}