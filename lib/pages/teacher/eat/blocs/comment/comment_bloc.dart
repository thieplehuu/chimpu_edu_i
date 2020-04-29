import 'dart:async';

import 'package:chimpu_edu_i/models/teacher_comment.dart';
import 'package:chimpu_edu_i/models/user.dart';
import 'package:chimpu_edu_i/services/main.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:chimpu_edu_i/pages/blocs/main/bloc/main_bloc.dart';
import 'package:equatable/equatable.dart';

part 'comment_event.dart';
part 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> { 

  final MainBloc mainBloc;
  CommentBloc({@required this.mainBloc});
  /*
  StreamSubscription mainSubscription;

  CommentBloc({@required this.mainBloc}) {
    mainSubscription = mainBloc.listen((state) {
      if (state is TodosLoaded) {
        add(UpdateTodos((todosBloc.state as TodosLoaded).todos));
      }
    });
  }
  */
  @override
  CommentState get initialState => CommentInitial();

  @override
  Stream<CommentState> mapEventToState(
    CommentEvent event,
  ) async* {
    if (event is AddComment){
      yield * _mapAddCommentToState(event);
    } 
  }
  Stream<CommentState> _mapAddCommentToState(AddComment event) async* {
    var auth = (mainBloc.state as AppReady).auth;
    MainService mainService = mainBloc.mainService;
    DateTime now = DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String date = formatter.format(now);
    var comment = await mainService.addTeacherComment(auth.classRoomId, event.user.id, auth.id, date, event.content, 'Eat');
    if (comment != null){
      yield CommentInitial();
      yield AddCommentOK(comment: comment);
    } else {
      yield AddCommentFailed();
    }
  }
}
