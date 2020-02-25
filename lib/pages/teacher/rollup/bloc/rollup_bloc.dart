import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chimpu_edu_i/data/dummy/index.dart';
import 'package:chimpu_edu_i/data/model/children.dart';
import 'package:chimpu_edu_i/repositories/parents_repository.dart';
import 'package:equatable/equatable.dart';

part 'rollup_event.dart';
part 'rollup_state.dart';

class RollupBloc extends Bloc<RollupEvent, RollupState> {
  @override
  RollupState get initialState => RollupInitial();

  final ChildrensRepository childrensRepository;

  ChildrensRepository({@required this.childrensRepository});

  @override
  Stream<RollupState> mapEventToState(RollupEvent event) async* {
    if (event is LoadData) {
      yield* _mapLoadChildrensToState();
    } else if (event is RollupChildren) {
      yield* _mapRollupChildrenToState(event);
    }
  }

  Stream<RollupState> _mapLoadChildrensToState() async* {
    try {
      final todos = await this.childrensRepository.loadChildrens();
      yield RollupLoaded(
        todos.map(Children.fromEntity).toList(),
      );
    } catch (_) {
      yield RollupNotLoaded();
    }
  }

  Stream<RollupState> _mapRollupChildrenToState(RollupChildren event) async* {
    if (state is RollupLoaded) {
      final List<Children> updatedChildrens = List.from((state as RollupLoaded).childrens)
        ..add(event.children);
      yield RollupLoaded(updatedChildrens);
      _saveChildrens(updatedChildrens);
    }
  }

  Future _saveChildrens(List<Children> childrens) {
    return childrensRepository.saveChildrens(
      childrens.map((children) => children.toEntity()).toList(),
    );
  }
}
