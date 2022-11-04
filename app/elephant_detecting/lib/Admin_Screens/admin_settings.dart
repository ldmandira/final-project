import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../Screens/change_password.dart';
import '../Screens/forgot_password.dart';
import '../Screens/theme_helper.dart';

class AdminSettings extends StatefulWidget {
  @override
  _AdminSettingsState createState() => _AdminSettingsState();
}

class _AdminSettingsState extends State<AdminSettings> {
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

  // ShowDeleteAlert() async{
  //   Alert(
  //     context: context,
  //     type: AlertType.warning,
  //     title: "Delete Account",
  //     desc: "Are you sure you want to delete your account?",
  //     buttons: [
  //       DialogButton(
  //         child: Text(
  //           "No",
  //           style: TextStyle(color: Colors.white, fontSize: 22),
  //         ),
  //         onPressed: () => Navigator.pop(context),
  //         color: Colors.teal,
  //         width: 120,
  //       ),
  //       DialogButton(
  //         child: Text(
  //           "Yes",
  //           style: TextStyle(color: Colors.white, fontSize: 22),
  //         ),
  //         onPressed: () async{
  //           DatabaseService();
  //         },
  //         color: Colors.teal,
  //         width: 120,
  //       )
  //     ],
  //   ).show();
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
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
              height: 550,
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
                child: Column(children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Settings",style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: ThemeHelper.topicColor),
                        ),
                      ]
                  ),
                  SizedBox(height: 20,),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 8.0,bottom: 4.0),
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Advanced",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Column(
                          children: [
                            Column(
                              children:<Widget> [
                                ...ListTile.divideTiles(
                                  color:Colors.white,
                                  tiles: [
                                    ListTile(
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 12,vertical: 4),
                                      leading: Icon(Icons.password_outlined),
                                      title: Text("Change Password"),
                                      onTap:() {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => ChangePasswordPage()));
                                      },
                                    ),

                                    ListTile(
                                      leading: Icon(Icons.password),
                                      title: Text("Forgot Password"),
                                      onTap:() {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) =>ForgotPasswordScreen()));
                                      },
                                    ),
                                    // ListTile(
                                    //   leading: Icon(Icons.delete),
                                    //   title: Text("Delete Account"),
                                    //   onTap:() {
                                    //     ShowDeleteAlert();
                                    //   },
                                    // ),
                                    ListTile(
                                      leading: Icon(Icons.logout_rounded),
                                      title: Text("Log Out "),
                                      onTap:() {
                                        ShowAlert();
                                      },
                                    ),
                                  ],
                                )

                              ],
                            ),


                          ],
                        ),

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
class DatabaseService{

}