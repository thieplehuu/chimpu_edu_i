part of 'rollup_bloc.dart';

abstract class RollupEvent extends Equatable {
  RollupEvent([List props = const []]) : super();
}

class InitData extends RollupEvent {
    @override
  String toString() => 'InitData';

  @override
  List<Object> get props => [];
}

class RollupUpdateUser extends RollupEvent {
  final User user;

  RollupUpdateUser({this.user}) : super([user]);

  @override
  String toString() => 'RollupUpdateUser { users: $user }';

  @override
  List<Object> get props => [user];
}