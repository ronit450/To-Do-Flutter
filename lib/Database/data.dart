// ignore_for_file: camel_case_types, non_constant_identifier_names, unused_field

import 'package:hive_flutter/hive_flutter.dart';

class ToDo_Data {
  List all_tasks = [];

  //  Box references
  final _mybox = Hive.box('my_to_do_list');

  // First time ever opening this app
  void createData() {
    all_tasks = [
      ['First Task', false],
    ];
  }

  // Load Data from local storage
  void loadData() {
    all_tasks = _mybox.get('all_tasks');
  }

  // update the data in local storage
  void updateData() {
    _mybox.put('all_tasks', all_tasks);
  }
}
