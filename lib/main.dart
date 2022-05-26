import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';

import 'pages/todos_page.dart';
import 'providers/providers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StateNotifierProvider<TodoFilter, TodoFilterState>(
          create: (context) => TodoFilter(TodoFilterState.initial()),
        ),
        StateNotifierProvider<TodoSearch, TodoSearchState>(
          create: (context) => TodoSearch(TodoSearchState.initial()),
        ),
        StateNotifierProvider<TodoList, TodoListState>(
          create: (context) => TodoList(TodoListState.initial()),
        ),
        StateNotifierProvider<ActiveTodoCount, ActiveTodoCountState>(
          create: (context) => ActiveTodoCount(ActiveTodoCountState.initial()),
        ),
        StateNotifierProvider<FilteredTodos, FilteredTodosState>(
          create: (context) => FilteredTodos(FilteredTodosState.initial()),
        ),
      ],
      child: MaterialApp(
        title: 'TODOS',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const TodosPage(),
      ),
    );
  }
}
