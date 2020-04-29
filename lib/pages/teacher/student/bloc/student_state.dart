part of 'student_bloc.dart';

abstract class StudentState extends Equatable {
  const StudentState();
}

class StudentInitial extends StudentState {
  @override
  List<Object> get props => [];
}

class LoadDataOK extends StudentState {
  final List<Media> medias;
  LoadDataOK({this.medias});
  @override
  List<Object> get props => [medias];
}

class LoadDataFailed extends StudentState {
  @override
  List<Object> get props => [];
}