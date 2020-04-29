import 'package:chimpu_edu_i/models/teacher_comment.dart';
import 'package:chimpu_edu_i/utils/constants.dart' as Constants;

enum AccountType {
  teacher,
  parents
}

class UserAccountType{
  static int getValue(AccountType type){
    switch(type){
      case AccountType.teacher: 
        return 2;
      case AccountType.parents: 
        return 3;
    }
    return 0;
  }
}

class User{
  final int id;
  final int classRoomId;
  final String username;
  final String name;
  final String avatarUrl;
  final String address;
  final DateTime birth;
  final bool isRollup;
  final DateTime rollupTime;
  final bool isPickup;
  final DateTime pickupTime;
  final bool isOff;
  final TeacherComment sleepComment;
  final TeacherComment eatComment;
  const User({this.id, this.classRoomId, this.username, this.name, this.avatarUrl, this.address, this.birth, this.isRollup, this.rollupTime, this.isPickup, this.pickupTime, this.isOff, this.sleepComment, this.eatComment});

  
  factory User.fromJson(Map<String, dynamic> json){
    var now = DateTime.now();
    return new User(
      id: json["id"],
      classRoomId: json.containsKey("class_room_id") ? json["class_room_id"]:null,
      username: json["username"],
      name: json["fullname"],
      avatarUrl: Constants.SERVER_REMOTE + "/" + json['avatar_url'], 
      address: json["address"],
      birth: DateTime.parse(json["birth"]),
      rollupTime: json.containsKey("rollup_time") ? DateTime.parse(json["rollup_time"]):null,
      isRollup: !json.containsKey("rollup_time") || (DateTime.parse(json["rollup_time"]).day != now.day) ? false : true,
      pickupTime: json.containsKey("pickup_time") ? DateTime.parse(json["pickup_time"]):null,
      isPickup: !json.containsKey("pickup_time") || (DateTime.parse(json["pickup_time"]).day != now.day) ? false : true,
      isOff: false,
      sleepComment: json.containsKey("sleep_comment") ? TeacherComment.fromJson(json["sleep_comment"]) : null,
      eatComment: json.containsKey("eat_comment") ? TeacherComment.fromJson(json["eat_comment"]) : null,
    );
  }

  User copyWith({int id, int classRoomId, String username, String name, String avatarUrl, String address, DateTime birth, bool isRollup, DateTime rollupTime, DateTime pickupTime, bool isPickup, bool isOff, TeacherComment sleepComment, TeacherComment eatComment}) {
    return User(
      id: id ?? this.id,
      classRoomId: classRoomId ?? this.classRoomId,
      username: username ?? this.username,
      name: name ?? this.name,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      address: address ?? this.address,
      birth: birth ?? this.birth,
      isRollup: isRollup ?? this.isRollup,
      rollupTime: rollupTime ?? this.rollupTime,
      pickupTime: pickupTime ?? this.pickupTime,
      isPickup: isPickup ?? this.isPickup,
      isOff: isOff ?? this.isOff,
      sleepComment: sleepComment ?? this.sleepComment,
      eatComment: eatComment ?? this.eatComment,
    );
  }

  Map<String, Object> toJson() {
    return {
      'id': id,
      'classRoomId': classRoomId,
      'username': username,
      'name': name,
      'avatarUrl': avatarUrl,
      'address': address,
      'birth': birth,
      'isRollup': isRollup,
      'rollupTime': rollupTime,
      'pickupTime': pickupTime,
      'isPickup': isPickup,
      'isOff': isOff,
      'sleepComment': sleepComment.toJson(),
      'eatComment': eatComment.toJson(),
    };
  }
}

User userFromJson(Map<String, dynamic> map) => User.fromJson(map);

