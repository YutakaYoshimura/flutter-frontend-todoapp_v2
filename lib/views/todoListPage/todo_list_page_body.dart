import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import './todo_list.dart';

import '../../models/todo_model.dart';
import '../../viewModels/todo_list_view_model.dart';

class TodoListPageBody extends HookConsumerWidget {
  const TodoListPageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // AsyncValueの変更を監視
    final AsyncValue<List<TodoModel>> asyncValue = ref.watch(todoListViewModelProvider);
    
    return NotificationListener<ScrollEndNotification>(
      child: Scrollbar(
        child: CustomScrollView(
          restorationId: 'todos',
          slivers: <Widget>[
            CupertinoSliverRefreshControl(
              onRefresh: () async {
                ref.read(todoListViewModelProvider.notifier).refresh();
              },
            ),
            asyncValue.when(
              // データ取得完了
              data: (data) {
                return TodoList(data: data);
              },
              // エラー発生
              error: ((error, stackTrace) {
                // 取得済みのデータがあるならデータ表示
                if (asyncValue.hasValue) {
                  return TodoList(data: asyncValue.value ?? []);
                }

                return const SliverPadding(
                  padding: EdgeInsets.all(24.0),
                  sliver: SliverToBoxAdapter(
                    child: Center(
                      child: Text('エラーが発生しました'),
                    ),
                  ),
                );
              }),
              // 初回ローディング
              loading: () {
                return const SliverPadding(
                  padding: EdgeInsets.all(24.0),
                  sliver: SliverToBoxAdapter(
                    child: Center(
                      child: CupertinoActivityIndicator(),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      // onNotification: (notification) {
      //   // 一番下までスクロールしたとき
      //   if (notification.metrics.extentAfter == 0) {
      //     // 追加でローディング
      //     ref.read(todoListViewModelProvider.notifier).loadMore();

      //     return true;
      //   }

      //   return false;
      // },
    );
  }
}
