// import 'package:elephant_detecting/Screens/user_model.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'Admin_Screens/admin.dart';
// import 'Screens/driver.dart';
//
//
// class MainDashBoard extends StatefulWidget {
//   @override
//   _MainDashBoardState createState() => _MainDashBoardState();
// }
//
// class _MainDashBoardState extends State<MainDashBoard> {
//   _MainDashBoardState();
//   @override
//   Widget build(BuildContext context) {
//     return contro();
//   }
// }
//
// class contro extends StatefulWidget {
//   contro();
//
//   @override
//   _controState createState() => _controState();
// }
//
// class _controState extends State<contro> {
//   _controState();
//   User? user = FirebaseAuth.instance.currentUser;
//   UserModel loggedInUser = UserModel();
//   var rooll;
//   var email;
//   var id;
//   @override
//   void initState(){
//     super.initState();
//     FirebaseFirestore.instance.collection("users").doc(user!.uid).get().then((value){
//       this.loggedInUser = UserModel.fromMap(value.data());
//     }).whenComplete(() {
//       CircularProgressIndicator();
//       setState(() {
//         email = loggedInUser.email.toString();
//         rooll=loggedInUser.wrole.toString();
//         id=loggedInUser.uid.toString();
//       });
//     });
//   }
//   routing(){
//     if (rooll == 'Driver') {
//       return Driver(
//         id: id,
//       );
//     } else {
//       return Admin(
//         id: id,
//       );
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     CircularProgressIndicator();
//     return routing();
//   }
// }
