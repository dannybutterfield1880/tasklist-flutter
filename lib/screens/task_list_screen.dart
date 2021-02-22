
import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:drag_list/drag_list.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tasklist/components/layout/headers/static_header.dart';
import 'package:tasklist/components/layout/headers/task_list_header.dart';
import 'package:tasklist/models/base_model.dart';
import 'package:tasklist/models/entities/task.dart';
import 'package:tasklist/models/entities/task_list.dart';
import 'package:tasklist/streams/read/task_list_data_stream.dart';

import 'base_screen.dart';

//List<String> myItems = ['task1', 'task2', 'task3', 'task4', 'task5', 'task6'];

class MyBlueBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: new BoxConstraints(
        minHeight: 30.0,
        minWidth: 30.0,
        maxHeight: 50.0,
        maxWidth: 50.0,
      ),
      child: new DecoratedBox(
        decoration: new BoxDecoration(color: Colors.blue),
      ),
    );
  }
}

Future<TaskList> _loadTaskList(taskListJson) async {

  return TaskList.fromJson(jsonDecode(taskListJson));
}

class TaskListScreen extends BaseScreen {
  @override
  _TaskListScreenState createState() => _TaskListScreenState();
}

class _TaskListScreenState extends BaseScreenState<TaskListScreen> {
  Future<TaskList> taskList;
  String taskListJson;
  List<Task> tasks = List.empty();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {   
    super.initState();

    stream = TaskListDataStream();

    () async {
      await Future.delayed(Duration.zero);
      int id = int.parse(routeData.pathParams['id'].value);
    
      stream.loadData(id);

      stream.dataStream.observe((apiData) {
        setState(() {
          taskListJson = apiData;
        });
      });
    }();  
  }

  @override
  Widget build(BuildContext context) {
    taskList = _loadTaskList(taskListJson);
    return Scaffold(
      body: FutureBuilder<TaskList>(
        future: taskList,
        builder: (context, snapshot) {
        
          if (snapshot.hasData) {
            if (snapshot.data.tasks is List) {
              tasks = snapshot.data.tasks;
            }

            return Scaffold(
              appBar: TaskListHeader(snapshot.data.name),
              body: Container(
                /* child: ReorderableListView(
                  children: List.generate(
                    tasks.length,
                    (index) {
                      return ListViewCard(
                        tasks,
                        index,
                        ValueKey("${tasks[index].id}"),
                      );
                    },
                  ),
                  scrollDirection: Axis.vertical,
                  onReorder: (int oldIndex, int newIndex) {
                    if (newIndex > oldIndex) {
                        newIndex -= 1;
                      }
                      print(newIndex);
                      final item = tasks.removeAt(oldIndex);
                      print(item.toJson());
                      tasks.insert(newIndex, item);
                  },
                ) */
                child: DragList<Task>(
                  feedbackHandleBuilder: (_, transition) => AnimatedIcon(
                    icon: AnimatedIcons.menu_arrow,
                    progress: transition,
                  ),
                  handleBuilder: (_) => AnimatedIcon(
                    icon: AnimatedIcons.menu_arrow,
                    progress: AlwaysStoppedAnimation(0.0),
                  ),
                  items: tasks,
                  itemExtent: 72.0,
                  itemBuilder: (context, item, handle) {
                    return Container(
                      height: 72.0,
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Text(item.value.title),
                            Spacer(),
                            handle,
                          ]
                        ),
                      )
                    );
                  },
                  onItemReorder: (from, to) {
                    final Task item = tasks[from];
                    tasks.removeAt(from);
                    tasks.insert(to, item);
                    print('save the new index');
                    // handle item reorder on your own
                  },
                ),
              ),
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

class ListViewCard extends StatefulWidget {
  ListViewCard(this.listItems, this.index, this.key);

  final int index;
  final Key key;
  final List<Task> listItems;

  @override
  _ListViewCard createState() => _ListViewCard();
}

class _ListViewCard extends State<ListViewCard> {
  @override
  Widget build(BuildContext context) {

    return Card(
      margin: EdgeInsets.all(4),
      color: Colors.white,
      child: InkWell(
        splashColor: Colors.blue,
        onTap: () => Fluttertoast.showToast(
            msg: "Item ${widget.listItems[widget.index]} selected.",
            toastLength: Toast.LENGTH_SHORT),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Title ${widget.listItems[widget.index].title}',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      textAlign: TextAlign.left,
                      maxLines: 5,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Description ${widget.listItems[widget.index].description}',
                      style: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 16),
                      textAlign: TextAlign.left,
                      maxLines: 5,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: Icon(
                Icons.reorder,
                color: Colors.grey,
                size: 24.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}