import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  final int id;
  final String password;
  final String username;
  final String avatar;
  final String name;
  User({
    required this.id,
    required this.password,
    required this.username,
    required this.avatar,
    required this.name,
  });

  User copyWith({
    int? id,
    String? password,
    String? username,
    String? avatar,
    String? name,
  }) {
    return User(
      id: id ?? this.id,
      password: password ?? this.password,
      username: username ?? this.username,
      avatar: avatar ?? this.avatar,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'password': password,
      'username': username,
      'avatar': avatar,
      'name': name,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      password: map['password'] as String,
      username: map['username'] as String,
      avatar: map['avatar'] as String,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(id: $id, password: $password, username: $username, avatar: $avatar, name: $name)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.password == password &&
      other.username == username &&
      other.avatar == avatar &&
      other.name == name;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      password.hashCode ^
      username.hashCode ^
      avatar.hashCode ^
      name.hashCode;
  }
}
