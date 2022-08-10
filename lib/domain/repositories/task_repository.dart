import 'package:f_todo_app_template/domain/entities/todo.dart';
import 'package:loggy/loggy.dart';
import '../../data/mocks/task_local_datasource_sqflite.dart';
import '../../data/mocks/mock_todo.dart';

class TaskRepository {
  late TaskLocalDataSource localDataSource;

  TaskRepository() {
    logInfo("Starting UserRepository");
    localDataSource = TaskLocalDataSource();
  }

  Future<void> addTask(Todo todo) async {
    await localDataSource.addTask(todo);
  }

  Future<List<Todo>> getAllTasks() async => await localDataSource.getAllTasks();

  clearAll() async {
    await localDataSource.deleteAll();
  }

  clearOne(id) async {
    await localDataSource.deleteOne(id);
  }
}
