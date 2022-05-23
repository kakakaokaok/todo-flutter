// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:state_notifier/state_notifier.dart';

import '../logger/logger.dart';
import '../models/todo_model.dart';
import 'todo_filter.dart';
import 'todo_list.dart';
import 'todo_search.dart';

class FilteredTodosState extends Equatable {
  final List<Todo> filteredTodos;
  FilteredTodosState({
    required this.filteredTodos,
  });

  factory FilteredTodosState.initial() {
    return FilteredTodosState(filteredTodos: []);
  }

  @override
  List<Object> get props => [filteredTodos];

  @override
  bool get stringify => true;

  FilteredTodosState copyWith({
    List<Todo>? filteredTodos,
  }) {
    return FilteredTodosState(
      filteredTodos: filteredTodos ?? this.filteredTodos,
    );
  }
}

class FilteredTodos extends StateNotifier<FilteredTodosState>
    with LocatorMixin {
  FilteredTodos(super.state) {
    FilteredTodos(FilteredTodosState.initial());
  }
  // FilteredTodos() : super(FilteredTodosState.initial());

  // FilteredTodosState get state {
  //   List<Todo> _filteredTodos;

  //   switch (filter) {
  //     case Filter.active:
  //       _filteredTodos = todos.where((Todo todo) => !todo.completed).toList();
  //       break;
  //     case Filter.completed:
  //       _filteredTodos = todos.where((Todo todo) => todo.completed).toList();
  //       break;
  //     case Filter.all:
  //     default:
  //       _filteredTodos = todos;
  //       break;
  //   }

  //   if (searchTerm.isNotEmpty) {
  //     _filteredTodos = _filteredTodos
  //         .where((Todo todo) => todo.desc.toLowerCase().contains(searchTerm))
  //         .toList();
  //   }
  // }

  @override
  void update(Locator watch) {
    final Filter filter = watch<TodoFilterState>().filter;
    final String searchTerm = watch<TodoSearchState>().searchTerm;
    final List<Todo> todos = watch<TodoListState>().todos;

    List<Todo> _filteredTodos;

    switch (filter) {
      case Filter.active:
        _filteredTodos = todos.where((Todo todo) => !todo.completed).toList();
        break;
      case Filter.completed:
        _filteredTodos = todos.where((Todo todo) => todo.completed).toList();
        break;
      case Filter.all:
      default:
        _filteredTodos = todos;
        break;
    }

    if (searchTerm.isNotEmpty) {
      _filteredTodos = _filteredTodos
          .where((Todo todo) => todo.desc.toLowerCase().contains(searchTerm))
          .toList();
    }

    state = state.copyWith(filteredTodos: _filteredTodos);
    super.update(watch);
  }
}
