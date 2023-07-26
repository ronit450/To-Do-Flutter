// ignore_for_file: sort_child_properties_last, prefer_const_constructors, avoid_print, non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class to_do_tile extends StatelessWidget {
  final String task_name;
  final bool task_completed;
  Function(bool?)? onChanged;

  Function(BuildContext)? del_task;

  to_do_tile(
      {super.key,
      required this.task_name,
      required this.task_completed,
      required this.del_task,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
      child: Slidable(
        endActionPane: ActionPane(motion: ScrollMotion(), children: [
          SlidableAction(
            flex: 1,
            onPressed: del_task,
            icon: CupertinoIcons.delete_solid,
            backgroundColor: Colors.red,
            borderRadius: BorderRadius.circular(10),
          )
        ]),
        child: Container(
            padding: EdgeInsets.all(24),
            child: Row(
              children: [
                // for checkbox
                Checkbox(
                  value: task_completed,
                  onChanged: onChanged,
                  activeColor: Colors.black,
                ),

                // For name of ongoing task
                Text(
                  task_name,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      decoration: task_completed
                          ? TextDecoration.lineThrough
                          : TextDecoration.none),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(10),
            )),
      ),
    );
  }
}
