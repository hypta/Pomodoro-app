import 'dart:convert';

class TodoItem {
  String name;
  bool completed;

  TodoItem(this.name, {this.completed = false});

  String toJson() {
    return jsonEncode({'name': name, 'completed': completed});
  }

  factory TodoItem.fromJson(Map<String, dynamic> json) {
    return TodoItem(json['name'], completed: json['completed'] ?? false);
  }
}