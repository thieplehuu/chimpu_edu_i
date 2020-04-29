class TeacherComment {
  final int id;
  final int classRoomID;
  final int userAccountID;
  final int ownerID;
  final DateTime date;
  final String action;
  final String content;
  const TeacherComment(
      {this.id,
      this.classRoomID,
      this.userAccountID,
      this.ownerID,
      this.date,
      this.action,
      this.content});

  factory TeacherComment.fromJson(Map<String, dynamic> json) {
    return new TeacherComment(
        id: json["id"],
        classRoomID: json["class_room_id"],
        userAccountID: json["user_account_id"],
        ownerID: json["owner_id"],
        date: DateTime.parse(json["date"]),
        action: json["action"],
        content: json["content"]);
  }

  TeacherComment copyWith(
      {int id,
      int classRoomID,
      int userAccountID,
      int ownerID,
      DateTime date,
      String action,
      String content}) {
    return TeacherComment(
      id: id ?? this.id,
      classRoomID: classRoomID ?? this.classRoomID,
      userAccountID: userAccountID ?? this.userAccountID,
      ownerID: ownerID ?? this.ownerID,
      date: date ?? this.date,
      action: action ?? this.action,
      content: content ?? this.content,
    );
  }

  Map<String, Object> toJson() {
    return {
      'id': id,
      'classRoomId': classRoomID,
      'userAccountID': userAccountID,
      'ownerID': ownerID,
      'date': date.toString(),
      'action': action,
      'content': content,
    };
  }
}

TeacherComment teacherCommentFromJson(Map<String, dynamic> map) =>
    TeacherComment.fromJson(map);
