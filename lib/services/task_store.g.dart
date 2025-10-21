// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TaskStore on _TaskStore, Store {
  late final _$tasksAtom = Atom(name: '_TaskStore.tasks', context: context);

  @override
  ObservableList<TaskModel> get tasks {
    _$tasksAtom.reportRead();
    return super.tasks;
  }

  @override
  set tasks(ObservableList<TaskModel> value) {
    _$tasksAtom.reportWrite(value, super.tasks, () {
      super.tasks = value;
    });
  }

  late final _$loadTasksAsyncAction = AsyncAction(
    '_TaskStore.loadTasks',
    context: context,
  );

  @override
  Future<void> loadTasks() {
    return _$loadTasksAsyncAction.run(() => super.loadTasks());
  }

  late final _$addTaskAsyncAction = AsyncAction(
    '_TaskStore.addTask',
    context: context,
  );

  @override
  Future<void> addTask(TaskModel task) {
    return _$addTaskAsyncAction.run(() => super.addTask(task));
  }

  late final _$updateTaskAsyncAction = AsyncAction(
    '_TaskStore.updateTask',
    context: context,
  );

  @override
  Future<void> updateTask(TaskModel task) {
    return _$updateTaskAsyncAction.run(() => super.updateTask(task));
  }

  late final _$deleteTaskAsyncAction = AsyncAction(
    '_TaskStore.deleteTask',
    context: context,
  );

  @override
  Future<void> deleteTask(TaskModel task) {
    return _$deleteTaskAsyncAction.run(() => super.deleteTask(task));
  }

  @override
  String toString() {
    return '''
tasks: ${tasks}
    ''';
  }
}
