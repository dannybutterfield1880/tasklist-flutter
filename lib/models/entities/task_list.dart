import 'package:json_annotation/json_annotation.dart';
import 'package:tasklist/models/entities/task.dart';
import 'package:tasklist/models/entities/user.dart';
import 'package:tasklist/utils/converters/CustomDateTimeConverter.dart';
import 'package:tasklist/utils/converters/CustomObservableConverter.dart';
import 'package:tasklist/utils/converters/UserConvertor.dart';

import '../base_model.dart';

part 'task_list.g.dart';

const List<Task> emptyList = [];

@JsonSerializable(nullable: false, explicitToJson: true)
@CustomDateTimeConverter()
@CustomObservableConverter()
//@UserConverter()
class TaskList extends BaseModel  {
  final int id;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;
  final User creator;
  
  @JsonKey(nullable: true)
  List<Task> tasks;

  TaskList({ this.id, this.name, this.createdAt, this.updatedAt, this.creator, this.tasks = emptyList });
  
  @override
  List<Object> get props => [id, name, createdAt, updatedAt, creator, tasks];
  
  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$TaskListFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory TaskList.fromJson(Map<String, dynamic> json) => _$TaskListFromJson(json);
  
  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$TaskListToJson`.
  Map<String, dynamic> toJson() => _$TaskListToJson(this);
}
