import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chimpu_edu_i/models/teacher_comment.dart';
import 'package:chimpu_edu_i/models/user.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:chimpu_edu_i/pages/blocs/main/bloc/main_bloc.dart';
import 'package:equatable/equatable.dart';

part 'eat_event.dart';
part 'eat_state.dart';

class EatBloc extends Bloc<EatEvent, EatState> {
  final MainBloc mainBloc;
  EatBloc({@required this.mainBloc});

  @override
  EatState get initialState => EatInitial();

  @override
  Stream<EatState> mapEventToState(
    EatEvent event,
  ) async* {
    if (event is LoadCommentsEvent) {
      var auth = (mainBloc.state as AppReady).auth;
      final users = (mainBloc.state as AppReady).users;
      var now = new DateTime.now();
      var formatter = new DateFormat('yyyy-MM-dd');
      String date = formatter.format(now);
      List<TeacherComment> comments =
          await mainBloc.mainService.getTeacherComments(auth.classRoomId, date);

      final List<User> updatedUsers = users.map<User>((user) {
        var updatedUser;
        for (var comment in comments) {
          if (comment.userAccountID == user.id) {
            if (comment.action == "Sleep") {
              updatedUser = user.copyWith(sleepComment: comment);
              break;
            } else if (comment.action == "Eat") {
              updatedUser = user.copyWith(eatComment: comment);
              break;
            }
          }
        }
        return updatedUser != null ? updatedUser : user;
      }).toList();
      yield EatReady(users: updatedUsers);
    } else if (event is UpdateCommentUser){
      var users = (state as EatReady).users;

      final List<User> updatedUsers = users.map<User>((user) {
        if(user.id == event.user.id){
          user = user.copyWith(eatComment: event.user.eatComment);
        }
        return user;
      }).toList();
      yield EatReady(users: updatedUsers);
    }
  }
}
