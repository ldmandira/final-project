// import 'package:elephant_detecting/Screens/login_screen.dart';
// import 'package:elephant_detecting/Screens/user_dashboard.dart';
// import 'package:elephant_detecting/Screens/user_model.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:elephant_detecting/Screens/theme_helper.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'dart:io';
// import '../Authenticate/Methods.dart';
// import 'login_page.dart';
//
// class CreateAccount extends StatefulWidget {
//   @override
//   _CreateAccountState createState() => _CreateAccountState();
// }
//
// class _CreateAccountState extends State<CreateAccount> {
//
//   final google = GoogleSignIn();
//   GoogleSignInAccount? user;
//   GoogleSignInUser()async {
//     try{
//       final googleMethod = await google.signIn();
//       user = googleMethod;
//       final auth = await googleMethod!.authentication;
//       final cred = GoogleAuthProvider.credential(
//           accessToken: auth.idToken, idToken: auth.idToken
//       );
//       await FirebaseAuth.instance.signInWithCredential(cred).whenComplete(() {
//         print(user!.email.toString());
//         print(user!.displayName.toString());
//         print(user!.photoUrl.toString());
//       });
//       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>UserDashBoardPage()));
//
//     }catch(e){
//       print(e);
//     }
//
//   }
//
//   bool showProgress = false;
//   bool visible = false;
//
//   final _formKey = GlobalKey<FormState>();
//   final _auth = FirebaseAuth.instance;
//
//   CollectionReference ref = FirebaseFirestore.instance.collection('users');
//   final TextEditingController passwordController = new TextEditingController();
//   final TextEditingController confirmpassController = new TextEditingController();
//   final TextEditingController emailController = new TextEditingController();
//   final TextEditingController nameController = new TextEditingController();
//
//   bool isLoading = false;
//   bool _isObscure = true;
//   bool _isObscure2 = true;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFF99EDC3).withOpacity(.55),
//       body: Form(
//         key: _formKey,
//         child:Stack(
//           children: [
//             Positioned(
//               top:0,
//               right: 0,
//               left: 0,
//               child: Container(
//                 height: 270,
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                       image: AssetImage("assets/signup.jpg"),
//                       fit: BoxFit.fill
//                   ),
//                 ),
//                 child: Container(
//                   padding: EdgeInsets.only(top: 160,left: 80),
//                   color: Color(0xFF03AC13).withOpacity(.20),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       RichText(text: TextSpan(
//                         text: "Get's Started!",
//                         style: TextStyle(
//                           fontSize: 30,
//                           color: Colors.teal,
//                         ),
//                       ),
//                       ),
//                       SizedBox(
//                         height: 3,
//                       ),
//                       Text(
//                         "SignUp to Continue",
//                         style: TextStyle(
//                           letterSpacing: 1,
//                           color: Colors.grey,
//                           fontSize: 16,
//                         ),
//                       )
//                     ],
//                   ),
//
//                 ),
//               ),
//             ),
//             buildBottomHalfContainer(true),
//             AnimatedPositioned(
//               duration: Duration(milliseconds: 700),
//               curve: Curves.bounceInOut,
//               top: 230 ,
//               child: AnimatedContainer(
//                 duration: Duration(milliseconds: 700),
//                 curve: Curves.bounceInOut,
//                 height:  430,
//                 padding: EdgeInsets.all(20),
//                 width:MediaQuery.of(context).size.width-40,
//                 margin: EdgeInsets.symmetric(horizontal: 20),
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(15),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withOpacity(0.3),
//                         blurRadius: 15,
//                         spreadRadius: 5,
//                       )
//                     ]
//                 ),
//                 child:  Container(
//                   child: Column(
//                     children: [
//                       Text("SIGN UP",style: TextStyle(
//                         fontSize: 20, fontWeight: FontWeight.bold,
//                         color: ThemeHelper.activeColor,
//                       ),),
//                       Container(
//                         margin: EdgeInsets.only(top: 3),
//                         height: 2,
//                         width: 55,
//                         color: Colors.teal,
//                       ),
//                       SizedBox(height: 10,),
//                       Container(
//                         padding: const EdgeInsets.only(bottom: 8.0),
//                         child: TextFormField(
//                           controller: nameController,
//                           autofocus: false,
//                           decoration: InputDecoration(
//                             prefixIcon: Icon(
//                               Icons.train,
//                               color:Colors.grey,
//                             ),
//                             labelStyle: TextStyle(fontSize: 20.0),
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color: Colors.grey),
//                               borderRadius: BorderRadius.all(Radius.circular(35.0)),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color: Colors.grey),
//                               borderRadius: BorderRadius.all(Radius.circular(35.0)),
//                             ),
//                             contentPadding: EdgeInsets.all(10),
//                             hintText: "Train Name",
//                             filled: true,
//                             fillColor: Colors.white,
//                             enabled: true,
//                             hintStyle: TextStyle(fontSize: 14,color: Colors.grey[400]),
//                             errorStyle:
//                             TextStyle(color: Colors.redAccent,
//                                 fontSize: 14),
//                           ),
//                           validator: (value) {
//                             if (value!.length == 0) {
//                               return "Name cannot be empty";
//                             }
//                             else {
//                               return null;
//                             }
//                           },
//                           onChanged: (value) {},
//                           keyboardType: TextInputType.name,
//                         ),
//                       ),
//                       Container(
//                         padding: const EdgeInsets.only(bottom: 8.0),
//                         child: TextFormField(
//                           controller: emailController,
//                           autofocus: false,
//                           decoration: InputDecoration(
//                             prefixIcon: Icon(
//                               Icons.email,
//                               color:Colors.grey,
//                             ),
//                             labelStyle: TextStyle(fontSize: 20.0),
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color: Colors.grey),
//                               borderRadius: BorderRadius.all(Radius.circular(35.0)),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color: Colors.grey),
//                               borderRadius: BorderRadius.all(Radius.circular(35.0)),
//                             ),
//                             contentPadding: EdgeInsets.all(10),
//                             hintText: "Train Email",
//                             filled: true,
//                             fillColor: Colors.white,
//                             enabled: true,
//                             hintStyle: TextStyle(fontSize: 14,color: Colors.grey[400]),
//                             errorStyle:
//                             TextStyle(color: Colors.redAccent,
//                                 fontSize: 14),
//                           ),
//                           validator: (value) {
//                             if (value!.length == 0) {
//                               return "Email cannot be empty";
//                             }
//                             if (!RegExp(
//                                 "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
//                                 .hasMatch(value)) {
//                               return ("Please enter a valid email");
//                             } else {
//                               return null;
//                             }
//                           },
//                           onChanged: (value) {},
//                           keyboardType: TextInputType.emailAddress,
//                         ),
//                       ),
//                       Container(
//                         padding: const EdgeInsets.only(bottom: 8.0),
//                         child: TextFormField(
//                           autofocus: false,
//                           obscureText: _isObscure,
//                           controller: passwordController,
//                           decoration: InputDecoration(
//                             prefixIcon: Icon(
//                               Icons.password,
//                               color:Colors.grey,
//                             ),
//                             labelStyle: TextStyle(fontSize: 20.0),
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color: Colors.grey),
//                               borderRadius: BorderRadius.all(Radius.circular(35.0)),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color: Colors.grey),
//                               borderRadius: BorderRadius.all(Radius.circular(35.0)),
//                             ),
//                             contentPadding: EdgeInsets.all(10),
//                             suffixIcon: IconButton(
//                               icon: Icon(_isObscure
//                                   ? Icons.visibility_off
//                                   :Icons.visibility),
//                               onPressed: (){
//                                 setState(() {
//                                   _isObscure=!_isObscure;
//                                 });
//                               },
//                             ),
//                             filled: true,
//                             fillColor: Colors.white,
//                             hintText: "Train Password",
//                             enabled: true,
//                             hintStyle: TextStyle(fontSize: 14,color: Colors.grey[400]),
//                             errorStyle:
//                             TextStyle(color: Colors.redAccent,
//                                 fontSize: 14),
//                           ),
//                           validator: (value){
//                             RegExp regex = new RegExp(r'^.{6,}$');
//                             if (value!.isEmpty) {
//                               return "Password cannot be empty";
//                             }
//                             if (!regex.hasMatch(value)) {
//                               return ("please enter valid password min. 6 character");
//                             } else {
//                               return null;
//                             }
//                           },
//                           onChanged: (value) {},
//                         ),
//                       ),
//                       Container(
//                         padding: const EdgeInsets.only(bottom: 8.0),
//                         child: TextFormField(
//                           autofocus: false,
//                           obscureText: _isObscure2,
//                           controller: confirmpassController,
//                           decoration: InputDecoration(
//                             prefixIcon: Icon(
//                               Icons.password,
//                               color:Colors.grey,
//                             ),
//                             labelStyle: TextStyle(fontSize: 20.0),
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color: Colors.grey),
//                               borderRadius: BorderRadius.all(Radius.circular(35.0)),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color: Colors.grey),
//                               borderRadius: BorderRadius.all(Radius.circular(35.0)),
//                             ),
//                             contentPadding: EdgeInsets.all(10),
//                             suffixIcon: IconButton(
//                                 icon: Icon(_isObscure2
//                                     ? Icons.visibility_off
//                                     : Icons.visibility),
//                                 onPressed: () {
//                                   setState(() {
//                                     _isObscure2 = !_isObscure2;
//                                   });
//                                 }),
//                             filled: true,
//                             fillColor: Colors.white,
//                             hintText: "Confirm Train Password",
//                             enabled: true,
//                             hintStyle: TextStyle(fontSize: 14,color: Colors.grey[400]),
//                             errorStyle:
//                             TextStyle(color: Colors.redAccent,
//                                 fontSize: 14),
//                           ),
//                           validator: (value) {
//                             if (confirmpassController.text !=
//                                 passwordController.text) {
//                               return "Password did not match";
//                             } else {
//                               return null;
//                             }
//                           },
//                           onChanged: (value) {},
//                         ),
//                       ),
//                   Column(
//                     children: [
//                       Row(
//                                 children: [
//                                   Expanded(
//                                     child: Padding(
//                                       padding: const EdgeInsets.symmetric(horizontal: 10),
//                                       child: Divider(
//                                         color: Colors.teal,
//                                         thickness: 2,
//                                       ),
//                                     ),
//                                   ),
//                                   Text(
//                                     'Or continue ',
//                                     style: TextStyle(color: Colors.teal),
//                                   ),
//                                   Expanded(
//                                     child: Padding(
//                                       padding: const EdgeInsets.symmetric(horizontal: 10),
//                                       child: Divider(
//                                         color: Colors.teal,
//                                         thickness: 2,
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                       )
//                     ],
//                   ),
//                       Container(
//                           child:Column(
//                             children: [
//                               ElevatedButton.icon(
//                                 style: ElevatedButton.styleFrom(
//                                   primary: Colors.grey[300],
//                                   onPrimary: Colors.black,
//                                   minimumSize: Size(double.infinity,40),
//                                   shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(50)
//                                   ),
//                                 ),
//                                 onPressed: (){
//                                   GoogleSignInUser();
//                                 },
//                                 icon: FaIcon(FontAwesomeIcons.google,color: Colors.teal,),
//                                 label: Text('Sign Up With Google'),
//                               ),
//                             ],
//                           )
//                       ),
//                       SizedBox(height: 5,),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: <Widget>[
//                       Text("Already Registered?",
//                         style: TextStyle(color: Colors.grey),
//                       ),
//                             SizedBox(width: 5,),
//                             GestureDetector(
//                               onTap: (){
//                                 Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
//                               },
//                               child: Text("Click Here to Login",
//                               style:TextStyle(
//                                 fontSize: 17, color: Colors.teal,
//                               ) ,),
//                             ),
//
//                         ],
//                       ),
//
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             buildBottomHalfContainer(false),
//           ],
//         ) ,
//       ),
//     );
//   }
//   Positioned buildBottomHalfContainer(bool showShadow){
//     return Positioned(
//       top:610,
//       right: 0,
//       left: 0,
//       child: Center(
//         child:!showShadow? Container(
//           height:90,
//           width: 90,
//           padding:EdgeInsets.all(15),
//           decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(50),
//               boxShadow: [
//                 if(showShadow)
//                   BoxShadow(
//                       color: Colors.black.withOpacity(.3),
//                       spreadRadius: 1.5,
//                       blurRadius: 10,
//                       offset: Offset(0,1)
//                   )
//               ]
//           ),
//           child: Container(
//             child:Column(
//               children: [
//                 MaterialButton(
//                   height: 60,
//                   onPressed: (){
//                         if(_formKey.currentState!.validate()){
//                       setState(() {
//                         showProgress =true;
//                       });
//                     signUp(emailController.text, passwordController.text);
//                     }
//                   },
//                   child: Container(
//                     child:Icon(
//                         Icons.arrow_forward),
//                   ),
//                 ),
//               ],
//             ),
//             decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [Colors.green,Colors.white],
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                 ),
//                 borderRadius: BorderRadius.circular(30),
//                 boxShadow: [
//                   BoxShadow(
//                       color: Colors.black.withOpacity(.3),
//                       spreadRadius: 1,
//                       blurRadius: 2,
//                       offset: Offset(0,1)
//                   )
//                 ]
//             ),
//           ),
//
//         ):Center(),
//       ),
//     );
//   }
//   void signUp(String email, String password) async{
//     CircularProgressIndicator();
//     if(_formKey.currentState!.validate()){
//       await _auth.createUserWithEmailAndPassword(email: email, password: password).
//       then((value) => {postDetailsToFirestore(email)}).catchError((e){});
//     }
//   }
//   postDetailsToFirestore(String email) async {
//     FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
//     User? user = _auth.currentUser;
//     UserModel userModel = UserModel();
//     userModel.email = email;
//     userModel.uid = user!.uid;
//     await firebaseFirestore
//         .collection("users")
//         .doc(user.uid)
//         .set(userModel.toMap());
//
//     Navigator.pushReplacement(
//         context, MaterialPageRoute(builder: (context) => LoginScreen()));
//   }
// }
