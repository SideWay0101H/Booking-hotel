import 'dart:typed_data';

class Room {
  int? id;
  String? roomNumber;
  int? occupancy;
  dynamic? thumbnail;
  int? priceAtNight;
  int? area;
  String? roomAvailable;
  String? error;
  String? createAt;
  String? updateAt;
  Roomtype? roomtype;
  // User? user;

  Room(
      {this.id,
      required this.roomNumber,
     required this.occupancy,
      this.thumbnail,
     required this.priceAtNight,
     required this.area,
    required  this.roomAvailable,
      this.error,
      this.createAt,
      this.updateAt,
     required this.roomtype});

  Room.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    roomNumber = json['room_number'];
    occupancy = json['occupancy'];
    thumbnail = json['thumbnail'];
    priceAtNight = json['price_at_night'];
    area = json['area'];
    roomAvailable = json['roomAvailable'];
    error = json['error'];
    createAt = json['create_At'];
    updateAt = json['update_At'];
    roomtype = json['roomtype'] != null
        ? Roomtype.fromJson(json['roomtype'])
        : null;
    // user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['room_number'] = roomNumber;
    data['occupancy'] = occupancy;
    data['thumbnail'] = thumbnail;
    data['price_at_night'] = priceAtNight;
    data['area'] = area;
    data['roomAvailable'] = roomAvailable;
    data['error'] = error;
    data['create_At'] = createAt;
    data['update_At'] = updateAt;
    if (roomtype != null) {
      data['roomtype'] = roomtype!.toJson();
    }
    return data;
  }

  Room.withError(String message){
  error = message;
  }
}




class Roomtype {
  int? id;
  String? typeName;
  String? description;

  Roomtype({this.id, this.typeName, this.description});

  Roomtype.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    typeName = json['type_name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type_name'] = typeName;
    data['description'] = description;
    return data;
  }
}

// class User {
//   int? id;
//   String? fullname;
//   String? email;
//   String? roles;
//   String? gender;

//   User({this.id, this.fullname, this.email, this.roles, this.gender});

//   User.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     fullname = json['fullname'];
//     email = json['email'];
//     roles = json['roles'];
//     gender = json['gender'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['fullname'] = fullname;
//     data['email'] = email;
//     data['roles'] = roles;
//     data['gender'] = gender;
//     return data;
//   }
// }