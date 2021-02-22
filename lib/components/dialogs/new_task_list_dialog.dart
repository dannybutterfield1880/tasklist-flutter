import 'package:flutter/material.dart';
import 'package:tasklist/actions/api/global_actions.dart';

import 'dialog.dart';

class NewTaskListDialog extends MyDialog {
  String name = 'New Task';
  
   @override
  String title = 'New Task';

  @override
  List<Widget> children = <Widget>[
    TextField(
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: 'Task List Name'
      ),
    ),
  ];

  @override 
  List<Widget> getActions(context) {
    return <Widget>[
      
      TextButton(
        child: Text('Create'),
        onPressed: () async {
          await GlobalActions.createNewTaskList(name);
          Navigator.of(context).pop();
        
        },
      ),
      TextButton(
        child: Text('Cancel'),
        onPressed: () async {
          name = '';
          Navigator.of(context).pop();
        },
      )
    ];
  }
}