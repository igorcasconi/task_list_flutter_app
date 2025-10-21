import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:task_list_flutter_app/models/task_model.dart';
import 'package:task_list_flutter_app/services/task_store.dart';
import 'package:task_list_flutter_app/shared/widgets/add_task_modal.dart';
import 'package:task_list_flutter_app/shared/widgets/delete_task_modal.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TaskStore taskStore = TaskStore();

  var titleController = TextEditingController(text: '');

  var descriptionController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    taskStore.loadTasks();

    void handleSubmitInformation() async {
      if (titleController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('O campo Tarefa precisa ser preenchidos!')),
        );
        return;
      }

      var task = TaskModel(
        title: titleController.text,
        description: descriptionController.text.isEmpty
            ? ""
            : descriptionController.text,
      );

      await taskStore.addTask(task);

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Tarefa adicionada com sucesso!')));
    }

    handleAddButton() {
      titleController.text = '';
      descriptionController.text = '';

      AddInformationModal(
        context,
        titleController,
        descriptionController,
        handleSubmitInformation,
      ).showInformationModal();
    }

    Future<void> handleDeleteTask(TaskModel task) async {
      await taskStore.deleteTask(task);
    }

    handleDeleteButton(TaskModel task) {
      DeleteTaskModal(
        context,
        () => handleDeleteTask(task),
      ).showDeleteTaskModal();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Tarefas", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueAccent,
      ),
      body: Observer(
        builder: (context) {
          return ListView.builder(
            itemCount: taskStore.tasks.length,
            itemBuilder: (_, index) {
              var task = taskStore.tasks[index];

              return ListTile(
                title: Text(task.title!),
                subtitle: Text(task.description!),
                onLongPress: () {
                  handleDeleteButton(task);
                },
                trailing: IconButton(
                  onPressed: () async {
                    task.done = (task.done == null) ? true : (!task.done!);
                    await taskStore.updateTask(task);
                  },
                  icon: Icon(
                    task.done != null && task.done == true
                        ? Icons.check_circle
                        : Icons.radio_button_unchecked,
                    color: task.done != null && task.done == true
                        ? Colors.green
                        : Colors.grey,
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          handleAddButton();
        },
        backgroundColor: Colors.blueAccent,
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
