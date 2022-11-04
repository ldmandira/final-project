import 'package:elephant_detecting/Screens/notification.dart';
import 'package:elephant_detecting/Screens/user_current_location.dart';
import 'package:elephant_detecting/Screens/user_dashboard.dart';
import 'package:flutter/material.dart';
import 'Map.dart';
import 'chat_home.dart';
import 'package:elephant_detecting/Screens/user_model.dart';

class Driver extends StatefulWidget {
  @override
  _DriverState createState() => _DriverState();
}

class _DriverState extends State<Driver> {


  int _currentIndex = 0;
  final List<Widget> _children = [
    UserDashBoardPage(),
    NotificationPage(),
    GetUserCurrentLocationScreen(),
    ChatHome(),


  ];
  void onTappedBar(int index){
    setState(() {
      _currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:_children.elementAt(_currentIndex),

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
          BottomNavigationBarItem(icon: Icon(Icons.notifications),
            label: 'Alerts',
            backgroundColor:Colors.white,
          ),
          BottomNavigationBarItem(icon: Icon(Icons.map_outlined),
            label: 'Map',
            backgroundColor:Colors.white,
          ),
          BottomNavigationBarItem(icon: Icon(Icons.chat),
            label: 'Chat',
            backgroundColor:Colors.white,
          ),
        ],
      ),
    );
  }
}


