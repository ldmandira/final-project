import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elephant_detecting/Admin_Screens/admin_dashboard.dart';
import 'package:elephant_detecting/Screens/contacts_details.dart';
import 'package:flutter/material.dart';
import '../Screens/user_model.dart';
import 'admin_settings.dart';



class Admin extends StatefulWidget {
  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {


  int _currentIndex = 0;
  final List<Widget> _children = [
    AdminDashBoard(),
    ContactDetails(),
    AdminSettings(),


  ];
  void onTappedBar(int index){
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:_children.elementAt(_currentIndex) ,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor:Colors.white,
        selectedItemColor: Colors.teal,
        unselectedItemColor:Colors.grey,
        selectedFontSize:16,
        unselectedFontSize:15,
        showSelectedLabels:true,
        showUnselectedLabels:true,
        onTap:onTappedBar,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,),
            label: 'DashBoard',
            backgroundColor:Colors.white,
          ),
          BottomNavigationBarItem(icon: Icon(Icons.phone),
            label: 'Contacts',
            backgroundColor:Colors.white,
          ),
          BottomNavigationBarItem(icon: Icon(Icons.settings_outlined),
            label: 'Settings',
            backgroundColor:Colors.white,
          ),
        ],
      ),
    );
  }
}

