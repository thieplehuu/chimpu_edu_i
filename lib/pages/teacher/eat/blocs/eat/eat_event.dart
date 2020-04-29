part of 'eat_bloc.dart';

abstract class EatEvent extends Equatable {
  const EatEvent();
}

class LoadCommentsEvent extends EatEvent {
  @override
  List<Object> get props => null;

}

class UpdateCommentUser extends EatEvent {
  final User user;
  UpdateCommentUser({@required this.user});
  @override
  List<Object> get props => null;

}