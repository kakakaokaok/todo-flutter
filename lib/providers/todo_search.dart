// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:todo_provider/providers/providers.dart';

class TodoSearchState extends Equatable {
  final String searchTerm;

  TodoSearchState({
    required this.searchTerm,
  });

  factory TodoSearchState.initial() {
    return TodoSearchState(searchTerm: '');
  }

  @override
  List<Object?> get props => [searchTerm];

  @override
  String toString() => 'TodoSearchState(searchTerm: $searchTerm)';

  TodoSearchState copyWith({
    String? searchTerm,
  }) {
    return TodoSearchState(
      searchTerm: searchTerm ?? this.searchTerm,
    );
  }
}

class TodoSearch extends StateNotifier<TodoSearchState> {
  // TodoSearch() : super(TodoSearchState.initial());
  TodoSearch(super.state);

  void setSearchTerm(String newSearchTerm) {
    state = state.copyWith(searchTerm: newSearchTerm);
  }
}
