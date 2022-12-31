import 'package:flutter/material.dart';

class TodoListPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TodoListPageAppBar({
    super.key,
  });

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'Todo一覧',
      ),
    );
  }
}
