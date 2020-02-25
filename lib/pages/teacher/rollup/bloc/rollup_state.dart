part of 'rollup_bloc.dart';

abstract class RollupState extends Equatable {
  const RollupState();
}

class RollupInitial extends RollupState {
  @override
  List<Object> get props => [];
}

class RollupLoaded extends RollupInitial {
  final List<Children> childrens;

  RollupLoaded([this.childrens = const []]);

  @override
  List<Object> get props => [childrens];

  @override
  String toString() => 'RollupLoaded { todos: $childrens }';
}


class RollupNotLoaded extends RollupState {
  @override
  List<Object> get props => [];
}