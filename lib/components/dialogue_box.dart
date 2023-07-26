// ignore_for_file: prefer_const_constructors, camel_case_types, sized_box_for_whitespace, unnecessary_import, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_ap/components/custom_button.dart';

class Dialogue_box extends StatelessWidget {
  final text_box_controller;

  VoidCallback save_tasks;
  VoidCallback cancel_tasks;

  Dialogue_box(
      {super.key,
      required this.text_box_controller,
      required this.save_tasks,
      required this.cancel_tasks});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[500],
      content: Container(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // A Text Field will be there
          children: [
            TextField(
                controller: text_box_controller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Please Add Tasks")),
            Row(
              children: [
                // Save Button
                SizedBox(
                  width: 100,
                  height: 50,
                  child: customButton(
                    button_color: Colors.green[700]!,
                    text: 'Save',
                    onPressed: save_tasks,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                SizedBox(
                  width: 100,
                  height: 50,
                  child: customButton(
                    button_color: Colors.red,
                    text: 'Cancel',
                    onPressed: cancel_tasks,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
