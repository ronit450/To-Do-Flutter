import 'package:flutter/material.dart';
import 'package:to_do_ap/components/to_do_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List of all tasks to be done

  List all_tasks = [
    ["task1", false],
    ["task2", false],
    ["task3", false],
    ["task4", false],
    ["task5", false],
    ["task6", false],
    ["task7", false],
    ["task8", false],
    ["task9", false],
    ["task10", false],
  ];

  void checkBox_tapped(bool? currentVal, int index) {
    setState(() {
      all_tasks[index][1] = !all_tasks[index][1];
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
      
      floatingActionButton: FloatingActionButton(onPressed: (){
        
      }),
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
                task_name: all_tasks[index][0],
                task_completed: all_tasks[index][1],
                onChanged: (value) => checkBox_tapped(value, index));
          }),
    );
  }
}
