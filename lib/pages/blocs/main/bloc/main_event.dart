part of 'main_bloc.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();
}
class AppStarted extends MainEvent {
  @override
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
  List<Object> get props => null;
}

class RollupUser extends MainEvent{
  @override
  List<Object> get props => null;

  final User user;
  RollupUser({@required this.user});
}

class PickupUser extends MainEvent{
  @override
  List<Object> get props => null;

  final User user;
  PickupUser({@required this.user});
}

class UpdateUser extends MainEvent {
  
  final User user;
  UpdateUser({@required this.user});

  @override
  List<Object> get props => null;
}

class UpdateUsers extends MainEvent {
  
  final List<User> users;
  UpdateUsers({@required this.users});

  @override
  List<Object> get props => null;
}