class Picnic{
  final int id;
  final String title;
  final String thumbnailUrl;
  final String address;
  final String content;
  final DateTime createAt;
  const Picnic({this.id, this.title, this.thumbnailUrl, this.address, this.content, this.createAt});

 factory Picnic.fromJson(Map<String, dynamic> json){
    return new Picnic(
      id: json["id"],
      title: json["title"],
      thumbnailUrl: json["thumbnail_url"],
      address: json["address"],
      content: json["content"],
      createAt: DateTime.parse(json["created_at"]),
    );
  }

  Picnic copyWith({int id, String title, String thumbnailUrl, String address, String content, DateTime createAt}) {
    return Picnic(
      id: id ?? this.id,
      title: title ?? this.title,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      address: address ?? this.address,
      content: content ?? this.content,
      createAt: createAt ?? this.createAt,
    );
  }

  Map<String, Object> toJson() {
    return {
      'id': id,
      'title': title,
      'thumbnail_url':thumbnailUrl,
      'address': address,
      'content': content,
      'created_at': createAt,
    };
  }
}

Picnic picnicFromJson(Map<String, dynamic> map) => Picnic.fromJson(map);