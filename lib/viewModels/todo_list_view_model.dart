import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/todo_model.dart';
import '../repositories/todo_repository.dart';

final todoListViewModelProvider = StateNotifierProvider<TodoListViewModel, AsyncValue<List<TodoModel>>>(
  (ref) => TodoListViewModel(
    TodoRepository(),
  ),
);

class TodoListViewModel extends StateNotifier<AsyncValue<List<TodoModel>>> {
  TodoListViewModel(this._todoRepository)
      // 初期状態をローディング状態にする
       : super(const AsyncLoading<List<TodoModel>>()) {
    // Providerが初めて呼ばれたときに実行
    getAll();
  }

  final TodoRepository _todoRepository;

  //int category = 0;

  Future<void> getAll({bool isLoadMore = false}) async {
    try{
      final data = await _todoRepository.getAll();
      state = AsyncData([
        if (isLoadMore) ...state.value ?? [], ...data
      ]);
    } catch (error, stacktrace) {
      state = AsyncError(error, stacktrace);
    }
  }

  void loadMore() {
    // ローディング中にローディングしないようにする
    if (state == const AsyncLoading<List<TodoModel>>().copyWithPrevious(state)) {
      return;
    }

    // 取得済みのデータを保持しならが状態をローディング中にする
    state = const AsyncLoading<List<TodoModel>>().copyWithPrevious(state);
    getAll(isLoadMore: true);
  }

  void refresh() {
    // 取得済みのデータを保持しならが状態をローディング中にする
    state = const AsyncLoading<List<TodoModel>>().copyWithPrevious(state);
    getAll(isLoadMore: true);
  }
}
