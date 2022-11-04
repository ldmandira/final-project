import 'package:elephant_detecting/Screens/theme_helper.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  final _formKey = GlobalKey<FormState>();
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
                        Text("About App",style: TextStyle(
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
                            Text("The app is primarily focused on minimizing elephant deaths from train collisions. This app shows the locations of the dead elephants and has the ability to locate the current location of driver. Similarly, if an elephant crosses the track near the train, a warning messsage is given to the train drivers. This app helps the train driver to control the train properly in those situations.",
                            style:TextStyle(fontSize:17,fontWeight: FontWeight.bold,color: Colors.white)),
                            SizedBox(height:10),
                            Container(
                              padding: EdgeInsets.only(top: 10),
                              height: 200,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/about.png"),
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
