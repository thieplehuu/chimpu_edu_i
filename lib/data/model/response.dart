class Response<T> {
  int code;
  String token;
  String message;
  T data;

  Response({this.code, this.token, this.message, this.data});

  factory Response.fromJson(Map<String, dynamic> json) {
    return Response(
      code: json['code'],
      token: json['token'],
      message: json['message'],
      data: json["data"],
    );
  }
}