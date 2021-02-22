import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:tasklist/utils/exceptions/AuthTokenException.dart';

class CustomExceptionConverter implements JsonConverter<AuthTokenException, String> {
  const CustomExceptionConverter();

  @override
  AuthTokenException fromJson(String json) {
    if (json == null) {
      return null;
    }

    String exception = jsonDecode(json);
    return new AuthTokenException(exception);
  }

  @override
  String toJson(AuthTokenException exception) {
    if (exception == null) {
      return null;
    }
    return exception.toString();
  }
}