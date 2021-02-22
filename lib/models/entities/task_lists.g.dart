// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_lists.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskLists _$TaskListsFromJson(Map<String, dynamic> json) {
  return TaskLists(
    data: json['data'] as List,
    totalCount: json['totalCount'] as int,
  );
}

Map<String, dynamic> _$TaskListsToJson(TaskLists instance) => <String, dynamic>{
      'data': instance.data,
      'totalCount': instance.totalCount,
    };
