import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../models/todo.dart'; // 表示に使うTodoデータ
import '../widgets/todo_card.dart'; // 1件分の表示はTodoCardに任せる

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => TodoListState();
}

class TodoListState extends State<TodoList> {
  // ここにTodoを追加して、リスト表示が増えることを確認しよう
  final List<Todo> todos = [
    Todo(
      title: '大学の単位認定試験試験',
      detail: '２月２４日まで',
      dueDate: DateTime(2026, 2, 21),
      isCompleted: false,
    ),
    Todo(
      title: '買い物',
      detail: 'ファイル、ケース、弁当',
      dueDate: DateTime(2025, 1, 10),
      isCompleted: true,
    ),
    Todo(
      title: 'アルバイト',
      detail: '日、水、木曜日の６時から１３時まで',
      dueDate: DateTime(2025, 1, 12),
      isCompleted: false,
    ),
    Todo(
      title: '友達との約束',
      detail: '土曜日に映画を見に行く',
      dueDate: DateTime(2025, 1, 20),
      isCompleted: false,
    ),
    Todo(
      title: '開発',
      detail: 'アプリ開発',
      dueDate: DateTime(2025, 1, 9),
      isCompleted: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos.length, // 表示する件数をtodosに合わせよう
      itemBuilder: (context, index) {
        // index番目のTodoを取り出して、TodoCardに渡して表示しよう
        return Padding(
          padding: const EdgeInsets.all(8.0), // カード同士がくっつかないよう余白をつけよう
          child: TodoCard(todo: todos[index]),
        );
      },
    );
  }
}