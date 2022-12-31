import 'package:flutter/material.dart';

import './todo_item.dart';

import '../../models/todo_model.dart';

class TodoList extends StatelessWidget {
  const TodoList({
    super.key,
    required this.data,
  });

  final List<TodoModel> data;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return TodoItem(todo: data[index]);
        },
        childCount: data.length,
      ),
    );
  }
}
