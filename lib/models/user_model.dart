class User {
  String id;
  String username;
  String token;

  User({
    required this.id,
    required this.username,
    required this.token,
  });

  User.fromJson(var json)
      : id = json['id'],
        username = json['username'],
        token = json['token'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'username': username,
        'token': token,
      };
}
