import 'dart:ffi';

class User {
  String? email;
  String? fullname;
  String? password;
  String? phone;
  int? age;
  String? address;
  Bool? isDarkMode;
  String? refreshToken;
  String? avatar;
  int? id;
  String? roles;
  String? createAt;
  String? updateAt;

  User(
      {this.email,
      this.fullname,
      this.password,
      this.phone,
      this.age,
      this.address,
      this.isDarkMode,
      this.refreshToken,
      this.avatar,
      this.id,
      this.roles,
      this.createAt,
      this.updateAt});

  User.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    fullname = json['fullname'];
    password = json['password'];
    phone = json['phone'];
    age = json['age'];
    address = json['address'];
    isDarkMode = json['isDarkMode'];
    refreshToken = json['refresh_token'];
    avatar = json['avatar'];
    id = json['id'];
    roles = json['roles'];
    createAt = json['create_at'];
    updateAt = json['update_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['fullname'] = fullname;
    data['password'] = password;
    data['phone'] = phone;
    data['age'] = age;
    data['address'] = address;
    data['isDarkMode'] = isDarkMode;
    data['refresh_token'] = refreshToken;
    data['avatar'] = avatar;
    data['id'] = id;
    data['roles'] = roles;
    data['create_at'] = createAt;
    data['update_at'] = updateAt;
    return data;
  }
}