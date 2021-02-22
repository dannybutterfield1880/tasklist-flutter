import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tasklist/components/layout/headers/header.dart';
import 'package:tasklist/models/app_bar_settings.dart';

class StaticHeader extends Header with PreferredSizeWidget {
    @override
    final Size preferredSize;

    List<String> config = [];

    final String title;

    AppBarSettings appBarSettings;

    StaticHeader(
        this.title,
        { Key key,}) : preferredSize = Size.fromHeight(50.0),
            super(key: key);

    @override
    Widget build(BuildContext context) {
        return AppBar(
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () {
              ExtendedNavigator.of(context).push('/');
            },
          ),
          title: Text(
              title,
              style: TextStyle(color: Colors.white),
          ),
          centerTitle: false,
          automaticallyImplyLeading: false,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.add_circle),
              tooltip: 'Add new task',
              onPressed: () { /* GlobalUiActions.showMyDialog(context); */ },
            ),
          ]
        );
    }
}