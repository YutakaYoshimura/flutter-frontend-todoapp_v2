import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_model.freezed.dart';
part 'todo_model.g.dart';

@freezed
abstract class TodoModel with _$TodoModel {
  factory TodoModel({
    @Default(0) int id,
    @Default('') String title,
    DateTime? date,
    @Default(1) int category,
    @Default('') String memo,
    @Default(false) bool delflg
  }) = _TodoModel;

  factory TodoModel.fromJson(Map<String, dynamic> json) => _$TodoModelFromJson(json);
}