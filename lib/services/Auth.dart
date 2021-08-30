// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:mskola/models/AccounModel.dart';
//
// class AuthServices with ChangeNotifier{
//  final FirebaseAuth _auth = FirebaseAuth.instance;
//   CollectionReference users = FirebaseFirestore.instance.collection('users');
//
//  Stream<String> get onAuthStateChanged => _auth.authStateChanges().map((User user) => user?.uid);
// bool uidCheck;
//
//   AccountModel? _fireBaseData(User user){
//     return user !=null ? AccountModel(userId: user.uid, name: user.displayName, email: user.email): null;
//   }
//
//  String getCurrentUser() => _auth.currentUser.uid;
//
//   bool isLogin () => _auth?.currentUser?.uid != null ? true : false;
//
//
//   getProfileUser(){
//    return _auth.currentUser.displayName;
//   }
//
//   String getProfileDetails()=> _auth.currentUser.displayName;
//
//   String getDepartmentDetails()=> _auth.currentUser.uid;
//
//
//
//   Future<String> accountUser() async{
//       User user = await FirebaseAuth.instance.currentUser;
//       notifyListeners();
//   }
//
//   signInWithGoogle(BuildContext context) async{
//     final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
//     final GoogleSignIn _googleSignIn = GoogleSignIn();
//
//     final GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
//
//       final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
//
//       final AuthCredential credential = GoogleAuthProvider.credential(
//         idToken: googleSignInAuthentication.idToken,
//         accessToken: googleSignInAuthentication.accessToken
//       );
//
//        UserCredential result = await _firebaseAuth.signInWithCredential(credential);
//       User userDetails = result.user;
//        if(result != null){
//       // SharePreference().saveUserEmail(userDetails.email);
//       // SharePreference().saveUserId(userDetails.uid);
//       // SharePreference().saveDisplayName(userDetails.displayName);
//       // SharePreference().userProfileKey(userDetails.photoURL);
//
//       Map<String,  dynamic> userInfoMap ={
//           "email":userDetails.email,
//           "username":userDetails.email.replaceAll("@gmail.com", ""),
//           "name": userDetails.displayName,
//           "imgURL" : userDetails.photoURL
//
//       };
//
//       UserDatabase().addSignUp(userDetails.uid, userInfoMap).then((value){
//         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
//       });
//        }
//   }
//
//
//   // Future signOut() async{
//   //   SharedPreferences prefs = await SharedPreferences.getInstance();
//   //   prefs.clear();
//   //   await _auth.signOut();
//   // }
//
//   signOut(){
//     return _auth.signOut();
//   }
//
// //   Future resetPassword(String email)  {
// //     return   _auth.sendPasswordResetEmail(email: email);
// // }
//
//   Future<String> signUpWithEmailAndPassword(BuildContext context,String email, String password, matricId) async{
//     try {
//       UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
//           email: email,
//           password: password
//       );
//
//
//       await FirebaseAuth.instance.currentUser.updateProfile(displayName:matricId);
//       CollectionReference users = FirebaseFirestore.instance.collection('users');
//           return userCredential.user.uid;
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         showToastMessage(context: context, message: 'The password provided is too weak.');
//         SignUpScreen();
//       } else if (e.code == 'email-already-in-use') {
//
//       // print('');
//       showToastMessage(context: context, message: 'The account already exists for that email.');
//       SignUpScreen();
//       }
//       } catch (e) {
//       print(e);
//       }
//   }
//
//   Future<String> signInWithEmailAndPassword(BuildContext context, String email, String password) async{
//
//     try {
//       UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
//       return userCredential.user.uid;
//
//     }  on FirebaseAuthException catch (e) {
//       if (e.code == 'invalid-email') {
//         showToastMessage(context: context, message: 'Invalid Email Address');
//          SignInScreen();
//         // print(');
//       } else if (e.code == 'wrong-password') {
//         showToastMessage(context: context, message: 'Invalid Email Address or Password');
//         SignInScreen();
//       }
//     } catch (e) {
//       print(e);
//     }
//
//   }
//
//
//    getCheckRegId(String matricId) {
//
//     return FirebaseFirestore.instance
//         .collection('users')
//         .doc(matricId)
//         .get()
//         .then((DocumentSnapshot documentSnapshot) {
//       if (documentSnapshot.exists) {
//         return true;
//       }else return false;
//     });
//   }
//
//
//   getDetails() {
//
//     var userId = _auth.currentUser.displayName;
//     FirebaseFirestore.instance
//         .collection('users')
//         .where('username', isEqualTo: userId)
//         .get()
//         .then((QuerySnapshot querySnapshot) => {
//       querySnapshot.docs.forEach((doc) {
//         // print(doc["surname"]);
//         return  doc["department"];
//       })
//     });
//   }
//
//   Future resetPassword(String email) async{
//
//     try{
//       return await _auth.sendPasswordResetEmail(email: email);
//     }catch(e){
//       print(e);
//     }
//   }
// }