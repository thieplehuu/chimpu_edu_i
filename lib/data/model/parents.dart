import 'package:chimpu_edu_i/data/model/children.dart';

class Parents {  
  final int id;
  final String email;
  final String name;
  final String avatarUrl;
  final String mobile;
  final String address;
  final List<Children> childrens;
  const Parents({this.id, this.email, this.name, this.avatarUrl, this.mobile, this.address, this.childrens});
}