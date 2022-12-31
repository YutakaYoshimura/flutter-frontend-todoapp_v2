import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

//import '../component/appbar.dart';


class TopPage extends ConsumerWidget {
  const TopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Todoアプリ", style: TextStyle(fontSize: 40),),
            ElevatedButton(
              onPressed: () {
                context.go('/todo_list');
              },
              child: const Text('開始', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}