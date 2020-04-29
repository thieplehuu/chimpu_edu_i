part of 'student_bloc.dart';

abstract class StudentEvent extends Equatable {
  const StudentEvent();
}

class LoadStudentData extends StudentEvent {
  final User user;
  LoadStudentData({@required this.user});
  @override
  List<Object> get props => null;
}