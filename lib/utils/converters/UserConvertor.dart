import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:tasklist/models/entities/user.dart';

class UserConverter implements JsonConverter<User, String> {
  const UserConverter();

  @override
  User fromJson(String json) {
    print('json');
    print(json);
    if (json == null) {
      return null;
    }

    var data = jsonDecode(json);

    print(data);

    return new User(
      id: data.id,
      firstName: data.firstName,
      lastName: data.lastName,
      email: data.email,
      dob: data.dob,
      gender: data.gender
    );
  }

  @override
  String toJson(User user) {
    print(user);
    if (user == null) {
      return null;
    }
    return jsonEncode(user);
  }
}