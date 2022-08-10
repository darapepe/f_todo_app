import 'package:f_todo_app_template/domain/repositories/task_repository.dart';
import 'package:f_todo_app_template/domain/use_case/task.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

import 'ui/controllers/todo_controller.dart';
import 'ui/todoapp.dart';

void main() {
  Loggy.initLoggy(
    logPrinter: const PrettyPrinter(
      showColors: true,
    ),
  );
  Get.put(TaskRepository());
  Get.put(Tasks());
  Get.put(TodoController());
  runApp(const TodoApp(
    key: Key('TodoApp'),
  ));
}
