import 'package:task_list_flutter_app/models/task_model.dart';
import 'package:task_list_flutter_app/providers/database_provider.dart';

class TaskRepository {
  final _databaseProvider = DatabaseProvider();

  TaskRepository();

  Future<List<TaskModel>> getTasks() async {
    var response = await _databaseProvider.dio.get("/tasks");
    var resultList = response.data['results'] as List;
    return resultList.map((json) => TaskModel.fromJson(json)).toList();
  }

  Future<void> postTask(TaskModel task) async {
    try {
      await _databaseProvider.dio.post(
        '/tasks',
        data: {
          "title": task.title,
          "description": task.description ?? "",
          "done": task.done,
        },
      );
    } catch (error) {
      throw error;
    }
  }

  Future<void> patchTask(TaskModel task) async {
    try {
      await _databaseProvider.dio.put('/tasks/${task.id}', data: task.toJson());
    } catch (error) {
      throw error;
    }
  }

  Future<void> deleteTask(TaskModel task) async {
    try {
      await _databaseProvider.dio.delete('/tasks/${task.id}');
    } catch (error) {
      throw error;
    }
  }
}
