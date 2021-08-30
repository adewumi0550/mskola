import 'package:cloud_firestore/cloud_firestore.dart';

class UserDatabase{
  Future addSignUp(String  userId, Map<String, dynamic> userInfoMap) async{
    return FirebaseFirestore.instance.collection('users').doc(userId).set(userInfoMap);
  }
}