// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:state_notifier/state_notifier.dart';

import '../models/todo_model.dart';

class TodoFilterState extends Equatable {
  final Filter filter;

  TodoFilterState({
    required this.filter,
  });

  factory TodoFilterState.initial() {
    return TodoFilterState(filter: Filter.all);
  }

  @override
  List<Object> get props => [filter];

  @override
  String toString() => 'TodoFilterState(filter: $filter)';

  TodoFilterState copyWith({
    Filter? filter,
  }) {
    return TodoFilterState(
      filter: filter ?? this.filter,
    );
  }
}

class TodoFilter extends StateNotifier<TodoFilterState> {
  // TodoFilterState _state = TodoFilterState.initial();

  // TodoFilter(TodoFilterState state) : super(state);

  /// is changed to TodoFilter() : super(TodoFilterState.initial());
  /// Then,
  // TodoFilter(super.state); // 안되면 아래줄로 변경
  TodoFilter() : super(TodoFilterState.initial());

  void changeFilter(Filter newFilter) {
    state = state.copyWith(filter: newFilter);
  }
}
