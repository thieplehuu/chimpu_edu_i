part of 'sleep_bloc.dart';

abstract class SleepState extends Equatable {
  const SleepState();
}

class SleepInitial extends SleepState {
  @override
  List<Object> get props => [];
}

class SleepUpdate extends SleepState {
  SleepUpdate();
  @override
  List<Object> get props => [];
}

class SleepReady extends SleepState {
  final List<User> users;

  SleepReady({@required this.users});
  @override
  List<Object> get props => [users];
}