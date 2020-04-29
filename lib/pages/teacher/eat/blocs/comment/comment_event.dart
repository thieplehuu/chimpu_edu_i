part of 'comment_bloc.dart';

abstract class CommentEvent extends Equatable {
  const CommentEvent();
}

class AddComment extends CommentEvent {
  final User user;
  final String content;
  AddComment({@required this.user, @required this.content});
  @override
  List<Object> get props => null;
}
