import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:tasklist/models/api_error.dart';

class ApiErrorConverter implements JsonConverter<ApiError, String> {
  const ApiErrorConverter();

  @override
  ApiError fromJson(String json) {
    if (json == null) {
      return null;
    }

    var error = jsonDecode(json);
    return new ApiError(error.exception, error.code);
  }

  @override
  String toJson(ApiError apiError) {
    if (ApiError == null) {
      return null;
    }
    return jsonEncode(apiError);
  }
}