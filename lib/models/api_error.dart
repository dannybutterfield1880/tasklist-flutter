import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tasklist/utils/exceptions/AuthTokenException.dart';
import 'package:tasklist/utils/converters/CustomDateTimeConverter.dart';
import 'package:tasklist/utils/converters/ApiErrorConverter.dart';
import 'package:tasklist/utils/converters/CustomExceptionConverter.dart';
import 'package:tasklist/utils/converters/CustomObservableConverter.dart';

import 'base_model.dart';

part 'api_error.g.dart';

//TODO - change this to extend Exception and move from Models
@JsonSerializable(nullable: false)
@CustomExceptionConverter()
@CustomObservableConverter()
class ApiError extends BaseModel {
  final AuthTokenException exception;
  final int code;

  ApiError(this.exception, this.code);
  
  @override
  List<Object> get props => [exception, code];
  
  factory ApiError.fromJson(Map<String, dynamic> json) => _$ApiErrorFromJson(json);
  
  Map<String, dynamic> toJson() => _$ApiErrorToJson(this);
}