import 'package:json_annotation/json_annotation.dart';
import 'package:tasklist/models/base_model.dart';
import 'package:tasklist/utils/converters/CustomDateTimeConverter.dart';
import 'package:tasklist/utils/converters/CustomObservableConverter.dart';
import 'task_list.dart';

part 'task_lists.g.dart';

@JsonSerializable(nullable: false)
@CustomDateTimeConverter()
@CustomObservableConverter()
class TaskLists extends BaseModel {
  final List data;
  final int totalCount;

  TaskLists({ this.data, this.totalCount });
  
  @override
  List<Object> get props => [data, totalCount];

  factory TaskLists.fromJson(Map<String, dynamic> json) => _$TaskListsFromJson(json);
  
  factory TaskLists.fromArray(Map<String, dynamic> parsedJson){

    var list = parsedJson['data'] as List;

    List<TaskList> dataList = list.map((item) => TaskList.fromJson(item)).toList();

    return TaskLists(
        data: dataList,
        totalCount: parsedJson['totalCount']
    );
}

  Map<String, dynamic> toJson() => _$TaskListsToJson(this);
}