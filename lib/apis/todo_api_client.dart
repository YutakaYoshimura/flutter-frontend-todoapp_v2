import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../constant/url.dart';

part 'todo_api_client.g.dart';

const tableName = 'todos';

@RestApi(baseUrl: 'http://$apiUrl/$tableName')
abstract class TodoApiClient {
  factory TodoApiClient(Dio dio, {String baseUrl}) = _TodoApiClient;

  @GET('')
  Future<dynamic> getAll();
}