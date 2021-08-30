class UserModel{

  final int uid;
  final String name;
  final String email;
  final String photoURL;
  final String phone;
  final String matricNumber;
  final String department;
  final String level;
  final String session;
  final bool isOnline;
  final String chatLast;

  UserModel({
      required this.uid ,
     required this.name,
    required  this.email,
    required  this.photoURL,
    required  this.phone,
    required  this.matricNumber,
    required  this.department,
     required this.level,
      required this.session,
      required this.isOnline,
      required this.chatLast});
}

// final UserModel cosc301 = UserModel(
//     uid: 1,
//     name: "COSC 301",
//     chatLast: '4th january, 2021',
//     isOnline: true
// );



