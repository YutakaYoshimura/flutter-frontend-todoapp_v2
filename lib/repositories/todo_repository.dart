import 'package:dio/dio.dart';

import '../apis/todo_api_client.dart';
import '../models/todo_model.dart';

class TodoRepository {
  final _todoApiClient = TodoApiClient(Dio());

  Future<dynamic> getAll() async {
    return _todoApiClient.getAll().then((value) {
      // APIで返ってきたJSONをモデルに変換
      return value
        .map((e) => TodoModel.fromJson(e as Map<String, dynamic>))
        .toList();
    });
  }
}