part of 'rollup_bloc.dart';

abstract class RollupEvent extends Equatable {
  const RollupEvent();
}

class LoadData extends RollupEvent {
  @override
  List<Object> get props => null;
}

class RollupChildren extends RollupEvent {
  final Children children;

  const RollupChildren(this.children);

  @override
  List<Object> get props => [children];

  @override
  String toString() => 'RollupChildren { todo: $children }';
}