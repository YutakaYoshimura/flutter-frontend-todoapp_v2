//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../models/todo_model.dart';
//import '../../viewModels/todo_list_view_model.dart';
import '../../validators/required_validator.dart';
import '../../validators/max_length_validator.dart';

class TodoDetailPageBody extends HookConsumerWidget {
  const TodoDetailPageBody({
    super.key,
    required this.todo,
  });

  final TodoModel todo;
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // AsyncValueの変更を監視
    //final AsyncValue<List<TodoModel>> asyncValue = ref.watch(todoListViewModelProvider);
    final formKey = GlobalKey<FormState>();

    TextEditingController title = TextEditingController(text: todo.title);
    DateTime date = todo.date ?? DateTime.now();
    int category = todo.category;
    TextEditingController memo = TextEditingController(text: todo.memo);
    
    return SingleChildScrollView(
      reverse: true,
      child: Container(
        padding: const EdgeInsets.all(30),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // タイトル
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: title,
                  decoration: const InputDecoration(
                    labelText: 'タイトル',
                    labelStyle: const TextStyle(color: Colors.black26),
                    hintText: '入力してください',
                  ),
                  validator: (value) {
                    if (! RequiredValidator().variable(value)) {
                      return RequiredValidator().getMessage();
                    }
                    if (! MaxLengthValidator(50).variable(value)) {
                      return MaxLengthValidator(50).getMessage();
                    }
                    return null;
                  },
                ),
              ),
              // 日付
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Text('${date.year}/${date.month}/${date.day}',
                      style: TextStyle(fontSize: 18),
                    ),
                    IconButton(
                      icon: const Icon(Icons.date_range),
                      onPressed: () async {
                        DateTime initDate = DateTime.now();
                        final newDate = await showDatePicker(
                          context: context,
                          initialDate: initDate,
                          firstDate: DateTime(DateTime.now().year - 2),
                          lastDate: DateTime(DateTime.now().year + 2)
                        );
                        if (newDate == null) return;
                        //todoEditPageNotifier.setDate(newDate);
                      }
                    ),
                  ],
                ),
              ),
              // カテゴリー
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                child: DropdownButtonFormField(
                  decoration: const InputDecoration(labelText: 'カテゴリー'),
                  //dropdownColor: Colors.white,
                  items: const [
                    DropdownMenuItem(
                      value: 1,
                      child: Text('仕事'),
                    ),
                    DropdownMenuItem(
                      value: 2,
                      child: Text('家事'),
                    ),
                    DropdownMenuItem(
                      value: 3,
                      child: Text('遊び'),
                    ),
                  ],
                  onChanged: (int? value) {
                    category = value ?? 0;
                  },
                  value: category,
                ),
              ),
              // メモ
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: memo,
                  maxLines: 5,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    labelText: 'メモ',
                    hintText: '入力してください',
                    //icon: Icon(Icons.info),
                  ),
                  validator: (value) {
                    if (! RequiredValidator().variable(value)) {
                      return RequiredValidator().getMessage();
                    }
                    return null;
                  },
                ),
              ),
              // ボタン
              const SizedBox(height: 8),
              SizedBox(
                // 横幅いっぱいに広げる
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      // todoEditPageNotifier.setTitle(title.text);
                      // todoEditPageNotifier.setMemo(memo.text);
                      // todoEditPageNotifier.setCategory(category);
                      // todoEditPageNotifier.setDate(date);
                      // todoEditPageNotifier.edit();
                      // context.pop();
                      TodoModel todo = TodoModel(
                        id: 0,
                        title: title.text,
                        date: date,
                        category: category,
                        memo: memo.text,
                        delflg: false,
                      );
                      todoEditPageNotifier.add(todo);
                      context.pop();
                    }
                  },
                  child: const Text('リスト更新', style: TextStyle(color: Colors.white)),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    context.pop();
                  },
                  child: const Text('キャンセル'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
