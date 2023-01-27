import 'package:flutter/material.dart';

import '../../models/todo_model.dart';
import '../../views/todoDetailPage/todo_detail_page_app_bar.dart';
import '../../views/todoDetailPage/todo_detail_page_body.dart';

class TodoDetailPage extends StatelessWidget {
  const TodoDetailPage({
    super.key,
    required this.todo,
  });

  final TodoModel todo;

  @override
  Widget build(BuildContext context) {
    // final args = ModalRoute.of(context)!.settings.arguments;
    // /final TodoModel todo = args.;
    
    return Scaffold(
      appBar: const TodoDetailPageAppBar(),
      body: TodoDetailPageBody(todo: todo),
      backgroundColor: Colors.white,
    );
  }
}
