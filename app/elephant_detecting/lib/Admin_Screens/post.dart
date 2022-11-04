import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elephant_detecting/Admin_Screens/add_post.dart';
import 'package:elephant_detecting/Admin_Screens/edit_post.dart';
import 'package:flutter/material.dart';

class PostMessage extends StatefulWidget {
  @override
  _PostMessageState createState() => _PostMessageState();
}

class _PostMessageState extends State<PostMessage> {
  final Stream<QuerySnapshot> _usersStream =
  FirebaseFirestore.instance.collection('posts').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => AddPost()));
        },
        child: Icon(
          Icons.add,
        ),
      ),
      appBar: AppBar(
        title: const Text('Posts'),
        backgroundColor:Color(0xFF03AC13).withOpacity(.20),
      ),
      body: StreamBuilder(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("something is wrong");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (_, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            EditPost(docid: snapshot.data!.docs[index]),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 15,
                          right: 15,
                        ),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          title: Text(
                            snapshot.data!.docChanges[index].doc['title'],
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 2,
                            horizontal: 10,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
