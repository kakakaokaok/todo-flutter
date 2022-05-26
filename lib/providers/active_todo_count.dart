// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:state_notifier/state_notifier.dart';

import '../logger/logger.dart';
import '../models/todo_model.dart';
import 'todo_list.dart';

class ActiveTodoCountState extends Equatable {
  final int activeTodoCount;
  ActiveTodoCountState({
    required this.activeTodoCount,
  });

  factory ActiveTodoCountState.initial() {
    return ActiveTodoCountState(activeTodoCount: 0);
  }

  @override
  List<Object> get props => [activeTodoCount];

  @override
  bool get stringify => true;

  ActiveTodoCountState copyWith({
    int? activeTodoCount,
  }) {
    return ActiveTodoCountState(
      activeTodoCount: activeTodoCount ?? this.activeTodoCount,
    );
  }
}

/// 매번 새로운 instance를 만들어내는 형태
// class ActiveTodoCount {
//   final TodoList todoList;

//   ActiveTodoCount(this.todoList);
//   ActiveTodoCountState get state => ActiveTodoCountState(
//       activeTodoCount: todoList.state.todos
//           .where((Todo todo) => !todo.completed)
//           .toList()
//           .length);
// }

class ActiveTodoCount extends StateNotifier<ActiveTodoCountState>
    with LocatorMixin {
  // ActiveTodoCount() : super(ActiveTodoCountState.initial());
  ActiveTodoCount(super.state);

  @override
  void update(Locator watch) {
    final List<Todo> todos = watch<TodoListState>().todos;

    state = state.copyWith(
        activeTodoCount:
            todos.where((Todo todo) => !todo.completed).toList().length);
    super.update(watch);
  }
}
