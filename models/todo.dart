class Todo {
  Todo({
    required this.id,
    required this.title,
    this.description = '',
    this.isCompleted = false,
  });

  factory Todo.fromJson(Map<String, dynamic> map) => Todo(
        id: int.parse(map['id'].toString()),
        title: map['title'] as String,
        description: map['description'] as String,
        isCompleted: map['isCompleted'] as bool,
      );

  late int id;
  late String title;
  late String description;
  late bool isCompleted;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'isCompleted': isCompleted,
      };

  void markCompleted() {
    isCompleted = true;
  }
}
