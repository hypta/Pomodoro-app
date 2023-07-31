import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Todo_Item.dart';

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  TodoListState createState() => TodoListState();
}

class TodoListState extends State<TodoList> {
  final List<TodoItem> _todoList = [];
  final _textEditingController = TextEditingController();


  @override
  void initState() {
    super.initState();
  }

  void _saveTodoList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> todoListJson =
        _todoList.map((todoItem) => jsonEncode(todoItem.toJson())).toList();
    await prefs.setStringList('todo_list', todoListJson);
  }

  void _addTask(String name) {
    setState(() {
      _todoList.add(TodoItem(name));
    });
    _saveTodoList();
    _textEditingController.clear();
  }

  void _completeTask(int index) {
    setState(() {
      _todoList[index].completed = true;
    });
    _saveTodoList();
  }

  void _uncheckTask(int index) {
    setState(() {
      _todoList[index].completed = false;
    });
    _saveTodoList();
  }

  void _removeTask(int index) {
    setState(() {
      _todoList.removeAt(index);
    });
    _saveTodoList();
  }

  Widget _buildTaskList() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: _todoList.length,
      itemBuilder: (context, index) {
        final todoItem = _todoList[index];
        return ListTile(
          leading: Checkbox(
            value: todoItem.completed,
            onChanged: (bool? value) {
              if (value == true) {
                _completeTask(index);
              } else {
                _uncheckTask(index);
              }
            },
          ),
          title: Text(
            todoItem.name,
            style: todoItem.completed
                ? const TextStyle(decoration: TextDecoration.lineThrough)
                : null,
          ),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              _removeTask(index);
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'To-Do List:',
          style: TextStyle(fontSize: 22.0),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: _buildTaskList(),
        ),
        const SizedBox(height: 20),
        TextField(
          controller: _textEditingController,
          onSubmitted: (String value) {
            _addTask(value);
          },
          decoration: const InputDecoration(
            hintText: 'Add a new task...',
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}