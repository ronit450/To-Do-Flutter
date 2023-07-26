// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_ap/components/dialogue_box.dart';
import 'package:to_do_ap/components/to_do_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();

  // List of all tasks to be done

  List all_tasks = [
    ["task1", false],
    ["task2", false],
    ["task3", false],
  ];

  void checkBox_tapped(bool? currentVal, int index) {
    setState(() {
      all_tasks[index][1] = !all_tasks[index][1];
    });
  }

  void save_tasks() {
    setState(() {
      all_tasks.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  void cancel_tasks() {
    Navigator.of(context).pop();
  }

  void del_task(int index) {
    setState(() {
      all_tasks.removeAt(index);
    });
  }

  void new_task() {
    showDialog(
        context: context,
        builder: (context) {
          return Dialogue_box(
            text_box_controller: _controller,
            save_tasks: save_tasks,
            cancel_tasks: cancel_tasks,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        backgroundColor: Colors.yellow[700],
        title: const Text('To-Do List'),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: new_task,
        child: Icon(CupertinoIcons.add_circled_solid),
        backgroundColor: Colors.yellow[700],
      ),
      body: ListView.builder(
          // children: [
          //   to_do_tile(
          //       task_name: 'Task 1',
          //       task_completed: false,
          //       onChanged: (bool? value) {}),
          // ],
          itemCount: all_tasks.length,
          itemBuilder: (context, index) {
            return to_do_tile(
                del_task: (context) => del_task(index),
                task_name: all_tasks[index][0],
                task_completed: all_tasks[index][1],
                onChanged: (value) => checkBox_tapped(value, index));
          }),
    );
  }
}
