import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart'; // 日本語ロケール（ja）の日付表記を使うために初期化で使う
import 'widgets/todo_card.dart';
import 'models/todo.dart';

void main() async {
// TodoCard内で DateFormat(..., 'ja') を使うため、起動時に一度だけ初期化しよう
await initializeDateFormatting('ja');
runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      home: Scaffold(
        appBar: AppBar(title: const Text('Todo App')),
        body: Center(
          child: TodoCard(
            todo: Todo(
              title: 'テストタイトル',
              detail: '説明文',
              dueDate: DateTime.now(),
            ),
            onToggle: () {}, // まだ状態管理はしないので空でOK（後の章で差し替える）
          ),
        ),
      ),
    );
  }
}