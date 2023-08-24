import 'package:dart_frog/dart_frog.dart';

import '../db/todo_repo.dart';

final todoRepo = TodoRepo();

Handler middleware(Handler handler) {
  return handler.use(provider((context) => todoRepo));
}
