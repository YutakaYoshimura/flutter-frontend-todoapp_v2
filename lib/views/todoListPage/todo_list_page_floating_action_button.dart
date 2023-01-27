import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../models/todo_model.dart';

class TodoListPageFloatingActionButton extends StatelessWidget implements PreferredSizeWidget {
  const TodoListPageFloatingActionButton({
    super.key,
  });

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        // Get.to(
        //   ArticleDetailPage(article: article),
        //   fullscreenDialog: true,
        // );
        //Navigator.pushNamed(context, "/todo_list/todo_detail", arguments:{todo: todo});
        //context.goNamed('/todo_list/todo_detail', params: {'todo': todo});
        //context.goNamed('/todo_list/todo_detail', params: {'id' : todo});
        //Navigator.of(context).pushNamed('/fourth', arguments: {'todo': todo});
        //Sample sample = Sample(attributeA: "True",attributeB: "False",boolValue: false)
        // context.goNamed("/todo_list/todo_detail", extra: todo);
        TodoModel todo = TodoModel();
        context.go("/todo_list/todo_detail", extra: todo);
      },
      child: const Icon(Icons.add),
    );
  }
}
