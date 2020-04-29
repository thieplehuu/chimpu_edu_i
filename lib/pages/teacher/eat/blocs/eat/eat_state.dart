part of 'eat_bloc.dart';

abstract class EatState extends Equatable {
  const EatState();
}

class EatInitial extends EatState {
  @override
  List<Object> get props => [];
}

class EatUpdate extends EatState {
  EatUpdate();
  @override
  List<Object> get props => [];
}

class EatReady extends EatState {
  final List<User> users;

  EatReady({@required this.users});
  @override
  List<Object> get props => [users];
}