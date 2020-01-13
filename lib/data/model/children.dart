import 'package:chimpu_edu_i/data/model/parents.dart';

class Children {
  final int id;
  final String name;
  final Parents parents;
  final String avatarUrl;
  final List<String> images;
  final DateTime birth;
  const Children({this.id, this.name, this.parents, this.avatarUrl, this.images, this.birth});
}