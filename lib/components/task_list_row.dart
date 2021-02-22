
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tasklist/models/entities/task_list.dart';

class TaskListRow extends StatelessWidget {
  BuildContext context;
  int index;
  TaskList taskList;

  TaskListRow({ this.taskList });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage('assets/images/avatars/batman.png'),
        ),
        title: Text(taskList.name),
        subtitle: Text('These task lists are really important!'),
        onTap: () {
          ExtendedNavigator.of(context).push('/${taskList.id}');
        },
        trailing: Icon(Icons.keyboard_arrow_right),
      ),
    );
  }
}