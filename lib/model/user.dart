import 'dart:convert';

class User {
  String? name;
  String? password;
  String? uid;
  String? img;
  String? phone;
  DateTime? createDate;
  DateTime? updateDate;
  User({
    required this.name,
    required this.password,
    required this.uid,
    required this.img,
    required this.phone,
    this.createDate,
    this.updateDate,
  }) {
    createDate = createDate ?? DateTime.now();
    updateDate = createDate ?? DateTime.now();
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'password': password,
      'uid': uid,
      'img': img,
      'phone': phone,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] as String,
      password: map['password'] as String,
      uid: map['uid'] as String,
      img: map['img'] as String,
      phone: map['phone'] as String,
    );
  }

  String toJson() => json.encode(toMap());
  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(name: $name, password: $password, uid: $uid, phone: $phone)';
  }
}
