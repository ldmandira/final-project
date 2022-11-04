import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class GetUserCurrentLocationScreen extends StatefulWidget {
  @override
  _GetUserCurrentLocationScreenState createState() => _GetUserCurrentLocationScreenState();
}

class _GetUserCurrentLocationScreenState extends State<GetUserCurrentLocationScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  static const CameraPosition _kGooglePlex = CameraPosition(target: LatLng(6.927079,79.8612),zoom: 14,);

  final List<Marker> _markers = <Marker>[
    Marker(markerId: MarkerId('1'),
      position: LatLng(8.139468, 80.870658),
      infoWindow: InfoWindow(title: 'Kawdulla N.P. 141')
    ),
    Marker(markerId: MarkerId('3'),
        position: LatLng(8.293809, 80.964172),
        infoWindow: InfoWindow(title: 'Somawathiya N.P.')
    ),
    Marker(markerId: MarkerId('4'),
        position: LatLng(8.057687, 80.769682),
        infoWindow: InfoWindow(title: 'Habarana')
    ),
    Marker(markerId: MarkerId('5'),
        position: LatLng(8.906716, 80.861846),
        infoWindow: InfoWindow(title: 'Kaluvilpothana,MeeOya')
    ),
    Marker(markerId: MarkerId('6'),
        position: LatLng(7.964170, 81.387349),
        infoWindow: InfoWindow(title: 'Punani')
    ),
    Marker(markerId: MarkerId('7'),
        position: LatLng(9.183354, 80.423656),
        infoWindow: InfoWindow(title: 'Mankulam, Panikkan')
    ),
    Marker(markerId: MarkerId('8'),
        position: LatLng(9.136561, 80.445073),
        infoWindow: InfoWindow(title: 'Mankulam')
    ),
    Marker(markerId: MarkerId('9'),
        position: LatLng(8.7514015, 80.1640569),
        infoWindow: InfoWindow(title: 'Periyanakulam')
    ),
    Marker(markerId: MarkerId('10'),
        position: LatLng(7.945144, 81.253654),
        infoWindow: InfoWindow(title: 'Manampitiya,welikanda')
    ),
    Marker(markerId: MarkerId('11'),
        position: LatLng(8.728086, 80.267187),
        infoWindow: InfoWindow(title: 'Adiyapuliyankulam')
    ),
    Marker(markerId: MarkerId('12'),
        position: LatLng(8.7512368, 80.1638866),
        infoWindow: InfoWindow(title: 'Kunchikulam')
    ),
    Marker(markerId: MarkerId('13'),
        position: LatLng(7.612078, 80.174949),
        infoWindow: InfoWindow(title: 'Udakadawala Railway')
    ),
    Marker(markerId: MarkerId('14'),
        position: LatLng(8.138156, 80.865481),
        infoWindow: InfoWindow(title: 'Kakirawa,GalOya')
    ),
    Marker(markerId: MarkerId('15'),
        position: LatLng(7.997299, 80.275205),
        infoWindow: InfoWindow(title: 'Wadugama')
    )

  ];

  loadData(){
    getUserCurrentLocation().then((value) async{
      print('my current location');
      print(value.latitude.toString() +""+value.longitude.toString());

      _markers.add(Marker(markerId: MarkerId('2'),
          position: LatLng(value.latitude,value.longitude),
          infoWindow: InfoWindow(
              title: 'My Current Location'
          )
      ));
      CameraPosition cameraPosition = CameraPosition(
          zoom: 14,
          target: LatLng(value.latitude,value.longitude));

      final GoogleMapController controller = await _controller.future;

      controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
      setState(() {

      });
    });
  }

  Future<Position> getUserCurrentLocation()async{
    await Geolocator.requestPermission().then((value){

    }).onError((error, stackTrace) {
      print("error"+error.toString());
    });
    return await Geolocator.getCurrentPosition();
  }

  @override
  void initState(){
    super.initState();
    loadData();
  }
  double zoomVal=5.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Map'),
        backgroundColor:Color(0xFF03AC13).withOpacity(.20),

      ),
      body: GoogleMap(
        initialCameraPosition: _kGooglePlex,
        markers: Set<Marker>.of(_markers),
        onMapCreated: (GoogleMapController controller){
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){

        },
        child: Icon(Icons.local_activity),
      ),

    );
  }
  // Widget _zoomminusfunction() {
  //   return Align(
  //     alignment: Alignment.topLeft,
  //     child: IconButton(
  //         icon: Icon(FontAwesomeIcons.searchMinus,color:Colors.teal),
  //         onPressed: () {
  //           zoomVal--;
  //           _minus( zoomVal);
  //         }),
  //   );
  // }
  // Widget _zoomplusfunction() {
  //
  //   return Align(
  //     alignment: Alignment.topRight,
  //     child: IconButton(
  //         icon: Icon(FontAwesomeIcons.searchPlus,color:Colors.teal),
  //         onPressed: () {
  //           zoomVal++;
  //           _plus(zoomVal);
  //         }),
  //   );
  // }
  //
  // Future<void> _minus(double zoomVal) async {
  //   final GoogleMapController controller = await _controller.future;
  //   controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(6.927079,79.8612), zoom: zoomVal)));
  // }
  // Future<void> _plus(double zoomVal) async {
  //   final GoogleMapController controller = await _controller.future;
  //   controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(6.927079,79.8612), zoom: zoomVal)));
  // }

}
