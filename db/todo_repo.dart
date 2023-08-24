import '../models/todo.dart';

class TodoRepo {
  List<Todo> getTodos() =>
      demoTodos.where((element) => !element.isCompleted).toList();

  List<Todo> getCompletedTods() =>
      demoTodos.where((element) => element.isCompleted).toList();

  bool addTodo(Todo todo) {
    try {
      demoTodos.add(todo);
      return true;
    } catch (e) {
      return false;
    }
  }

  bool updateTodo(String id, Map<String, dynamic> data) {
    try {
      getTodo(id).markCompleted();
      return true;
    } catch (e) {
      return false;
    }
  }

  Todo getTodo(String id) {
    return demoTodos.firstWhere((element) => element.id == int.parse(id));
  }
}

List<Todo> demoTodos = [
  Todo(
    id: 1,
    title: 'Buy groceries',
    description: 'Milk, eggs, bread',
  ),
  Todo(
    id: 2,
    title: 'Finish project report',
    description: 'Due next week',
  ),
  Todo(
    id: 3,
    title: 'Go for a run',
  ),
  Todo(
    id: 4,
    title: 'Call mom',
    description: 'Wish her happy birthday',
  ),
  Todo(
    id: 5,
    title: 'Read a book',
    description: 'Select from the reading list',
  ),
  Todo(
    id: 6,
    title: 'Plan vacation',
    description: 'Choose destination and dates',
  ),
];
