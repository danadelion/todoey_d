import 'package:flutter/material.dart';
import 'package:todoey_d/screens/done_tasks_screen.dart';
import 'package:todoey_d/widgets/tasks_list.dart';
import 'package:todoey_d/screens/add_task_screen.dart';
import 'package:todoey_d/models/task_data.dart';
import 'package:provider/provider.dart';
import 'package:todoey_d/models/task.dart';
import 'dart:collection';
import 'package:todoey_d/screens/hint_screen.dart';

class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  String taskName;

  void onPressedCallback(String taskName) {
    Navigator.pop(context);
    if (taskName == null) {
      return;
    }
    setState(() {
      UnmodifiableListView<Task> tasks =
          Provider.of<TaskData>(context, listen: false).tasks;
      tasks.add(Task(name: taskName));
    });
  }

  @override
  Widget build(BuildContext context) {
    UnmodifiableListView<Task> tasks =
        Provider.of<TaskData>(context, listen: false).tasks;
    // UnmodifiableListView<Task> finishedTasks =
    //     Provider.of<TaskData>(context, listen: false).finishedTasks;
    return Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightBlueAccent,
          child: Icon(Icons.add),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => AddTaskScreen(
                task: Task(),
              ),
            );
          },
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(
                top: 60.0,
                left: 30.0,
                right: 30.0,
                bottom: 30.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0, bottom: 25.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 30.0,
                      child: Icon(
                        Icons.list,
                        color: Colors.lightBlueAccent,
                        size: 35.0,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Todoey',
                    style: TextStyle(
                      fontSize: 55.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${Provider.of<TaskData>(context).taskCount} Tasks',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 40.0,
                      ),
                      FloatingActionButton(
                        backgroundColor: Colors.lightBlue[50],
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.done_all_outlined,
                              color: Colors.lightBlueAccent[400],
                            ),
                            Text(
                              'Done',
                              style: TextStyle(
                                fontSize: 10.0,
                                color: Colors.lightBlueAccent[400],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) => DoneTasksScreen(),
                          );
                        },
                      ),
                      FloatingActionButton(
                        backgroundColor: Colors.lightBlue[50],
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.info_outlined,
                                color: Colors.lightBlueAccent[400]),
                            Text(
                              'Hints',
                              style: TextStyle(
                                fontSize: 10.0,
                                color: Colors.lightBlueAccent[400],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) => HintScreen(),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(child: TasksList(tasks: tasks)),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
