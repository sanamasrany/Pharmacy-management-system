import 'dart:convert';

Chatmodel chatmodelFromJson(String str) => Chatmodel.fromJson(json.decode(str));

String chatmodelToJson(Chatmodel data) => json.encode(data.toJson());

class Chatmodel {
  List<Messagee> messages;

  Chatmodel({
    required this.messages,
  });

  factory Chatmodel.fromJson(Map<String, dynamic> json) => Chatmodel(
    messages: List<Messagee>.from(json["messages"].map((x) => Messagee.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "messages": List<dynamic>.from(messages.map((x) => x.toJson())),
  };
}

class Messagee {
  int id;
  int from;
  int to;
  String body;
  DateTime createdAt;
  DateTime updatedAt;

  Messagee({
    required this.id,
    required this.from,
    required this.to,
    required this.body,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Messagee.fromJson(Map<String, dynamic> json) => Messagee(
    id: json["id"],
    from: json["from"],
    to: json["to"],
    body: json["body"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "from": from,
    "to": to,
    "body": body,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
