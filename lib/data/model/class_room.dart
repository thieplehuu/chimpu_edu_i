import 'package:chimpu_edu_i/data/model/user.dart';

class ClassRoom {
  final int id;
  final String name;
  final List<User> teachers;
  const ClassRoom({this.id, this.name, this.teachers});
}