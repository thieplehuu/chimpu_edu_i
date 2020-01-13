import 'package:chimpu_edu_i/data/model/teacher.dart';

class ClassRoom {
  final int id;
  final String name;
  final List<Teacher> teachers;
  const ClassRoom({this.id, this.name, this.teachers});
}