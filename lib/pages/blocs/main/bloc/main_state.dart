part of 'main_bloc.dart';

abstract class MainState extends Equatable {
  const MainState();
}

class Initial extends MainState {
  @override
  List<Object> get props => [];
}

class Authenticated extends MainState {
  final User auth;
  Authenticated({@required this.auth});

  @override
  List<Object> get props => null;
}

class Unauthenticated extends MainState {
  @override
  List<Object> get props => null;
}

class DataLoading extends MainState {
  @override
  List<Object> get props => null;
}

class AppReady extends MainState {
  
  final User auth;
  final List<User> users;

  const AppReady({@required this.auth, @required this.users});
  @override
  List<Object> get props => [users];

  @override
  String toString() => 'AppReady { users: $users }';
}

class DataNotLoaded extends MainState {
  @override
  List<Object> get props => null;
}