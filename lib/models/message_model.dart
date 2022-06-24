class Message {
  String id;
  String text;
  String fromId;
  String fromUsername;
  DateTime createdAt;

  Message({
    required this.id,
    required this.text,
    required this.fromId,
    required this.fromUsername,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  Message.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? "",
        text = json['text'],
        fromId = json['from_id'],
        fromUsername = json['from_username'],
        createdAt = DateTime.parse(json['createdAt']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'text': text,
        'from_id': fromId,
        'from_username': fromUsername,
        'createdAt': createdAt.toString(),
      };
}
