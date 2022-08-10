import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import '../../data/mocks/mock_todo.dart';
import '../../domain/entities/todo.dart';

class TodoController extends GetxController {
  var _todoList = <Todo>[].obs;

  List<Todo> get todoList => _todoList.value;

  TodoController() {
    _todoList.value = MockTodo.fetchAll();
  }

  void addItem(item) {}

  void removeItem(item) {}

  void setCompleted(index) {
    logInfo('setCompleted $index');

    _todoList.refresh();
  }
}
