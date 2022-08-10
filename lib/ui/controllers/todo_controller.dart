import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
//import '../../data/mocks/mock_todo.dart';
import '../../domain/entities/todo.dart';
import '../../domain/use_case/task.dart';

class TodoController extends GetxController {
  var _todoList = <Todo>[].obs;

  final Tasks _tasks = Get.find();

  List<Todo> get todoList => _todoList.value;

  @override
  onInit() {
    super.onInit();
    getAllUsers();
  }

  Future<void> getAllUsers() async {
    logInfo("taskController -> getAllTasks");
    var list = await _tasks.getStoredTask();
    _todoList.value = list;
  }

  void addItem(item) async {
    //_todoList.add(item);
    await _tasks.addTask(item);
    await getAllUsers();
  }

  void removeItem(item) {
    _todoList.remove(item);
  }

  void setCompleted(index) {
    logInfo('setCompleted $index');
    if (_todoList[index].completed == 1) {
      _todoList[index].completed = 0;
    } else {
      _todoList[index].completed = 1;
    }
    _todoList.refresh();
  }
}
