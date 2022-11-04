// import 'dart:io';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:elephant_detecting/Screens/theme_helper.dart';
// import 'package:elephant_detecting/Screens/user_model.dart';
// import 'package:elephant_detecting/main_dashboard.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'forgot_password.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
//
// class LoginSignUpScreen extends StatefulWidget {
//   const LoginSignUpScreen({Key? key}) : super(key: key);
//
//   @override
//   _LoginSignUpScreenState createState() => _LoginSignUpScreenState();
// }
//
// class _LoginSignUpScreenState extends State<LoginSignUpScreen> {
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
//       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainDashBoard()));
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
//
//   bool _isObscure = true;
//   bool _isObscure2 = true;
//   bool _isObscure3 = true;
//
//   File? file;
//   var options = [
//     'Driver',
//     'Admin',
//   ];
//   var _currentItemSelected = "Driver";
//   var rool = "Driver";
//
//
//   bool isSignUpScreen = true;
//   bool isRememberMe = false;
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
//                       image: AssetImage("assets/login.png"
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
//                         isSignUpScreen ? "SignUp to Continue" : "SignIn to Continue",
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
//               top: isSignUpScreen ? 230 :260,
//               child: AnimatedContainer(
//                 duration: Duration(milliseconds: 700),
//                 curve: Curves.bounceInOut,
//                 height: isSignUpScreen ? 430:300,
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
//                 child: SingleChildScrollView(
//                   child: Column(children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         GestureDetector(
//                           onTap: (){
//                             setState(() {
//                               isSignUpScreen =false;
//                             });
//                           },
//                           child: Column(
//                             children: [
//                               Text("LOGIN",style: TextStyle(
//                                   fontSize: 16, fontWeight: FontWeight.bold,
//                                   color: !isSignUpScreen? ThemeHelper.activeColor:ThemeHelper.textColor
//                               ),),
//                               if(isSignUpScreen)
//                                 Container(
//                                   margin: EdgeInsets.only(top: 3),
//                                   height: 2,
//                                   width: 55,
//                                   color: Colors.teal,
//                                 )
//                             ],),
//                         ),
//                         GestureDetector(
//                           onTap: (){
//                             setState(() {
//                               isSignUpScreen =true;
//                             });
//                           },
//                           child: Column(
//                             children: [
//                               Text("SIGNUP",style: TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold,
//                                   color: isSignUpScreen? ThemeHelper.activeColor:ThemeHelper.textColor),
//                               ),
//                               if(isSignUpScreen)
//                                 Container(
//                                   margin: EdgeInsets.only(top: 3),
//                                   height: 2,
//                                   width: 55,
//                                   color: Colors.teal,
//                                 )
//                             ],),
//                         ),
//                       ],
//                     ),
//                     if (isSignUpScreen) buildSignUpSection(),
//                     if (!isSignUpScreen) buildSignInSection(),
//
//                   ],
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
//       top:isSignUpScreen ?610:510,
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
//                     if(_formKey.currentState!.validate()){
//                       setState(() {
//                         showProgress =true;
//                       });
//                       isSignUpScreen ? signUp(emailController.text, passwordController.text, rool):signIn(emailController.text, passwordController.text);
//                     }
//                     },
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
//
//     );
//   }
//
//   Container buildSignUpSection(){
//     return Container(
//       margin: EdgeInsets.only(top: 20),
//       child: Column(
//         children: [
//           Container(
//             padding: const EdgeInsets.only(bottom: 8.0),
//             child: TextFormField(
//               controller: emailController,
//               autofocus: false,
//               decoration: InputDecoration(
//                 prefixIcon: Icon(
//                   Icons.email,
//                   color:Colors.grey,
//                 ),
//                 labelStyle: TextStyle(fontSize: 20.0),
//                 enabledBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.grey),
//                   borderRadius: BorderRadius.all(Radius.circular(35.0)),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.grey),
//                   borderRadius: BorderRadius.all(Radius.circular(35.0)),
//                 ),
//                 contentPadding: EdgeInsets.all(10),
//                 hintText: "Train Email",
//                 filled: true,
//                 fillColor: Colors.white,
//                 enabled: true,
//                 hintStyle: TextStyle(fontSize: 14,color: Colors.grey[400]),
//                 errorStyle:
//                 TextStyle(color: Colors.redAccent,
//                     fontSize: 14),
//               ),
//               validator: (value) {
//                 if (value!.length == 0) {
//                   return "Email cannot be empty";
//                 }
//                 if (!RegExp(
//                     "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
//                     .hasMatch(value)) {
//                   return ("Please enter a valid email");
//                 } else {
//                   return null;
//                 }
//               },
//               onChanged: (value) {},
//               keyboardType: TextInputType.emailAddress,
//             ),
//           ),
//           Container(
//             padding: const EdgeInsets.only(bottom: 8.0),
//             child: TextFormField(
//               autofocus: false,
//               obscureText: _isObscure,
//               controller: passwordController,
//               decoration: InputDecoration(
//                 prefixIcon: Icon(
//                   Icons.password,
//                   color:Colors.grey,
//                 ),
//                 labelStyle: TextStyle(fontSize: 20.0),
//                 enabledBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.grey),
//                   borderRadius: BorderRadius.all(Radius.circular(35.0)),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.grey),
//                   borderRadius: BorderRadius.all(Radius.circular(35.0)),
//                 ),
//                 contentPadding: EdgeInsets.all(10),
//                suffixIcon: IconButton(
//                  icon: Icon(_isObscure
//                  ? Icons.visibility_off
//                      :Icons.visibility),
//                  onPressed: (){
//                    setState(() {
//                      _isObscure=!_isObscure;
//                    });
//                  },
//                ),
//                 filled: true,
//                 fillColor: Colors.white,
//                 hintText: "Train Password",
//                 enabled: true,
//                 hintStyle: TextStyle(fontSize: 14,color: Colors.grey[400]),
//                 errorStyle:
//                 TextStyle(color: Colors.redAccent,
//                     fontSize: 14),
//               ),
//               validator: (value){
//                 RegExp regex = new RegExp(r'^.{6,}$');
//                 if (value!.isEmpty) {
//                   return "Password cannot be empty";
//                 }
//                 if (!regex.hasMatch(value)) {
//                   return ("please enter valid password min. 6 character");
//                 } else {
//                   return null;
//                 }
//               },
//               onChanged: (value) {},
//             ),
//           ),
//           Container(
//             padding: const EdgeInsets.only(bottom: 8.0),
//             child: TextFormField(
//               autofocus: false,
//               obscureText: _isObscure2,
//               controller: confirmpassController,
//               decoration: InputDecoration(
//                 prefixIcon: Icon(
//                   Icons.password,
//                   color:Colors.grey,
//                 ),
//                 labelStyle: TextStyle(fontSize: 20.0),
//                 enabledBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.grey),
//                   borderRadius: BorderRadius.all(Radius.circular(35.0)),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.grey),
//                   borderRadius: BorderRadius.all(Radius.circular(35.0)),
//                 ),
//                 contentPadding: EdgeInsets.all(10),
//                 suffixIcon: IconButton(
//                     icon: Icon(_isObscure2
//                         ? Icons.visibility_off
//                         : Icons.visibility),
//                     onPressed: () {
//                       setState(() {
//                         _isObscure2 = !_isObscure2;
//                       });
//                     }),
//                 filled: true,
//                 fillColor: Colors.white,
//                 hintText: "Confirm Train Password",
//                 enabled: true,
//                 hintStyle: TextStyle(fontSize: 14,color: Colors.grey[400]),
//                 errorStyle:
//                 TextStyle(color: Colors.redAccent,
//                     fontSize: 14),
//               ),
//               validator: (value) {
//                 if (confirmpassController.text !=
//                     passwordController.text) {
//                   return "Password did not match";
//                 } else {
//                   return null;
//                 }
//               },
//               onChanged: (value) {},
//             ),
//           ),
//           SizedBox(height: 7,),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 "Rool : ",
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   color:  Colors.grey[400],
//                 ),
//               ),
//                 DropdownButton<String>(
//                   dropdownColor: Colors.white,
//                   isDense: true,
//                   isExpanded: false,
//                   iconEnabledColor: Colors.teal,
//                   focusColor: Colors.teal,
//                   items:options.map((String dropDownStringItem) {
//                     return DropdownMenuItem<String>(
//                       value: dropDownStringItem,
//                         child: Text(
//                           dropDownStringItem,
//                           style: TextStyle(
//                             color: Colors.teal,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 20,
//                           ),
//                         ),
//                     );
//                   }).toList(),
//                   onChanged: (newValueSelected){
//                     setState(() {
//                       _currentItemSelected = newValueSelected!;
//                       rool = newValueSelected;
//                     });
//                   },
//                   value: _currentItemSelected,
//                 )
//             ],
//           ),
//           SizedBox(height: 10,),
//           Container(
//             width: 200,
//             margin: EdgeInsets.only(top: 5),
//             child: RichText(
//               textAlign: TextAlign.center,
//               text: TextSpan(
//                   text: "OR",
//                   style: TextStyle(color: Colors.grey),
//               ),
//             ),
//           ),
//           Container(
//             child:Column(
//               children: [
//                 ElevatedButton.icon(
//                     style: ElevatedButton.styleFrom(
//                       primary: Colors.grey[300],
//                       onPrimary: Colors.black,
//                       minimumSize: Size(double.infinity,40),
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(50)
//                       ),
//                     ),
//                     onPressed: (){
//                       GoogleSignInUser();
//                     },
//                     icon: FaIcon(FontAwesomeIcons.google,color: Colors.teal,),
//                     label: Text('Sign Up With Google'),
//                 ),
//               ],
//             )
//           ),
//           Container(
//             width: 200,
//             margin: EdgeInsets.only(top: 5),
//             child: RichText(
//               textAlign: TextAlign.center,
//               text: TextSpan(
//                   text: "By Pressing Submit you agree to our",
//                   style: TextStyle(color: Colors.grey),
//                   children: [
//                     TextSpan(
//                       //recognizer: ,
//                       text: "term & conditions",
//                       style: TextStyle(color: Colors.deepOrange),
//                     ),
//                   ]
//               ),
//             ),
//
//           ),
//         ],
//       ),
//     );
//
//   }
//
//   Container buildSignInSection(){
//     return Container(
//       margin: EdgeInsets.only(top: 20),
//       child: Column(
//         children: [
//           Container(
//             padding: const EdgeInsets.only(bottom: 8.0),
//             child: TextFormField(
//               autofocus: false,
//               controller: emailController,
//               decoration: InputDecoration(
//                 prefixIcon: Icon(
//                   Icons.email,
//                   color:Colors.grey,
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.grey),
//                   borderRadius: BorderRadius.all(Radius.circular(35.0)),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.grey),
//                   borderRadius: BorderRadius.all(Radius.circular(35.0)),
//                 ),
//                 contentPadding: EdgeInsets.all(8),
//                 fillColor: Colors.white,
//                 filled: true,
//                 hintText: "Train Email",
//                 enabled: true,
//                 hintStyle: TextStyle(fontSize: 14,color: Colors.grey[400]),
//                 errorStyle:
//                 TextStyle(color: Colors.redAccent,
//                     fontSize: 12),
//               ),
//               validator: (value) {
//                 if (value!.length == 0) {
//                   return "Email cannot be empty";
//                 }
//                 if (!RegExp(
//                     "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
//                     .hasMatch(value)) {
//                   return ("Please enter a valid email");
//                 } else {
//                   return null;
//                 }
//               },
//               onSaved: (value) {
//                 emailController.text = value!;
//               },
//               keyboardType: TextInputType.emailAddress,
//             ),
//           ),
//
//           Container(
//             padding: const EdgeInsets.only(bottom: 8.0),
//             child: TextFormField(
//               autofocus: false,
//               controller: passwordController,
//               obscureText: _isObscure3,
//               decoration: InputDecoration(
//                 prefixIcon: Icon(
//                   Icons.password,
//                   color:Colors.grey,
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.grey),
//                   borderRadius: BorderRadius.all(Radius.circular(35.0)),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.grey),
//                   borderRadius: BorderRadius.all(Radius.circular(35.0)),
//                 ),
//                 contentPadding: EdgeInsets.all(10),
//                 hintText: "Train Password",
//                 suffixIcon: IconButton(
//                     icon: Icon(_isObscure3
//                         ? Icons.visibility_off
//                         : Icons.visibility),
//                     onPressed: () {
//                       setState(() {
//                         _isObscure3 = !_isObscure3;
//                       });
//                     }),
//                 filled: true,
//                 fillColor: Colors.white,
//                 enabled: true,
//                 hintStyle: TextStyle(fontSize: 14,color: Colors.grey[400]),
//                 errorStyle:
//                 TextStyle(color: Colors.redAccent,
//                     fontSize: 12),
//               ),
//               validator: (value) {
//                 RegExp regex = new RegExp(r'^.{6,}$');
//                 if (value!.isEmpty) {
//                   return "Password cannot be empty";
//                 }
//                 if (!regex.hasMatch(value)) {
//                   return ("please enter valid password min. 6 character");
//                 } else {
//                   return null;
//                 }
//               },
//               onSaved: (value) {
//                 passwordController.text = value!;
//               },
//               keyboardType: TextInputType.emailAddress,
//             ),
//           ),
//           Container(
//               child:Column(
//                 children: [
//                   ElevatedButton.icon(
//                       style: ElevatedButton.styleFrom(
//                         primary: Colors.grey[300],
//                         onPrimary: Colors.black,
//                         minimumSize: Size(double.infinity,40),
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(50)
//                         ),
//                       ),
//                       onPressed: (){
//                         GoogleSignInUser();
//                       },
//                       icon: FaIcon(FontAwesomeIcons.google,color: Colors.teal,),
//                       label: Text('Sign In With Google')),
//                 ],
//               )
//           ),
//
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Row(
//                 children: [
//                   Checkbox(
//                       value: isRememberMe,
//                       activeColor: ThemeHelper.textColor,
//                       onChanged: (value){
//                         setState(() {
//                           isRememberMe = !isRememberMe;
//                         });
//                       }
//                   ),
//                   Text("Remember me",
//                     style: TextStyle(
//                         fontSize: 15, color: ThemeHelper.textColor
//                     ),)
//                 ],
//               ),
//               TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPasswordScreen()));},
//                   child: Text(
//                     "Forgot Password?",
//                     style: TextStyle(
//                         fontSize: 15, color: ThemeHelper.textColor
//                     ),
//                   )
//               )
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   void signUp(String email, String password,String rool) async{
//     CircularProgressIndicator();
//     if(_formKey.currentState!.validate()){
//       await _auth.createUserWithEmailAndPassword(email: email, password: password).
//       then((value) => {postDetailsToFirestore(email,rool)}).catchError((e){});
//     }
//   }
//   postDetailsToFirestore(String email, String rool) async {
//     FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
//     User? user = _auth.currentUser;
//     UserModel userModel = UserModel();
//     userModel.email = email;
//     userModel.uid = user!.uid;
//     userModel.wrool = rool;
//     await firebaseFirestore
//         .collection("users")
//         .doc(user.uid)
//         .set(userModel.toMap());
//
//     Navigator.pushReplacement(
//         context, MaterialPageRoute(builder: (context) => MainDashBoard()));
//   }
//   void signIn(String email, String password) async {
//     if (_formKey.currentState!.validate()) {
//       try {
//         UserCredential userCredential =
//         await FirebaseAuth.instance.signInWithEmailAndPassword(
//           email: email,
//           password: password,
//         );
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (context) =>MainDashBoard(),
//           ),
//         );
//       } on FirebaseAuthException catch (e) {
//         if (e.code == 'user-not-found') {
//           print('No user found for that email.');
//           ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(
//                   backgroundColor: Colors.teal,
//                   content:Text("No User Found for that Email",
//                     style:TextStyle(fontSize:18.0,color:Colors.black),)
//               )
//           );
//         } else if (e.code == 'wrong-password') {
//           print('Wrong password provided for that user.');
//           ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(
//                   backgroundColor: Colors.teal,
//                   content:Text("Wrong Password..Please Enter Correct Password",
//                     style:TextStyle(fontSize:18.0,color:Colors.black),)
//               )
//           );
//         }
//       }
//     }
//   }
//
// }
//
