import 'package:auto_route/auto_route_annotations.dart';
import 'package:tasklist/screens/dashboard_screen.dart';
import 'package:tasklist/screens/task_list_screen.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    // initial route is named "/"
    MaterialRoute(page: Dashboard, initial: true),
    MaterialRoute(page: TaskListScreen, path: '/:id'),
  ],
)  //CustomAutoRoute(..config)
class $MyRouter {}