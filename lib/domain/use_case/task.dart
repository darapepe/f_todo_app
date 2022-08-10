import 'package:get/get.dart';
import '../entities/todo.dart';
import '../repositories/task_repository.dart';

class Tasks {
  TaskRepository repository = Get.find();

  Future<void> addTask(Todo todo) async => await repository.addTask(todo);

  Future<List<Todo>> getStoredTask() async {
    return await repository.getAllTasks().onError((error, stackTrace) {
      return Future.error('Error');
    });
  }

  clearAll() async {
    await repository.clearAll();
  }

  clearOne(id) async {
    await repository.clearOne(id);
  }
}
