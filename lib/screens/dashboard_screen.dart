
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tasklist/components/layout/headers/header.dart';
import 'package:tasklist/components/task_list_row.dart';
import 'package:tasklist/models/entities/task_list.dart';
import 'package:tasklist/models/entities/task_lists.dart';
import 'package:tasklist/streams/read/dashboard_stream.dart';

import 'base_screen.dart';

Future<TaskLists> _loadTaskLists(taskListData) async {
  return TaskLists.fromJson(jsonDecode(taskListData));
}

class Dashboard extends BaseScreen {
  @override
  DashboardScreen createState() => DashboardScreen();
}

class DashboardScreen extends BaseScreenState<Dashboard> {
  Future<TaskLists> taskLists;
  String taskListData;

  @override
  void initState() {   
  
    stream = DashboardDataStream();
    stream.loadData(null);

    stream.dataStream.observe((apiData) {
      setState(() {
        taskListData = apiData;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    taskLists = _loadTaskLists(taskListData);
    return Scaffold(
      body: FutureBuilder<TaskLists>(
        future: taskLists,
        builder: (context, snapshot) {

          if (snapshot.hasData) {
            var tasklists = snapshot.data;

            return CustomScrollView(
              slivers: <Widget>[
                // Add the app bar to the CustomScrollView.
                Header(key: new Key('dashboard_header')),
                // Next, create a SliverList
                SliverList(
                  // Use a delegate to build items as they're scrolled on screen.
                  delegate: SliverChildBuilderDelegate(
                    // The builder function returns a ListTile with a title that
                    // displays the index of the current item.
                    (context, index) => TaskListRow(taskList: TaskList.fromJson(tasklists.data[index])),
                    childCount: tasklists.totalCount,
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          
          // By default, show a loading spinner.
          return Center(
            child: CircularProgressIndicator()
          );
        },
      ),
    );
  }

  
}