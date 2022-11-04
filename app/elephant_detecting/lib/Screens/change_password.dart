import 'package:elephant_detecting/Screens/login_screen.dart';
import 'package:elephant_detecting/Screens/login_signup.dart';
import 'package:elephant_detecting/Screens/settings.dart';
import 'package:elephant_detecting/Screens/theme_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'login_page.dart';


class ChangePasswordPage extends StatefulWidget {

  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  bool isHiddenPassword= true;
  final _formKey = GlobalKey<FormState>();

  var NewPassword ="";
  var ConfirmNewPassword ="";


  final NewPasswordController = TextEditingController();
  final ConfirmNewPasswordController = TextEditingController();

  @override
  void dispose(){
    NewPasswordController.dispose();
    ConfirmNewPasswordController.dispose();
    super.dispose();
  }

  final currentUser =  FirebaseAuth.instance.currentUser;
  changePassword() async {
    if(NewPassword == ConfirmNewPassword){
      try{
        await currentUser!.updatePassword(NewPassword);
        FirebaseAuth.instance.signOut();
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.teal,
              content: Text(
                'Your Password has been Changed Sucessfully. Use your new password to log in.',
                style: TextStyle(fontSize: 18.0),
              ),
            )
        );
      }catch (e){}
    }else{
      print("New Password and Confirm New Password doesn't match");
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              backgroundColor: Colors.teal,
              content:Text("New Password and Confirm New Password doesn't match",
                  style:TextStyle(fontSize: 16.0,color:Colors.black))
          )
      );
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
                        Text("Change Train Password?",style: TextStyle(
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
                                obscureText: isHiddenPassword,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.password,
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
                                  hintText: "New Password",
                                  suffixIcon: InkWell(
                                      onTap: _togglePasswordView,
                                      child: Icon(Icons.visibility)),
                                  hintStyle: TextStyle(fontSize: 14,color: Colors.white),
                                  errorStyle:
                                  TextStyle(color: Colors.redAccent,
                                      fontSize: 12),
                                ),
                                controller: NewPasswordController,
                                validator: (value){
                                  if (value == null || value.isEmpty){
                                    return 'Please Enter New Password';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 10.0),
                              child: TextFormField(
                                autofocus: false,
                                obscureText: isHiddenPassword,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.password,
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
                                  hintText: "Confirm New Password",
                                  suffixIcon: InkWell(
                                      onTap: _togglePasswordView,
                                      child: Icon(Icons.visibility)),
                                  hintStyle: TextStyle(fontSize: 14,color: Colors.white),
                                  errorStyle:
                                  TextStyle(color: Colors.redAccent,
                                      fontSize: 12),
                                ),
                                controller: ConfirmNewPasswordController,
                                validator: (value){
                                  if (value == null || value.isEmpty){
                                    return 'Please Enter Confirm New Password';
                                  }
                                  return null;
                                },
                              ),
                            ),

                            Container(
                                margin: EdgeInsets.only(top: 6),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        RaisedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> SettingsPage()));},

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
                                           setState((){
                                             NewPassword = NewPasswordController.text;
                                             ConfirmNewPassword = ConfirmNewPasswordController.text;
                                           });
                                           changePassword();
                                         }
                                        },

                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(50)
                                            ),
                                            child: Text(
                                              "Update Password",
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
                              height: 200,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/change_password.png"),
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
  void _togglePasswordView(){
    if(isHiddenPassword == true){
      isHiddenPassword = false;
    }else{
      isHiddenPassword = true;
    }
    setState(() {

    });
  }
}
