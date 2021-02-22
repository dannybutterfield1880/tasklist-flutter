import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class AppBarSettings {
  Widget leading;

  String title;

  bool centerTitle;
  bool automaticallyImplyLeading;

  List actions = [];

  AppBarSettings({ this.leading, this.title, this.centerTitle, this.automaticallyImplyLeading, this.actions });

  dynamic getAppBarSettings(context) {
    return {
      leading: leading,
          centerTitle: centerTitle,
          title: Text(
              title,
              style: TextStyle(color: Colors.white),
          ),
         
          automaticallyImplyLeading: true,
    };
  }


}