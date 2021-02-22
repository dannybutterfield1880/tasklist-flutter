import 'package:json_annotation/json_annotation.dart';
import 'package:tasklist/models/base_model.dart';
import 'package:tasklist/models/entities/user.dart';
import 'package:tasklist/utils/converters/CustomDateTimeConverter.dart';
import 'package:tasklist/utils/converters/CustomObservableConverter.dart';

part 'task.g.dart';

@JsonSerializable(nullable: true)
@CustomDateTimeConverter()
@CustomObservableConverter()
class Task extends BaseModel {
  final int id;
  final String title;
  final String description;
  final String priority;
  final User creator;
  final int index;
  final String status;

  Task({ this.id, this.title, this.description, this.priority, this.creator, this.index, this.status });
  
  @override
  List<Object> get props => [id, title, description, priority, creator, index, status];

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  Map<String, dynamic> toJson() => _$TaskToJson(this);
}