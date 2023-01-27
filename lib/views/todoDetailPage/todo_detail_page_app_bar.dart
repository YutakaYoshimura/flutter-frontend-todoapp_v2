import 'package:flutter/material.dart';

class TodoDetailPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TodoDetailPageAppBar({
    super.key,
  });

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'Todo詳細',
      ),
    );
  }
}
