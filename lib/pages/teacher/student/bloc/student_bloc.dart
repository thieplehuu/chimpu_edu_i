import 'dart:async';

import 'package:chimpu_edu_i/models/media.dart';
import 'package:chimpu_edu_i/models/user.dart';
import 'package:chimpu_edu_i/services/main.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:chimpu_edu_i/pages/blocs/main/bloc/main_bloc.dart';
import 'package:equatable/equatable.dart';

part 'student_event.dart';
part 'student_state.dart';

class StudentBloc extends Bloc<StudentEvent, StudentState> {

  final MainBloc mainBloc;
  StudentBloc({@required this.mainBloc});

  @override
  StudentState get initialState => StudentInitial();

  @override
  Stream<StudentState> mapEventToState(
    StudentEvent event,
  ) async* {
    if (event is LoadStudentData){
      yield * _mapLoadDataToState(event);
    }
  }

  Stream<StudentState> _mapLoadDataToState(LoadStudentData event) async* {
    MainService mainService = mainBloc.mainService;
    var medias = await mainService.getUserMedias(event.user.id);
    if (medias != null){
      yield LoadDataOK(medias: medias);
    } else {
      yield LoadDataFailed();
    }
  }
}
