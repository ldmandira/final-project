import 'package:elephant_detecting/Admin_Screens/adding_death_places.dart';
import 'package:elephant_detecting/Admin_Screens/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../Screens/change_password.dart';
import '../Screens/chat_home.dart';
import '../Screens/contacts_details.dart';
import '../Screens/forgot_password.dart';
import 'package:elephant_detecting/Screens/user_current_location.dart';
import '../Screens/user_current_location.dart';
import 'my_drawer_header.dart';

class AdminDashBoard extends StatefulWidget {
  const AdminDashBoard({Key? key}) : super(key: key);


  @override
  _AdminDashBoardState createState() => _AdminDashBoardState();
}

class _AdminDashBoardState extends State<AdminDashBoard> {

  ShowAlert() async{
    Alert(
      context: context,
      type: AlertType.info,
      title: "LOGOUT",
      desc: "Are you sure want to Logout?",
      buttons: [
        DialogButton(
          child: Text(
            "No",
            style: TextStyle(color: Colors.white, fontSize: 22),
          ),
          onPressed: () => Navigator.pop(context),
          color: Colors.teal,
          width: 120,
        ),
        DialogButton(
          child: Text(
            "Yes",
            style: TextStyle(color: Colors.white, fontSize: 22),
          ),
          onPressed: () => SystemNavigator.pop(),
          color: Colors.teal,
          width: 120,
        )
      ],
    ).show();
  }
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
              height: 225,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/admin.png"),
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
            top: 220,
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
                  RichText(text: TextSpan(
                    text: "Admin DashBoard",
                    style: TextStyle(
                      fontSize: 30,
                        color: Color(0xFF052f2b)
                    ),
                  ),
                  ),
                  SizedBox(height: 40,),
                  Container(
                    child: Column(children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>PostMessage()));
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
                              Text('Post\nMessage',
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
                        ],
                      ),
                      SizedBox(height: 30,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: (){
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
                              Text('Death\nPlaces',
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






