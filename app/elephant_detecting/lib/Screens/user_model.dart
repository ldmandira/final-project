//
// class UserModel {
//    String? email;
//    String? uid;
//    String? name;
//    String? type;
//    String? number;
//    String? railway;
//
//
// // receiving data
//   UserModel({this.uid, this.email, this.name,this.number,this.type,this.railway});
//   factory UserModel.fromMap(map) {
//     return UserModel(
//       name: map['name'],
//       uid: map['uid'],
//       email: map['email'],
//       number: map['number'],
//       type: map['type'],
//       railway: map['railway'],
//
//     );
//   }
// // sending data
//   Map<String, dynamic> toMap() {
//     return {
//       'uid': uid,
//       'name':name,
//       'email': email,
//       'type' : type,
//       'number' : number,
//       'railway' : railway,
//     };
//   }
// }