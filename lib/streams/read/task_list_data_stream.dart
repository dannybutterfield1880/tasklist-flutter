import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:tasklist/constants/api_path.dart';
import 'package:tasklist/models/entities/task_list.dart';
import 'package:tasklist/streams/base_data_stream.dart';

class TaskListDataStream extends BaseDataStream {

  dynamic getTaskListData(int id) async {
    return await callApi(() async {
      var options = Options(
        headers: {HttpHeaders.authorizationHeader: "Bearer $API_KEY"}
      );
      var data = await apiService.get('/tasklist/load/$id', options);

      return data;
      //response.data json is returned from apiService.get(url, options);
  
    }, apiError, reqCode: 240);
  }

  //TODO find a better way to define params in the abstract methods
  @override
  void loadData(arg, {param}) async {
    var taskListId = arg;
    //print(taskListId);
    var data = await this.getTaskListData(taskListId);
    TaskList taskList = TaskList.fromJson(data);
    this.dataStream.setValue(jsonEncode(taskList));
  }

}