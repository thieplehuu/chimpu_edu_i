
import 'package:chimpu_edu_i/utils/constants.dart' as Constants;
class User{
  final int id;
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
  const User({this.id, this.username, this.name, this.avatarUrl, this.address, this.birth, this.isRollup, this.rollupTime, this.isPickup, this.pickupTime, this.isOff});

  
  factory User.fromJson(Map<String, dynamic> json){
    var now = DateTime.now();
    return new User(
      id: json["id"],
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
    );
  }

  User copyWith({int id, String username, String name, String avatarUrl, String address, DateTime birth, bool isRollup, DateTime rollupTime, DateTime pickupTime, bool isPickup, bool isOff}) {
    return User(
      id: id ?? this.id,
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
    );
  }
}

User userFromJson(Map<String, dynamic> map) => User.fromJson(map);

