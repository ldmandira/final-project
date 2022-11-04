import 'dart:io';
import 'package:elephant_detecting/Screens/driver.dart';
import 'package:elephant_detecting/Screens/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elephant_detecting/Screens/theme_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:elephant_detecting/Screens/user_model.dart';
import 'package:flutter/cupertino.dart';
import '../Authenticate/Methods.dart';
import '../main_dashboard.dart';
import 'forgot_password.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isRememberMe = false;
  bool _isObscure3 = true;
  bool isLoading = false;
  bool visible = false;
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF99EDC3).withOpacity(.55),
      body: Form(
        key: _formKey,
        child:Stack(
          children: [
            Positioned(
              top:0,
              right: 0,
              left: 0,
              child: Container(
                height: 270,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/signup.jpg"),
                      fit: BoxFit.fill
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.only(top: 160,left: 80),
                  color: Color(0xFF03AC13).withOpacity(.20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(text: TextSpan(
                        text: "Get's Started!",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.teal,
                        ),
                      ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                       "SignIn to Continue",
                        style: TextStyle(
                          letterSpacing: 1,
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),

                ),
              ),
            ),
            buildBottomHalfContainer(true),
            AnimatedPositioned(
              duration: Duration(milliseconds: 700),
              curve: Curves.bounceInOut,
              top: 260,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 700),
                curve: Curves.bounceInOut,
                height: 300,
                padding: EdgeInsets.all(20),
                width:MediaQuery.of(context).size.width-40,
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 15,
                        spreadRadius: 5,
                      )
                    ]
                ),
                child: Container(
                  margin: EdgeInsets.only(top: 2),
                  child: Column(
                    children: [
                      Text("LOGIN",style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold,
                          color: ThemeHelper.activeColor,
                      ),),
                      Container(
                        margin: EdgeInsets.only(top: 3),
                        height: 2,
                        width: 55,
                        color: Colors.teal,
                      ),
                      SizedBox(height: 20,),
                      Container(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: TextFormField(
                          autofocus: false,
                          controller: emailController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.email,
                              color:Colors.grey,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.all(Radius.circular(35.0)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.all(Radius.circular(35.0)),
                            ),
                            contentPadding: EdgeInsets.all(8),
                            fillColor: Colors.white,
                            filled: true,
                            hintText: "Train Email",
                            enabled: true,
                            hintStyle: TextStyle(fontSize: 14,color: Colors.grey[400]),
                            errorStyle:
                            TextStyle(color: Colors.redAccent,
                                fontSize: 12),
                          ),
                          validator: (value) {
                            if (value!.length == 0) {
                              return "Email cannot be empty";
                            }
                            if (!RegExp(
                                "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                .hasMatch(value)) {
                              return ("Please enter a valid email");
                            } else {
                              return null;
                            }
                          },
                          onSaved: (value) {
                            emailController.text = value!;
                          },
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),

                      Container(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: TextFormField(
                          autofocus: false,
                          controller: passwordController,
                          obscureText: _isObscure3,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.password,
                              color:Colors.grey,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.all(Radius.circular(35.0)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.all(Radius.circular(35.0)),
                            ),
                            contentPadding: EdgeInsets.all(10),
                            hintText: "Train Password",
                            suffixIcon: IconButton(
                                icon: Icon(_isObscure3
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                                onPressed: () {
                                  setState(() {
                                    _isObscure3 = !_isObscure3;
                                  });
                                }),
                            filled: true,
                            fillColor: Colors.white,
                            enabled: true,
                            hintStyle: TextStyle(fontSize: 14,color: Colors.grey[400]),
                            errorStyle:
                            TextStyle(color: Colors.redAccent,
                                fontSize: 12),
                          ),
                          validator: (value) {
                            RegExp regex = new RegExp(r'^.{6,}$');
                            if (value!.isEmpty) {
                              return "Password cannot be empty";
                            }
                            if (!regex.hasMatch(value)) {
                              return ("please enter valid password min. 6 character");
                            } else {
                              return null;
                            }
                          },
                          onSaved: (value) {
                            passwordController.text = value!;
                          },
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                  value: isRememberMe,
                                  activeColor: ThemeHelper.textColor,
                                  onChanged: (value){
                                    setState(() {
                                      isRememberMe = !isRememberMe;
                                    });
                                  }
                              ),
                              Text("Remember me",
                                style: TextStyle(
                                    fontSize: 15, color: ThemeHelper.textColor
                                ),)
                            ],
                          ),
                          TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPasswordScreen()));},
                              child: Text(
                                "Forgot Password?",
                                style: TextStyle(
                                  fontSize: 15, color: Colors.redAccent,
                                ),
                              )
                          )
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Don't have an account?",
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(width: 5,),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
                            },
                            child: Text("Click Here to SignUp",
                              style:TextStyle(
                                fontSize: 17, color: Colors.teal,
                              ) ,),
                          ),

                        ],
                      ),
                    ],
                  ),
                  ),
                ),
              ),
            buildBottomHalfContainer(false),
          ],
        ) ,
      ),
    );
  }

  Positioned buildBottomHalfContainer(bool showShadow){
    return Positioned(
      top:510,
      right: 0,
      left: 0,
      child: Center(
        child:!showShadow? Container(
          height:90,
          width: 90,
          padding:EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                if(showShadow)
                  BoxShadow(
                      color: Colors.black.withOpacity(.3),
                      spreadRadius: 1.5,
                      blurRadius: 10,
                      offset: Offset(0,1)
                  )
              ]
          ),
          child: Container(
            child:Column(
              children: [
                MaterialButton(
                  height: 60,
                  onPressed: (){
                    if(emailController.text.isNotEmpty && passwordController.text.isNotEmpty ){
                      setState(() {
                        isLoading = true;
                      });
                   signIn(emailController.text, passwordController.text).then((user) {
                     if(user!=null){
                       print("Login Sucessfull");
                       setState(() {
                         isLoading=false;
                       });
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>Driver()));
                     }else{
                       print("Login Failed");
                       setState(() {
                         isLoading=false;
                       });
                     }
                   });
                    }
                  },
                  child: Container(
                    child:Icon(
                        Icons.arrow_forward),
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.green,Colors.white],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(.3),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: Offset(0,1)
                  )
                ]
            ),
          ),

        ):Center(),
      ),

    );
  }

  Future<User?> signIn(String email, String password) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    FirebaseFirestore _firestore = FirebaseFirestore.instance;

    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      print("Login Sucessfull");
      _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .get()
          .then((value) => userCredential.user!.updateDisplayName(value['name']));

      return userCredential.user;

    } catch (e) {
      print(e);
      return null;
    }
  }
}
