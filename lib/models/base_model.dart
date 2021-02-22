
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tasklist/utils/converters/CustomObservableConverter.dart';

part 'base_model.g.dart';

@JsonSerializable(nullable: false)
@CustomObservableConverter()
class BaseModel extends Equatable {

  BaseModel();
  
  factory BaseModel.fromJson(Map<String, dynamic> json) => _$BaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$BaseModelToJson(this);

  @override
  List<Object> get props => [this];
}