
import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:tasklist/models/entities/task_lists.dart';
import 'package:tasklist/models/entities/task_list.dart';
import 'package:tasklist/stores/theme_store.dart';
import 'package:tasklist/utils/services/api_util.dart';
import 'components/layout/headers/header.dart';
import 'utils/router.gr.dart';

// This is our global ServiceLocator
GetIt getIt = GetIt.instance;
final _themeStore = ThemeStore();

void main() async {
  //register any service dependancies here
  getIt.registerSingleton<ApiUtil>(ApiUtil(), signalsReady: true);
  getIt.registerSingleton<ThemeStore>(_themeStore, signalsReady: true);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyRouter myRouter = MyRouter();
  
  // root
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Task Lists',
      builder: ExtendedNavigator.builder<MyRouter>(
        name: 'root_router',
        router: myRouter,
        builder: (context, extendedNav) => Observer(
          builder: (_) => Theme(
            data: ThemeData(brightness: !_themeStore.isDarkMode ? Brightness.light : Brightness.dark),
            child: extendedNav,
          ),
        ),
      ),
      onGenerateRoute: myRouter,
    );
  }
}

// ignore: must_be_immutable
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  List list = List.empty();
  final bool isLoading = false;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<TaskLists> taskLists;

  bool isLoading = true;

  @override
   // This method is rerun every time setState is called
  Widget build(BuildContext context) {
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: FutureBuilder<TaskLists>(
        future: taskLists,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var tasklists = snapshot.data;
            return CustomScrollView(
              slivers: <Widget>[
                // Add the app bar to the CustomScrollView.
                Header(),
                // Next, create a SliverList
                SliverList(
                  // Use a delegate to build items as they're scrolled on screen.
                  delegate: SliverChildBuilderDelegate(
                    // The builder function returns a ListTile with a title that
                    // displays the index of the current item.
                    (context, index) => ListTile(title: Text(TaskList.fromJson(tasklists.data[index]).name)),
                    childCount: tasklists.totalCount,
                  ),
                )
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
