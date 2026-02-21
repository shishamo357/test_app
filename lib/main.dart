import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart'; // 日本語ロケール（ja）の日付表記を使うために初期化で使う
import 'screens/list_screen.dart';

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
      home: ListScreen(), // 5件のTodoリストを表示する画面
    );
  }
}
