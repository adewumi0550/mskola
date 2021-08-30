import 'dart:convert';

// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

AccountModel userFromJson(String str) {
  final jsonData = json.decode(str);
  return AccountModel.fromJson(jsonData);
}

String userToJson(AccountModel data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class AccountModel {
  String userId;
  String name;
  String email;

  AccountModel({
    required this.userId,
    required this.name,
    required this.email,
  });

  factory AccountModel.fromJson(Map<String, dynamic> json) => new AccountModel(
    userId: json["userId"],
    name: json["name"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "name": name,
    "email": email,
  };

// factory AccountModel.fromJson(DocumentChangeType.data) {
//   return AccountModel.fromJson(doc.data);
// }
}
