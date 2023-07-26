// ignore_for_file: sort_child_properties_last, prefer_const_constructors, avoid_print, non_constant_identifier_names

import 'package:flutter/material.dart';

class to_do_tile extends StatelessWidget {
  final String task_name;
  final bool task_completed;
  Function(bool?)? onChanged;

  to_do_tile({super.key, required this.task_name, required this.task_completed, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
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
                  decoration: task_completed? TextDecoration.lineThrough: TextDecoration.none
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(10),
          )),
    );
  }
}
