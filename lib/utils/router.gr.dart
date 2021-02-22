// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../screens/dashboard_screen.dart';
import '../screens/task_list_screen.dart';

class Routes {
  static const String dashboard = '/';
  static const String _taskListScreen = '/:id';
  static String taskListScreen({@required dynamic id}) => '/$id';
  static const all = <String>{
    dashboard,
    _taskListScreen,
  };
}

class MyRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.dashboard, page: Dashboard),
    RouteDef(Routes._taskListScreen, page: TaskListScreen),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    Dashboard: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => Dashboard(),
        settings: data,
      );
    },
    TaskListScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => TaskListScreen(),
        settings: data,
      );
    },
  };
}
