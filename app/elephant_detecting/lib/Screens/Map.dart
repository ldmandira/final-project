// import 'dart:async';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:location/location.dart' as loc;
// import 'package:permission_handler/permission_handler.dart';
// import 'mymap.dart';
//
// class MapPage extends StatefulWidget {
//   @override
//   _MapPageState createState() => _MapPageState();
// }
//
// class _MapPageState extends State<MapPage> {
//   Completer<GoogleMapController> _controller = Completer();
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
//   // @override
//   // void initState() {
//   //   super.initState();
//   // }
//   double zoomVal=5.0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Google Map'),
//         backgroundColor:Color(0xFF03AC13).withOpacity(.20),
//
//       ),
//       body: Stack(
//         children: <Widget>[
//           _buildGoogleMap(context),
//           _zoomminusfunction(),
//           _zoomplusfunction(),
//           _buildContainer(),
//         ],
//       ),
//     );
//   }
//
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
//
//   Widget _zoomminusfunction() {
//
//     return Align(
//       alignment: Alignment.topLeft,
//       child: IconButton(
//           icon: Icon(FontAwesomeIcons.searchMinus,color:Colors.teal),
//           onPressed: () {
//             zoomVal--;
//             _minus( zoomVal);
//           }),
//     );
//   }
//   Widget _zoomplusfunction() {
//
//     return Align(
//       alignment: Alignment.topRight,
//       child: IconButton(
//           icon: Icon(FontAwesomeIcons.searchPlus,color:Colors.teal),
//           onPressed: () {
//             zoomVal++;
//             _plus(zoomVal);
//           }),
//     );
//   }
//
//   Future<void> _minus(double zoomVal) async {
//     final GoogleMapController controller = await _controller.future;
//     controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(6.927079,79.8612), zoom: zoomVal)));
//   }
//   Future<void> _plus(double zoomVal) async {
//     final GoogleMapController controller = await _controller.future;
//     controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(6.927079,79.8612), zoom: zoomVal)));
//   }
//
//
//   Widget _buildContainer() {
//     return Align(
//       alignment: Alignment.bottomLeft,
//       child: Container(
//         margin: EdgeInsets.symmetric(vertical: 20.0),
//         height: 150.0,
//         child: ListView(
//           scrollDirection: Axis.horizontal,
//           children: <Widget>[
//             SizedBox(width: 10.0),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: _boxes(
//                   40.738380, -73.988426,"Mahawelli Region","GalOya to Kanthale","Polonnaruwa District","11/02/2010"),
//             ),
//             SizedBox(width: 10.0),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _boxes(double lat,double long,String wildlifeRegion, String trainFromTo, String District, String date) {
//     return  GestureDetector(
//       onTap: () {
//         _gotoLocation(lat,long);
//       },
//       child:Container(
//         child: new FittedBox(
//           child: Material(
//               color: Colors.white,
//               elevation: 14.0,
//               borderRadius: BorderRadius.circular(24.0),
//               shadowColor: Color(0x802196F3),
//               child:Container(
//                 alignment: Alignment.topLeft,
//                 padding: EdgeInsets.all(15),
//                 child: Column(
//                   children: <Widget>[
//                     Container(
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: myDetailsContainer1(wildlifeRegion),
//                       ),
//                     ),
//                     SizedBox(height: 10,),
//                     Container(
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: myDetailsContainer2(trainFromTo),
//                       ),
//                     ),
//                     SizedBox(height: 10,),
//                     Container(
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: myDetailsContainer3(District),
//                       ),
//                     ),
//                     SizedBox(height: 10,),
//                     Container(
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: myDetailsContainer4(date),
//                       ),
//                     ),
//                   ],
//                 ),
//                ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget myDetailsContainer1(String wildlifeRegion) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: <Widget>[
//         Padding(
//           padding: const EdgeInsets.only(left: 8.0),
//           child: Container(
//               child: Text(wildlifeRegion,
//                 style: TextStyle(
//                     color: Colors.teal,
//                     fontSize: 24.0,
//                     fontWeight: FontWeight.bold),
//               )),
//         ),
//
//       ],
//     );
//   }
//
//   Widget myDetailsContainer2(String trainFromTo ){
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: <Widget>[
//         Padding(
//           padding: const EdgeInsets.only(left: 8.0),
//           child: Container(
//               child: Text(trainFromTo,
//                 style: TextStyle(
//                     color: Colors.teal,
//                     fontSize: 24.0,
//                     fontWeight: FontWeight.bold),
//               )),
//         ),
//
//       ],
//     );
//   }
//
//   Widget myDetailsContainer3(String District ){
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: <Widget>[
//         Padding(
//           padding: const EdgeInsets.only(left: 8.0),
//           child: Container(
//               child: Text(District,
//                 style: TextStyle(
//                     color: Colors.teal,
//                     fontSize: 24.0,
//                     fontWeight: FontWeight.bold),
//               )),
//         ),
//
//       ],
//     );
//   }
//   Widget myDetailsContainer4(String date ){
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: <Widget>[
//         Padding(
//           padding: const EdgeInsets.only(left: 8.0),
//           child: Container(
//               child: Text(date,
//                 style: TextStyle(
//                     color: Colors.teal,
//                     fontSize: 24.0,
//                     fontWeight: FontWeight.bold),
//               )),
//         ),
//
//       ],
//     );
//   }
//
//   Widget _buildGoogleMap(BuildContext context) {
//     return Container(
//       height: MediaQuery.of(context).size.height,
//       width: MediaQuery.of(context).size.width,
//       child: GoogleMap(
//         mapType: MapType.normal,
//         initialCameraPosition:  CameraPosition(target: LatLng(6.927079,79.8612), zoom: 12),
//         onMapCreated: (GoogleMapController controller) {
//           _controller.complete(controller);
//         },
//         markers: {
//           newyork1Marker,newyork2Marker,newyork3Marker,gramercyMarker,bernardinMarker,blueMarker
//         },
//       ),
//     );
//   }
//
//   Future<void> _gotoLocation(double lat,double long) async {
//     final GoogleMapController controller = await _controller.future;
//     controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(lat, long), zoom: 15,tilt: 50.0,
//       bearing: 45.0,)));
//   }
// }
// Marker gramercyMarker = Marker(
//   markerId: MarkerId('gramercy'),
//   position: LatLng(40.738380, -73.988426),
//   infoWindow: InfoWindow(title: 'Gramercy Tavern'),
//   icon: BitmapDescriptor.defaultMarkerWithHue(
//     BitmapDescriptor.hueViolet,
//   ),
// );
//
// Marker bernardinMarker = Marker(
//   markerId: MarkerId('bernardin'),
//   position: LatLng(40.761421, -73.981667),
//   infoWindow: InfoWindow(title: 'Le Bernardin'),
//   icon: BitmapDescriptor.defaultMarkerWithHue(
//     BitmapDescriptor.hueViolet,
//   ),
// );
// Marker blueMarker = Marker(
//   markerId: MarkerId('bluehill'),
//   position: LatLng(40.732128, -73.999619),
//   infoWindow: InfoWindow(title: 'Blue Hill'),
//   icon: BitmapDescriptor.defaultMarkerWithHue(
//     BitmapDescriptor.hueViolet,
//   ),
// );
//
// //New York Marker
//
// Marker newyork1Marker = Marker(
//   markerId: MarkerId('newyork1'),
//   position: LatLng(40.742451, -74.005959),
//   infoWindow: InfoWindow(title: 'Los Tacos'),
//   icon: BitmapDescriptor.defaultMarkerWithHue(
//     BitmapDescriptor.hueViolet,
//   ),
// );
// Marker newyork2Marker = Marker(
//   markerId: MarkerId('newyork2'),
//   position: LatLng(40.729640, -73.983510),
//   infoWindow: InfoWindow(title: 'Tree Bistro'),
//   icon: BitmapDescriptor.defaultMarkerWithHue(
//     BitmapDescriptor.hueViolet,
//   ),
// );
// Marker newyork3Marker = Marker(
//   markerId: MarkerId('newyork3'),
//   position: LatLng(40.719109, -74.000183),
//   infoWindow: InfoWindow(title: 'Le Coucou'),
//   icon: BitmapDescriptor.defaultMarkerWithHue(
//     BitmapDescriptor.hueViolet,
//   ),
// );
//
//

