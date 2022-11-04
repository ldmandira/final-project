import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);


  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final name = FirebaseAuth.instance.currentUser!.displayName;
  final uid = FirebaseAuth.instance.currentUser!.uid;
  final email = FirebaseAuth.instance.currentUser!.email;
  final creationTime = FirebaseAuth.instance.currentUser!.metadata.creationTime;

  User? user = FirebaseAuth.instance.currentUser;

  verifyEmail()async{
    if(user !=null && !user!.emailVerified){
      await user!.sendEmailVerification();
      print('Verification Email has been sent');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.teal,
            content: Text(
          'Verification Email has been sent',
          style: TextStyle(fontSize: 18.0,color: Colors.black),
        ))
      );
    }
  }

  bool isInformationScreen=true;
  double _drawerIconSize =30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Train Profile'),
        backgroundColor:Color(0xFF03AC13).withOpacity(.20),
      ),
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: Duration(milliseconds: 200),
            top: 10,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 500),
              curve: Curves.bounceInOut,
              height: 600,
              padding: EdgeInsets.all(20),
              width:MediaQuery.of(context).size.width-40,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomLeft,
                      stops: [0.3,1.0],
                      colors: [
                        Color(0xFFB2D3C2), Colors.white,
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
                child: Column(
                  children: [
                  SizedBox(height: 20,),
                  Container(
                    padding: EdgeInsets.only(left: 8.0,bottom: 4.0),
                    alignment: Alignment.topCenter,
                    child: Text(
                      "Train Information",
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),

                     Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.all(15),
                      child: Column(
                        children:<Widget> [
                          Column(
                            children:[
                              Text('User ID:$uid',
                              style: TextStyle(fontSize: 15.0)),
                              SizedBox(height: 10,),
                              Container(
                                margin: EdgeInsets.only(top: 3),
                                height: 2,
                                width: 500,
                                color: Colors.teal,
                              ),
                              SizedBox(height: 10,),
                              Text('Name:$name',
                                  style: TextStyle(fontSize: 15.0)),
                              SizedBox(height: 10,),
                              Container(
                                margin: EdgeInsets.only(top: 3),
                                height: 2,
                                width: 500,
                                color: Colors.teal,
                              ),
                              SizedBox(height: 10,),

                                  Text('Email:$email',
                                    style: TextStyle(fontSize: 15.0),
                                  ),
                                  user!.emailVerified? Text('verified',style: TextStyle(fontSize:15.0,color: Colors.blueGrey),):TextButton(onPressed: ()=>{
                                    verifyEmail(),
                                  },
                                      child:Text('Verify Email')),
                              Container(
                                margin: EdgeInsets.only(top: 3),
                                height: 2,
                                width: 500,
                                color: Colors.teal,
                              ),
                              SizedBox(height: 10,),

                              Text('Created:$creationTime',style:TextStyle(fontSize: 15.0)),
                            ],
                          )
                        ],
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