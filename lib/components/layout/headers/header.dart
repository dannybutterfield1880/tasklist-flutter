import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tasklist/actions/ui/global_ui_actions.dart';
import 'package:tasklist/stores/theme_store.dart';
import 'package:get_it/get_it.dart';

class Header extends StatelessWidget {
  final ThemeStore themeStore = GetIt.I<ThemeStore>();

  Header({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 150.0,
      flexibleSpace: const FlexibleSpaceBar(
        title: Text('Task Lists'),
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.add_circle),
          tooltip: 'Add new entry',
          onPressed: () { GlobalUiActions.showMyDialog(context, 'new_task_list'); },
        ),
        IconButton(
          icon: Icon(Icons.supervised_user_circle_rounded),
          tooltip: 'User',
          onPressed: () {
            // handle the press
            print('opened user');
          },
        ),
        IconButton(
          icon: Icon(Icons.settings),
          tooltip: 'Settings',
          onPressed: () {
            // handle the press
            print('opened settings');
          },
        ),
        IconButton(
          icon: Icon(Icons.support_rounded),
          tooltip: 'Support',
          onPressed: () {
            // handle the press
            print('opened support');
          },
        ),
        IconButton(
          icon: Icon(Icons.wb_sunny_outlined),
          tooltip: 'Dark',
          onPressed: () {
            themeStore.toggleIsDarkMode();
          },
        ),
      ],
      // Allows the user to reveal the app bar if they begin scrolling
      // back up the list of items.
      floating: true
    );
  }
}