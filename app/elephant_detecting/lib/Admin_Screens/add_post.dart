import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elephant_detecting/Admin_Screens/post.dart';
import 'package:flutter/material.dart';

class AddPost extends StatefulWidget {
  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {

  TextEditingController title = TextEditingController();

  CollectionReference ref = FirebaseFirestore.instance.collection('posts');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color(0xFF03AC13).withOpacity(.20),
        actions: [
          MaterialButton(
            onPressed: () {
              ref.add({
                'title': title.text,
              }).whenComplete(() {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) =>PostMessage()));
              });
            },
            child: Text(
              "SEND",
              style: TextStyle(
                fontSize: 17, color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: Duration(milliseconds: 200),
            top: 0,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 500),
              curve: Curves.bounceInOut,
              height: 640,
              padding: EdgeInsets.all(20),
              width:MediaQuery.of(context).size.width-2,
              margin: EdgeInsets.symmetric(horizontal: 3),
              decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white,
                    )
                  ]
              ),
              child:  Container(
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(border: Border.all()),
                        child: TextField(
                          controller: title,
                          expands: true,
                          maxLines: null,
                          decoration: InputDecoration(
                            hintText: 'title',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
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
