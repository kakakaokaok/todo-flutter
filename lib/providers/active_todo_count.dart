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

class ActiveTodoCount with ChangeNotifier {
  // ActiveTodoCountState _state = ActiveTodoCountState.initial();
  late ActiveTodoCountState _state;
  final int initialActiveTodoCount;
  ActiveTodoCountState get state => _state;

  ActiveTodoCount({
    required this.initialActiveTodoCount,
  }) {
    logger.d('initialActiveTodoCount: $initialActiveTodoCount');
    _state = ActiveTodoCountState(activeTodoCount: initialActiveTodoCount);
  }

  void update(TodoList todoList) {
    logger.d(todoList.state);

    /// 프록시 프로바이더를 통해 가능?
    final int newActiveTodoCount = todoList.state.todos
        .where((Todo todo) => !todo.completed)
        .toList()
        .length;

    _state = _state.copyWith(activeTodoCount: newActiveTodoCount);
    logger.d(state);
    notifyListeners();
  }
}
