import 'package:cached_network_image/cached_network_image.dart';
import 'package:elephant_detecting/Screens/create_account.dart';
import 'package:elephant_detecting/Screens/login_screen.dart';
import 'package:elephant_detecting/Screens/signup_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../Admin_Screens/admin_loginsignup.dart';
import '../main_dashboard.dart';
import 'login_page.dart';


class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> with TickerProviderStateMixin{

  // final google = GoogleSignIn();
  // GoogleSignInAccount? user;
  // GoogleSignInUser()async {
  //   try{
  //     final googleMethod = await google.signIn();
  //     user = googleMethod;
  //     final auth = await googleMethod!.authentication;
  //     final cred = GoogleAuthProvider.credential(
  //         accessToken: auth.idToken, idToken: auth.idToken
  //     );
  //     await FirebaseAuth.instance.signInWithCredential(cred).whenComplete(() {
  //       print(user!.email.toString());
  //       print(user!.displayName.toString());
  //       print(user!.photoUrl.toString());
  //     });
  //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainDashBoard()));
  //
  //   }catch(e){
  //     print(e);
  //   }
  //
  // }

  late AnimationController _animationController;
  late Animation<double> _animation;
  final _auth = FirebaseAuth.instance;
  List<String> images = [
    'https://www.sunnyskyz.com/uploads/2019/10/oiuks-elephant-family.jpg',
    'https://pbs.twimg.com/media/FGz7prpXoAcr6yy.jpg',
    'https://www.mediastorehouse.com/p/172/indian-asian-elephant-family-3744318.jpg',
    'https://img.freepik.com/free-photo/asian-elephant-family-with-cute-baby-walking-through-meadow_49749-38.jpg?w=2000',
  ];

  @override
  void initState() {
    super.initState();
    images.shuffle();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 20));
    _animation =
    CurvedAnimation(parent: _animationController, curve: Curves.linear)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((animationStatus) {
        if (animationStatus == AnimationStatus.completed) {
          _animationController.reset();
          _animationController.forward();
        }
      });
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
          CachedNetworkImage(
            imageUrl: images[1],
            // placeholder: (context, url) => Image.network(
            //   'https://image.flaticon.com/icons/png/128/564/564619.png',
            //   fit: BoxFit.contain,
            // ),
            errorWidget: (context, url, error) => Icon(Icons.error),
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            alignment: FractionalOffset(_animation.value, 0),
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Welcome",
                  style: TextStyle(
                    color:Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Real Time Elephant Tracking System",textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),

          // Column(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: [
          //     Row(
          //       children: [
          //         SizedBox(width: 10),
          //         Expanded(
          //           child:  MaterialButton(
          //             minWidth: double.infinity,
          //             height: 50,
          //             onPressed:() {
          //               Navigator.push(context, MaterialPageRoute(builder: (context) =>LoginScreen()));
          //             },
          //             //defining the shape
          //             color: Colors.grey[400]!.withOpacity(0.4),
          //             shape: RoundedRectangleBorder(
          //                 borderRadius: BorderRadius.circular(30)
          //             ),
          //             child: Text(
          //               "LOGIN",
          //               style: TextStyle(
          //                   color: Colors.white,
          //                   fontWeight: FontWeight.bold,
          //                   fontSize: 17
          //               ),
          //             ),),
          //         ),
          //         SizedBox(width: 10),
          //         Expanded(
          //           child: MaterialButton(
          //             minWidth: double.infinity,
          //             height: 50,
          //             onPressed:() {
          //               Navigator.push(context, MaterialPageRoute(builder: (context) =>CreateAccount()));
          //             },
          //             //defining the shape
          //             color: Colors.grey[400]!.withOpacity(0.4),
          //             shape: RoundedRectangleBorder(
          //                 borderRadius: BorderRadius.circular(30)
          //             ),
          //             child: Text(
          //               "SIGN UP",
          //               style: TextStyle(
          //                   color: Colors.white,
          //                   fontWeight: FontWeight.bold,
          //                   fontSize: 17
          //               ),
          //             ),),
          //         ),
          //         SizedBox(width: 10),
          //       ],
          //     ),
          //     SizedBox(
          //       height: 20,
          //     ),
          //     Row(
          //       children: [
          //         Expanded(
          //           child: Padding(
          //             padding: const EdgeInsets.symmetric(horizontal: 10),
          //             child: Divider(
          //               color: Colors.white,
          //               thickness: 2,
          //             ),
          //           ),
          //         ),
          //         Text(
          //           'Or continue with',
          //           style: TextStyle(color: Colors.white),
          //         ),
          //         Expanded(
          //           child: Padding(
          //             padding: const EdgeInsets.symmetric(horizontal: 10),
          //             child: Divider(
          //               color: Colors.white,
          //               thickness: 2,
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //     SizedBox(
          //       height: 30,
          //     ),
          //     Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceAround,
          //       children: [
          //         OutlineButton(
          //           onPressed: (){ GoogleSignInUser();
          //           },
          //           shape: StadiumBorder(),
          //           highlightedBorderColor: Colors.red.shade200,
          //           borderSide: BorderSide(width: 2, color: Colors.teal),
          //           child: Text('Sign Up with Google',style:TextStyle(color: Colors.white,fontSize: 16,) ,),
          //
          //         ),
          //       ],
          //     ),
          //     SizedBox(
          //       height: 40,
          //     ),
          //   ],
          // ),

          Column(
            mainAxisAlignment: MainAxisAlignment.end,

            children: [
              Row(
                children: [
                  SizedBox(width: 50),
                  Expanded(
                    child:  MaterialButton(
                      minWidth: double.infinity,
                      height: 50,
                      onPressed:() {
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>LoginScreen()));
                      },
                      //defining the shape
                      color: Colors.grey[400]!.withOpacity(0.4),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)
                      ),
                      child: Text(
                        "Get Started",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17
                        ),
                      ),),
                  ),
                  SizedBox(width: 50),
                ],
              ),

              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlineButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>AdminLoginSignUp()));
                    },
                    shape: StadiumBorder(),
                    highlightedBorderColor: Colors.white,
                    borderSide: BorderSide(width: 2, color: Colors.white),
                    child: Text('Admin Login Here',style:TextStyle(color: Colors.white,fontSize: 16,) ,),

                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ])
    );
  }
}
