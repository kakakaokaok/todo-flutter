// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import '../models/todo_model.dart';

class TodoFilterState extends Equatable {
  final Filter filter;

  TodoFilterState(this.filter);

  @override
  List<Object?> get props => [filter];

  @override
  String toString() => 'TodoFilterState(filter: $filter)';

  TodoFilterState copyWith({
    Filter? filter,
  }) {
    return TodoFilterState(
      filter ?? this.filter,
    );
  }
}
