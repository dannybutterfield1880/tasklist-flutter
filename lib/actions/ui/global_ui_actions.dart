import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tasklist/components/dialogs/new_task_dialog.dart';
import 'package:tasklist/components/dialogs/new_task_list_dialog.dart';

class GlobalUiActions {
  static Future<void> showMyDialog(context, dialogType) async {
    String name;
    Widget dialog;

    switch(dialogType) {
      case 'new_task_list':
        dialog = NewTaskListDialog();
        break;
      case 'new_task':
        dialog = NewTaskDialog();
        break;  
    }

    print(dialog);

    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return dialog;
      },
    );
  }
}

