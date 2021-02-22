import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDialog extends StatelessWidget {
  String title = 'Dialog';

  List<Widget> children = List.empty();

  Widget dialogBody = ListBody(children: List.empty());

  /**
   *dialogBody =  ListBody(
   * children: children,
   *   );
   */

  List<Widget> getActions(context) {
    throw new UnimplementedError('Implement in child');
  }

  @override
  Widget build(BuildContext context) {
    print(dialogBody);
    dialogBody = ListBody(children: children);
    return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: dialogBody,
          ),
          actions: getActions(context)
        );
  }
}