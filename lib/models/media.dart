enum MediaType {
  video,
  image,
  file
}

class UserMediaType{
  static String getValue(MediaType type){
    switch(type){
      case MediaType.video: 
        return "video";
      case MediaType.image: 
        return "image";
      case MediaType.file: 
        return "file";
    }
    return "";
  }

  static MediaType fromValue(String value){
    switch(value){
      case "video": 
        return MediaType.video;
      case "image": 
        return MediaType.image;
      case "file": 
        return MediaType.file;
    }
    return null;
  }
}

class Media{
  final int id;
  final int userAccountId;
  final MediaType type;
  final String url;
  final DateTime createAt;
  const Media({this.id, this.userAccountId, this.url, this.type, this.createAt});

  
  factory Media.fromJson(Map<String, dynamic> json){
    return new Media(
      id: json["id"],
      userAccountId: json["user_account_id"],
      type: UserMediaType.fromValue(json["type"]),
      url: json["url"],
      createAt: DateTime.parse(json["created_at"]),
    );
  }

  Media copyWith({int id, int userAccountId, MediaType type, String url, DateTime createAt}) {
    return Media(
      id: id ?? this.id,
      userAccountId: userAccountId ?? this.userAccountId,
      type: type ?? this.type,
      url: url ?? this.url,
      createAt: createAt ?? this.createAt,
    );
  }

  Map<String, Object> toJson() {
    return {
      'id': id,
      'user_account_id': userAccountId,
      'type': UserMediaType.getValue(type),
      'url': url,
      'created_at': createAt,
    };
  }
}

Media mediaFromJson(Map<String, dynamic> map) => Media.fromJson(map);

