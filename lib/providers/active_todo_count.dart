// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../logger/logger.dart';
import '../models/todo_model.dart';
import 'todo_list.dart';

class ActiveTodoCountState extends Equatable {
  final int activeTodoCount;
  ActiveTodoCountState({
    required this.activeTodoCount,
  });

  // factory ActiveTodoCountState.initial() {
  //   return ActiveTodoCountState(activeTodoCount: 0);
  // }

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

class ActiveTodoCount {
  final TodoList todoList;

  ActiveTodoCount(this.todoList);
  ActiveTodoCountState get state => ActiveTodoCountState(
      activeTodoCount: todoList.state.todos
          .where((Todo todo) => !todo.completed)
          .toList()
          .length);
}
