import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:tasklist/constants/api_path.dart';
import 'package:tasklist/models/entities/task_lists.dart';
import 'package:tasklist/streams/base_data_stream.dart';
import 'package:tasklist/utils/helpers/observable.dart';

class DashboardDataStream extends BaseDataStream {
  Observable<String> loginState = Observable();

  dynamic getTaskListsData() async {
    return await callApi(() async {
      var options = Options(
        headers: {HttpHeaders.authorizationHeader: "Bearer $API_KEY"}
      );

      //response.data json is returned from apiService.get(url, options);
      return await apiService.get('/user/tasklists', options);

    }, apiError, reqCode: 240);
  }

  @override
  void loadData(arg, {param}) async {
    var data = await this.getTaskListsData();
    print(data);
    TaskLists taskLists = TaskLists.fromJson(data);
    dataStream.setValue(jsonEncode(taskLists));
  }

}