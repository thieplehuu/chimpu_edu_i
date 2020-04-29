part of 'comment_bloc.dart';

abstract class CommentState extends Equatable {
  const CommentState();
}

class CommentInitial extends CommentState {
  @override
  List<Object> get props => [];
}

class AddCommentOK extends CommentState {
  final TeacherComment comment;
  AddCommentOK({@required this.comment});
  @override
  List<Object> get props => [comment];
}

class AddCommentFailed extends CommentState {
  AddCommentFailed();
  @override
  List<Object> get props => [];
}