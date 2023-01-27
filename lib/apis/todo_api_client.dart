import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:todoapp_v2/models/todo_model.dart';

import '../constant/url.dart';

part 'todo_api_client.g.dart';

const tableName = 'todos';

@RestApi(baseUrl: 'http://$apiUrl/$tableName')
abstract class TodoApiClient {
  factory TodoApiClient(Dio dio, {String baseUrl}) = _TodoApiClient;

  @GET('')
  Future<dynamic> getAll();

  @POST('')
  Future<dynamic> add(@Body() Map<String,dynamic> body);
}