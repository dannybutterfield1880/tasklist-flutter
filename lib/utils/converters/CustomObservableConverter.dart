import 'package:json_annotation/json_annotation.dart';
import 'package:tasklist/models/api_error.dart';
import 'package:tasklist/utils/helpers/observable.dart';

class CustomObservableConverter implements JsonConverter<Observable<ApiError>, String> {
  const CustomObservableConverter();

  @override
  Observable<ApiError> fromJson(String json) {
    if (json == null) {
      return null;
    }

    return new Observable();
  }

  @override
  String toJson(Observable observable) {
    if (observable == null) {
      return null;
    }
    return observable.toString();
  }
}