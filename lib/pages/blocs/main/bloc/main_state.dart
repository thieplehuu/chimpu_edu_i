part of 'main_bloc.dart';

abstract class MainState extends Equatable {
  const MainState();
}

class Initial extends MainState {
  @override
  List<Object> get props => [];
}

class Authenticated extends MainState {
  User auth;
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

class DataLoaded extends MainState {
  final List<User> users;

  const DataLoaded({@required this.users});
  @override
  List<Object> get props => [users];

  @override
  String toString() => 'DataLoaded { users: $users }';
}

class DataNotLoaded extends MainState {
  @override
  List<Object> get props => null;
}