import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactDetails extends StatefulWidget {
  @override
  _ContactDetailsState createState() => _ContactDetailsState();
}

class _ContactDetailsState extends State<ContactDetails> {


  final number1 = '+94 252234271';
  final number2 = '+94 273279375';
  final number3 = '+94 112434215';
  final number4 = '+94 242222271';
  final number5 = '+94 262222271';
  final number6 = '+94 252222271';
  final number7 = '+94 233232238';
  final number8 = '+94 322265271';
  final number9 = '+94 652224471';
  final number10 = '+94 212222271';
  final number11 = '+94 272222271';
  final number12 = '+94 272051006';
  final number13 = '+94 253891292';
  final number14 = '+94 372253071';
  final number15 = '0115236955';
  final number16 = '0115884655';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emergency Numbers'),
        backgroundColor:Color(0xFF03AC13).withOpacity(.20),
      ),
      body:SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.fromLTRB(20, 5, 25, 10),
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children:<Widget> [
                        Card(
                          child: Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.all(15),
                            child: Column(
                              children:<Widget> [
                                Column(
                                  children:<Widget> [
                                    ...ListTile.divideTiles(
                                      color:Colors.grey,
                                      tiles: [
                                        ListTile(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 12,vertical: 6),
                                          title: Text(" Kanthale"),
                                          subtitle: Text(number1),
                                          trailing: TextButton(
                                            style: TextButton.styleFrom(
                                                padding: EdgeInsets.symmetric(horizontal: 32,vertical: 12),
                                                shape: RoundedRectangleBorder(side: BorderSide(color: Colors.teal))
                                            ),
                                            child:Text('Call'),
                                            onPressed: ()async{
                                              launch('tel://$number1');
                                              await FlutterPhoneDirectCaller.callNumber(number1);
                                            },
                                          ),
                                        ),
                                        ListTile(
                                          title: Text(" Galoya"),
                                          subtitle: Text(number2),
                                          trailing: TextButton(
                                            style: TextButton.styleFrom(
                                                padding: EdgeInsets.symmetric(horizontal: 32,vertical: 12),
                                                shape: RoundedRectangleBorder(side: BorderSide(color: Colors.teal))
                                            ),
                                            child:Text('Call'),
                                            onPressed: ()async{
                                              launch('tel://$number2');
                                              await FlutterPhoneDirectCaller.callNumber(number2);
                                            },
                                          ),
                                        ),
                                        ListTile(
                                          title: Text(" Colombo"),
                                          subtitle: Text(number3),
                                          trailing: TextButton(
                                            style: TextButton.styleFrom(
                                                padding: EdgeInsets.symmetric(horizontal: 32,vertical: 12),
                                                shape: RoundedRectangleBorder(side: BorderSide(color: Colors.teal))
                                            ),
                                            child:Text('Call'),
                                            onPressed: ()async{
                                              launch('tel://$number3');
                                              await FlutterPhoneDirectCaller.callNumber(number3);
                                            },
                                          ),
                                        ),
                                        ListTile(
                                          title: Text(" Vavniya"),
                                          subtitle: Text(number4),
                                          trailing: TextButton(
                                            style: TextButton.styleFrom(
                                                padding: EdgeInsets.symmetric(horizontal: 32,vertical: 12),
                                                shape: RoundedRectangleBorder(side: BorderSide(color: Colors.teal))
                                            ),
                                            child:Text('Call'),
                                            onPressed: ()async{
                                              launch('tel://$number4');
                                              await FlutterPhoneDirectCaller.callNumber(number4);
                                            },
                                          ),
                                        ),
                                        ListTile(
                                          title: Text(" Trincomalee"),
                                          subtitle: Text(number5),
                                          trailing: TextButton(
                                            style: TextButton.styleFrom(
                                                padding: EdgeInsets.symmetric(horizontal: 32,vertical: 12),
                                                shape: RoundedRectangleBorder(side: BorderSide(color: Colors.teal))
                                            ),
                                            child:Text('Call'),
                                            onPressed: ()async{
                                              launch('tel://$number5');
                                              await FlutterPhoneDirectCaller.callNumber(number5);
                                            },
                                          ),
                                        ),
                                        ListTile(
                                          title: Text(" Anuradhapura"),
                                          subtitle: Text(number6),
                                          trailing: TextButton(
                                            style: TextButton.styleFrom(
                                                padding: EdgeInsets.symmetric(horizontal: 32,vertical: 12),
                                                shape: RoundedRectangleBorder(side: BorderSide(color: Colors.teal))
                                            ),
                                            child:Text('Call'),
                                            onPressed: ()async{
                                              launch('tel://$number6');
                                              await FlutterPhoneDirectCaller.callNumber(number6);
                                            },
                                          ),
                                        ),
                                        ListTile(
                                          title: Text(" Thalai Mannar"),
                                          subtitle: Text(number7),
                                          trailing: TextButton(
                                            style: TextButton.styleFrom(
                                                padding: EdgeInsets.symmetric(horizontal: 32,vertical: 12),
                                                shape: RoundedRectangleBorder(side: BorderSide(color: Colors.teal))
                                            ),
                                            child:Text('Call'),
                                            onPressed: ()async{
                                              launch('tel://$number7');
                                              await FlutterPhoneDirectCaller.callNumber(number7);
                                            },
                                          ),
                                        ),
                                        ListTile(
                                          title: Text(" Puttalam"),
                                          subtitle: Text(number8),
                                          trailing: TextButton(
                                            style: TextButton.styleFrom(
                                                padding: EdgeInsets.symmetric(horizontal: 32,vertical: 12),
                                                shape: RoundedRectangleBorder(side: BorderSide(color: Colors.teal))
                                            ),
                                            child:Text('Call'),
                                            onPressed: ()async{
                                              launch('tel://$number8');
                                              await FlutterPhoneDirectCaller.callNumber(number8);
                                            },
                                          ),
                                        ),
                                        ListTile(
                                          title: Text(" Batticaloa"),
                                          subtitle: Text(number9),
                                          trailing: TextButton(
                                            style: TextButton.styleFrom(
                                                padding: EdgeInsets.symmetric(horizontal: 32,vertical: 12),
                                                shape: RoundedRectangleBorder(side: BorderSide(color: Colors.teal))
                                            ),
                                            child:Text('Call'),
                                            onPressed: ()async{
                                              launch('tel://$number9');
                                              await FlutterPhoneDirectCaller.callNumber(number9);
                                            },
                                          ),
                                        ),
                                        ListTile(
                                          title: Text(" Jaffna"),
                                          subtitle: Text(number10),
                                          trailing: TextButton(
                                            style: TextButton.styleFrom(
                                                padding: EdgeInsets.symmetric(horizontal: 32,vertical: 12),
                                                shape: RoundedRectangleBorder(side: BorderSide(color: Colors.teal))
                                            ),
                                            child:Text('Call'),
                                            onPressed: ()async{
                                              launch('tel://$number10');
                                              await FlutterPhoneDirectCaller.callNumber(number10);
                                            },
                                          ),
                                        ),
                                        ListTile(
                                          title: Text(" Polonnaruwa"),
                                          subtitle: Text(number11),
                                          trailing: TextButton(
                                            style: TextButton.styleFrom(
                                                padding: EdgeInsets.symmetric(horizontal: 32,vertical: 12),
                                                shape: RoundedRectangleBorder(side: BorderSide(color: Colors.teal))
                                            ),
                                            child:Text('Call'),
                                            onPressed: ()async{
                                              launch('tel://$number11');
                                              await FlutterPhoneDirectCaller.callNumber(number11);
                                            },
                                          ),
                                        ),
                                        ListTile(
                                          title: Text(" Manampitiya"),
                                          subtitle: Text(number12),
                                          trailing: TextButton(
                                            style: TextButton.styleFrom(
                                                padding: EdgeInsets.symmetric(horizontal: 32,vertical: 12),
                                                shape: RoundedRectangleBorder(side: BorderSide(color: Colors.teal))
                                            ),
                                            child:Text('Call'),
                                            onPressed: ()async{
                                              launch('tel://$number12');
                                              await FlutterPhoneDirectCaller.callNumber(number12);
                                            },
                                          ),
                                        ),
                                        ListTile(
                                          title: Text(" Ambanpola"),
                                          subtitle: Text(number13),
                                          trailing: TextButton(
                                            style: TextButton.styleFrom(
                                                padding: EdgeInsets.symmetric(horizontal: 32,vertical: 12),
                                                shape: RoundedRectangleBorder(side: BorderSide(color: Colors.teal))
                                            ),
                                            child:Text('Call'),
                                            onPressed: ()async{
                                              launch('tel://$number13');
                                              await FlutterPhoneDirectCaller.callNumber(number13);
                                            },
                                          ),
                                        ),
                                        ListTile(
                                          title: Text(" Galgamuwa"),
                                          subtitle: Text(number14),
                                          trailing: TextButton(
                                            style: TextButton.styleFrom(
                                                padding: EdgeInsets.symmetric(horizontal: 32,vertical: 12),
                                                shape: RoundedRectangleBorder(side: BorderSide(color: Colors.teal))
                                            ),
                                            child:Text('Call'),
                                            onPressed: ()async{
                                              launch('tel://$number14');
                                              await FlutterPhoneDirectCaller.callNumber(number14);
                                            },
                                          ),
                                        ),
                                        ListTile(
                                          title: Text("Elephant Conservation"),
                                          subtitle: Text(number15),
                                          trailing: TextButton(
                                            style: TextButton.styleFrom(
                                                padding: EdgeInsets.symmetric(horizontal: 32,vertical: 12),
                                                shape: RoundedRectangleBorder(side: BorderSide(color: Colors.teal))
                                            ),
                                            child:Text('Call'),
                                            onPressed: ()async{
                                              launch('tel://$number15');
                                              await FlutterPhoneDirectCaller.callNumber(number15);
                                            },
                                          ),
                                        ),
                                        ListTile(
                                          title: Text("Wildlife Department"),
                                          subtitle: Text(number16),
                                          trailing: TextButton(
                                            style: TextButton.styleFrom(
                                                padding: EdgeInsets.symmetric(horizontal: 32,vertical: 12),
                                                shape: RoundedRectangleBorder(side: BorderSide(color: Colors.teal))
                                            ),
                                            child:Text('Call'),
                                            onPressed: ()async{
                                              launch('tel://$number16');
                                              await FlutterPhoneDirectCaller.callNumber(number16);
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),

            )
          ],
        ),
      ),
    );
  }

}
