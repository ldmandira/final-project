// import 'dart:async';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:location/location.dart' as loc;
// import 'package:permission_handler/permission_handler.dart';
// import 'Map.dart';
// import 'mymap.dart';
//
// class MapHome extends StatefulWidget {
//   @override
//   _MapHomeState createState() => _MapHomeState();
// }
//
// class _MapHomeState extends State<MapHome> {
//   final loc.Location location = loc.Location();
//   StreamSubscription<loc.LocationData>? _locationSubscription;
//   final name = FirebaseAuth.instance.currentUser!.displayName;
//
//   @override
//   void initState() {
//     super.initState();
//     _requestPermission();
//     location.changeSettings(interval: 300, accuracy: loc.LocationAccuracy.high);
//     location.enableBackgroundMode(enable: true);
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Map Home'),
//         backgroundColor:Color(0xFF03AC13).withOpacity(.20),
//       ),
//       // floatingActionButton: FloatingActionButton(
//       //   child: Icon(Icons.arrow_forward),
//       //   onPressed: (){
//       //     final nextIndex = controller.selectedItem +1;
//       //     controller.animateToItem(
//       //       nextIndex,
//       //       duration: Duration(seconds: 1),
//       //       curve: Curves.easeInOut,
//       //     );
//       //   },
//       // ),
//       body: Stack(
//         children: [
//           AnimatedPositioned(
//             duration: Duration(milliseconds: 200),
//             top: 10,
//             child: AnimatedContainer(
//               duration: Duration(milliseconds: 500),
//               curve: Curves.bounceInOut,
//               height: 610,
//               padding: EdgeInsets.all(20),
//               width:MediaQuery.of(context).size.width-40,
//               margin: EdgeInsets.symmetric(horizontal: 20),
//               decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                       begin: Alignment.topLeft,
//                       end: Alignment.bottomLeft,
//                       stops: [0.3,1.0],
//                       colors: [
//                         Color(0xFFB2D3C2), Colors.white,
//                       ]
//                   ),
//
//                   borderRadius: BorderRadius.circular(15),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.3),
//                       blurRadius: 15,
//                       spreadRadius: 5,
//                     )
//                   ]
//               ),
//                 child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         RaisedButton(
//                             onPressed: () {
//                               _getLocation();
//                             },
//                             child: Text('add my location',style: TextStyle(
//                                 fontSize: 17, color: Colors.teal
//                             ),),
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(50)
//                           ),),
//                         RaisedButton(
//                             onPressed: () {
//                               _listenLocation();
//                             },
//                             child: Text('enable live location',style: TextStyle(
//                                 fontSize: 17, color: Colors.teal
//                             ),),
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(50)
//                           ),),
//                         RaisedButton(
//                             onPressed: () {
//                               _stopListening();
//                             },
//                             child: Text('stop live location',style: TextStyle(
//                                 fontSize: 17, color: Colors.teal
//                             ),),
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(50)
//                           ),),
//                         RaisedButton(
//                           onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>MapPage()));},
//                           child: Text('Elephant Death Places',style: TextStyle(
//                               fontSize: 17, color: Colors.teal
//                           ),),
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(50)
//                           ),),
//                         Expanded(
//                             child: StreamBuilder(
//                               stream:
//                               FirebaseFirestore.instance.collection('location').snapshots(),
//                               builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//                                 if (!snapshot.hasData) {
//                                   return Center(child: CircularProgressIndicator());
//                                 }
//                                 return ListView.builder(
//                                     itemCount: snapshot.data?.docs.length,
//                                     itemBuilder: (context, index) {
//                                       return ListTile(
//                                         title:
//                                         Text('$name',
//                                           style: TextStyle(fontSize: 19.0),
//                                         ),
//                                         subtitle: Row(
//                                           children: [
//                                             Text(snapshot.data!.docs[index]['latitude']
//                                                 .toString()),
//                                             SizedBox(
//                                               width: 20,
//                                             ),
//                                             Text(snapshot.data!.docs[index]['longitude']
//                                                 .toString()),
//                                           ],
//                                         ),
//                                         trailing: IconButton(
//                                           icon: Icon(Icons.directions),
//                                           onPressed: () {
//                                             Navigator.of(context).push(MaterialPageRoute(
//                                                 builder: (context) =>
//                                                     MyMap(snapshot.data!.docs[index].id)));
//                                           },
//                                         ),
//                                       );
//                                     });
//                               },
//                             )),
//                       ],
//
//
//                 ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//   _getLocation() async {
//     try {
//       final loc.LocationData _locationResult = await location.getLocation();
//       await FirebaseFirestore.instance.collection('location').doc('user1').set({
//         'latitude': _locationResult.latitude,
//         'longitude': _locationResult.longitude,
//         "name": name,
//       }, SetOptions(merge: true));
//     } catch (e) {
//       print(e);
//     }
//   }
//
//   Future<void> _listenLocation() async {
//     _locationSubscription = location.onLocationChanged.handleError((onError) {
//       print(onError);
//       _locationSubscription?.cancel();
//       setState(() {
//         _locationSubscription = null;
//       });
//     }).listen((loc.LocationData currentlocation) async {
//       await FirebaseFirestore.instance.collection('location').doc('user1').set({
//         'latitude': currentlocation.latitude,
//         'longitude': currentlocation.longitude,
//         "name": name,
//       }, SetOptions(merge: true));
//     });
//   }
//
//   _stopListening() {
//     _locationSubscription?.cancel();
//     setState(() {
//       _locationSubscription = null;
//     });
//   }
//
//   _requestPermission() async {
//     var status = await Permission.location.request();
//     if (status.isGranted) {
//       print('done');
//     } else if (status.isDenied) {
//       _requestPermission();
//     } else if (status.isPermanentlyDenied) {
//       openAppSettings();
//     }
//   }
// }
