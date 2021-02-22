// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskList _$TaskListFromJson(Map<String, dynamic> json) {
  return TaskList(
    id: json['id'] as int,
    name: json['name'] as String,
    createdAt:
        const CustomDateTimeConverter().fromJson(json['createdAt'] as String),
    updatedAt:
        const CustomDateTimeConverter().fromJson(json['updatedAt'] as String),
    creator: User.fromJson(json['creator'] as Map<String, dynamic>),
    tasks: (json['tasks'] as List)
        ?.map(
            (e) => e == null ? null : Task.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$TaskListToJson(TaskList instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'createdAt': const CustomDateTimeConverter().toJson(instance.createdAt),
      'updatedAt': const CustomDateTimeConverter().toJson(instance.updatedAt),
      'creator': instance.creator.toJson(),
      'tasks': instance.tasks?.map((e) => e?.toJson())?.toList(),
    };
