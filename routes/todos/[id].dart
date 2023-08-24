import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

import '../../db/todo_repo.dart';

Response onRequest(RequestContext context, String id) {
  try {
    final todoRepo = context.read<TodoRepo>();
    final todo = todoRepo.getTodo(id);
    return Response.json(body: todo.toJson());
  } catch (e) {
    return Response.json(
      statusCode: HttpStatus.notFound,
      body: {'error': 'Todo not found with id $id'},
    );
  }
}
