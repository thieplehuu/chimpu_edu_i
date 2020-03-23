part of 'rollup_bloc.dart';

abstract class RollupState extends Equatable {
  const RollupState();
}

class RollupInitial extends RollupState { 
  @override
  List<Object> get props => [];
}

class RollupUpdate extends RollupState {
  
  @override
  List<Object> get props => null;

  @override
  String toString() => 'RollupUpdate';
}

class RollupReady extends RollupState {
  final List<User> users;

  RollupReady({this.users});

  @override
  List<Object> get props => [users];

  @override
  String toString() => 'RollupReady { $users }';
}


class RollupLoading extends RollupState {
  @override
  List<Object> get props => [];@override
  String toString() => 'RollupLoading';
}