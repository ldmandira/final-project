import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Screens/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
 final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder:(context,snapshot){
          if (snapshot.hasError){
            print("Something went Wrong");
          }
          if (snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }
          return  MaterialApp(
            theme: ThemeData(

              primarySwatch:Colors.teal,
            ),
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
          );
        });
  }
}



