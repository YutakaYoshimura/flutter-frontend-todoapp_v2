import 'package:flutter/material.dart';

import './todo_list_page_app_bar.dart';
import './todo_list_page_body.dart';
import './todo_list_page_floating_action_button.dart';

class TodoListPage extends StatelessWidget {
  const TodoListPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TodoListPageAppBar(),
      body: TodoListPageBody(),
      backgroundColor: Colors.white,
      floatingActionButton: TodoListPageFloatingActionButton(),
    );
  }
}
