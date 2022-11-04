
import 'package:elephant_detecting/Screens/contacts_details.dart';
import 'package:elephant_detecting/Screens/map_main.dart';
import 'package:elephant_detecting/Screens/profile.dart';
import 'package:elephant_detecting/Screens/settings.dart';
import 'package:elephant_detecting/Screens/user_current_location.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Map.dart';
import 'chat_home.dart';
import 'map_home.dart';
import 'notification.dart';

class UserDashBoardPage extends StatefulWidget {
  @override
  _UserDashBoardPageState createState() => _UserDashBoardPageState();
}

class _UserDashBoardPageState extends State<UserDashBoardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF99EDC3).withOpacity(.55),
      body: Stack(
        children:<Widget> [
          Positioned(
            top:0,
            right: 0,
            left: 0,
            child: Container(
              height: 210,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/train.jpg"),
                    fit: BoxFit.fill
                ),
              ),
              child: Container(
                color: Color(0xFF03AC13).withOpacity(.15),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 700),
            curve: Curves.bounceInOut,
            top: 205,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 700),
              curve: Curves.bounceInOut,
              height: 515,
              padding: EdgeInsets.all(20),
              width:MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 0,vertical: 0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
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
                  RichText(text:  TextSpan(
                text: "DashBoard",
                  style: TextStyle(
                    fontSize: 30,
                      color: Color(0xFF052f2b)
                  ),
                ),),
                  SizedBox(height: 50,),
                  Container(
                    child: Column(children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile()));
                            },
                            child: Column(children: [
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 25,horizontal: 20),
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        stops: [0.3,1.0],
                                        colors: [
                                          Color(0xFFB2D3C2), Colors.white,
                                        ]
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow:[
                                      BoxShadow(offset:Offset.zero,color:Colors.white,blurRadius: 20)
                                    ]
                                ),
                                child: Image.asset('assets/profile.png',width: 60,),
                              ),
                              SizedBox(height: 5,),
                              Text('Profile',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Color(0xFF052f2b),fontSize: 15,fontWeight: FontWeight.w800),)
                            ],),
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>ContactDetails()));
                            },
                            child: Column(children: [
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 25,horizontal: 20),
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        stops: [0.3,1.0],
                                        colors: [
                                          Color(0xFFB2D3C2), Colors.white,
                                        ]
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow:[
                                      BoxShadow(offset:Offset.zero,color:Colors.white,blurRadius: 20)
                                    ]
                                ),
                                child: Image.asset('assets/emergency_numbers.png',width: 60,),
                              ),
                              SizedBox(height: 5,),
                              Text('Contact\nDetails',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Color(0xFF052f2b),fontSize: 15,fontWeight: FontWeight.w800),)
                            ],),
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationPage()));
                            },
                            child: Column(children: [
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 25,horizontal: 20),
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        stops: [0.3,1.0],
                                        colors: [
                                          Color(0xFFB2D3C2), Colors.white,
                                        ]
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow:[
                                      BoxShadow(offset:Offset.zero,color:Colors.white,blurRadius: 20)
                                    ]
                                ),
                                child: Image.asset('assets/notification.png',width: 60,),
                              ),
                              SizedBox(height: 5,),
                              Text('Notifications',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Color(0xFF052f2b),fontSize: 15,fontWeight: FontWeight.w800),)
                            ],),
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: (){
                              // Navigator.push(context, MaterialPageRoute(builder: (context)=>MapPage()));
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>GetUserCurrentLocationScreen()));
                            },
                            child: Column(children: [
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 25,horizontal: 20),
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        stops: [0.3,1.0],
                                        colors: [
                                          Color(0xFFB2D3C2), Colors.white,
                                        ]
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow:[
                                      BoxShadow(offset:Offset.zero,color:Colors.white,blurRadius: 20)
                                    ]
                                ),
                                child: Image.asset('assets/google_map.png',width: 60,),
                              ),
                              SizedBox(height: 5,),
                              Text('Google\nMap',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Color(0xFF052f2b),fontSize: 15,fontWeight: FontWeight.w800),)
                            ],),
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatHome()));
                            },
                            child: Column(children: [
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 25,horizontal: 20),
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        stops: [0.3,1.0],
                                        colors: [
                                          Color(0xFFB2D3C2), Colors.white,
                                        ]
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow:[
                                      BoxShadow(offset:Offset.zero,color:Colors.white,blurRadius: 20)
                                    ]
                                ),
                                child: Image.asset('assets/chat.png',width: 60,),
                              ),
                              SizedBox(height: 5,),
                              Text('Chat',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Color(0xFF052f2b),fontSize: 15,fontWeight: FontWeight.w800),)
                            ],),
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingsPage()));
                            },
                            child: Column(children: [
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 25,horizontal: 20),
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        stops: [0.3,1.0],
                                        colors: [
                                          Color(0xFFB2D3C2), Colors.white,
                                        ]
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow:[
                                      BoxShadow(offset:Offset.zero,color:Colors.white,blurRadius: 20)
                                    ]
                                ),
                                child: Image.asset('assets/settings.png',width: 60,),
                              ),
                              SizedBox(height: 5,),
                              Text('Settings',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Color(0xFF052f2b),fontSize: 15,fontWeight: FontWeight.w800),)
                            ],),
                          ),
                        ],
                      ),
                    ],),
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
