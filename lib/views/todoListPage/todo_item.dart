import 'package:flutter/material.dart';
// import 'package:flutter_sample_app/views/pages/articleDetail/article_detail_page.dart';
// import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../models/todo_model.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({
    super.key,
    required this.todo,
  });

  final TodoModel todo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
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
        context.go("/todo_list/todo_detail", extra: todo);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1.0,
              color: Colors.grey.shade200,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(todo.title),
          ],
        ),
      ),
    );
  }
}
