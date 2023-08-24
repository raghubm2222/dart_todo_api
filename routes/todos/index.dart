import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

import '../../db/todo_repo.dart';
import '../../models/todo.dart';

Future<Response> onRequest(RequestContext context) async {
  final method = context.request.method;
  final todoRepo = context.read<TodoRepo>();

  if (method == HttpMethod.get) {
    await _get(context, todoRepo);
  }

  if (method == HttpMethod.post) {
    await _post(context, todoRepo);
  }

  return Response(statusCode: HttpStatus.methodNotAllowed);
}

Future<Response> _get(RequestContext context, TodoRepo todoRepo) async {
  final completedTodos =
      context.request.uri.queryParameters['completed'] ?? 'false';
  return Response.json(
    body: completedTodos.toLowerCase() == 'true'
        ? todoRepo.getCompletedTods()
        : todoRepo.getTodos(),
  );
}

Future<Response> _post(RequestContext context, TodoRepo todoRepo) async {
  final todo = Todo.fromJson(
    await context.request.json() as Map<String, dynamic>,
  );
  todoRepo.addTodo(todo);
  return Response.json(statusCode: HttpStatus.created);
}
