import 'package:mobx/mobx.dart';
import 'package:task_list_flutter_app/models/task_model.dart';
import 'package:task_list_flutter_app/repositories/task_repository.dart';

part 'task_store.g.dart';

class TaskStore = _TaskStore with _$TaskStore;

abstract class _TaskStore with Store {
  final TaskRepository repository = TaskRepository();

  @observable
  ObservableList<TaskModel> tasks = ObservableList<TaskModel>();

  @action
  Future<void> loadTasks() async {
    final fetchedTasks = await repository.getTasks();
    tasks = ObservableList.of(fetchedTasks);
  }

  @action
  Future<void> addTask(TaskModel task) async {
    await repository.postTask(task);
    await loadTasks();
  }

  @action
  Future<void> updateTask(TaskModel task) async {
    await repository.patchTask(task);
    await loadTasks();
  }

  @action
  Future<void> deleteTask(TaskModel task) async {
    await repository.deleteTask(task);
    tasks.removeWhere((taskData) => taskData.id == task.id);
  }
}
