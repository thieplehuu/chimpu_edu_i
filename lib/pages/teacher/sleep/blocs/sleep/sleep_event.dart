part of 'sleep_bloc.dart';

abstract class SleepEvent extends Equatable {
  const SleepEvent();
}

class LoadCommentsEvent extends SleepEvent {
  @override
  List<Object> get props => null;

}

class UpdateCommentUser extends SleepEvent {
  final User user;
  UpdateCommentUser({@required this.user});
  @override
  List<Object> get props => null;

}