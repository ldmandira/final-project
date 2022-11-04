import 'package:elephant_detecting/Screens/login_page.dart';
import 'package:elephant_detecting/Screens/login_screen.dart';
import 'package:elephant_detecting/Screens/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'login_signup.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  var email ="";
  final emailController = TextEditingController();

  @override
  void dispose(){
    emailController.dispose();
    super.dispose();
  }

  resetPassword() async {
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email:email);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(backgroundColor:Colors.teal,
            content: Text(
              'Password Reset Email has been sent!',
              style: TextStyle(fontSize: 18.0),
            ),
          )
      );
    }on FirebaseAuthException catch(e){
      if (e.code == 'user-not-found'){
        print('No user found for that email.');
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(backgroundColor:Colors.teal,
              content: Text(
                'No user found for that email.',
                style: TextStyle(fontSize: 18.0),
              ),
            )
        );
      }

    }
  }

  bool isSubmit =true;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: Duration(milliseconds: 200),
            top: 40,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 500),
              curve: Curves.bounceInOut,
              height: 650,
              padding: EdgeInsets.all(20),
              width:MediaQuery.of(context).size.width-40,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomLeft,
                      stops: [0.3,1.0],
                      colors: [
                        Color(0xFF6BAF92), Colors.white,
                      ]
                  ),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 15,
                      spreadRadius: 5,
                    )
                  ]
              ),
              child: SingleChildScrollView(
                child: Column(children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:<Widget> [
                        IconButton(
                          onPressed:() => Navigator.pop(context), icon:Icon(Icons.arrow_back),
                          iconSize: 30.0,
                          color: Colors.black,
                          padding: EdgeInsets.fromLTRB(1, 1, 20, 20),
                        )
                      ]
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Forgot Train Password?",style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: ThemeHelper.topicColor),
                        ),
                      ]
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 40),
                    child: Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 10.0),
                              child: TextFormField(
                                autofocus: false,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color:Colors.white,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.all(Radius.circular(35.0)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.all(Radius.circular(35.0)),
                                  ),
                                  contentPadding: EdgeInsets.all(8),
                                  hintText: "Train Email",
                                  hintStyle: TextStyle(fontSize: 14,color: Colors.white),
                                  errorStyle:
                                  TextStyle(color: Colors.redAccent,
                                      fontSize: 12),
                                ),
                                controller: emailController,
                                validator: (value){
                                  if (value == null || value.isEmpty){
                                    return ' Please Enter Email';
                                  }else if (!value.contains('@')){
                                    return 'Please Enter Valid Email';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Container(
                              width: 200,
                              margin: EdgeInsets.only(top: 5),
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                    text: "Enter train e-mail address and we'll send you a link to ",
                                    style: TextStyle(color: Colors.white),
                                    children: [
                                      TextSpan(
                                        //recognizer: ,
                                        text: "reset train password",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ]
                                ),
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.only(top: 6),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        RaisedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));},

                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(50)
                                          ),
                                          child: Text(
                                            "Cancel",
                                            style: TextStyle(
                                                fontSize: 17, color: Colors.teal
                                            ),
                                          ),
                                        ),
                                        RaisedButton(onPressed: (){

                                          if (_formKey.currentState!.validate()){
                                            setState(() {
                                              email = emailController.text;
                                            });
                                            resetPassword();
                                          }
                                        },
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(50)
                                            ),
                                            child: Text(
                                              "Send Email",
                                              style: TextStyle(
                                                  fontSize: 17, color: Colors.teal
                                              ),
                                            )
                                        )
                                      ],
                                    )
                                  ],
                                )
                            ),

                            Container(
                              padding: EdgeInsets.only(top: 10),
                              height: 250,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/forgot password.png"),
                                    fit: BoxFit.fitHeight
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),


                ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
