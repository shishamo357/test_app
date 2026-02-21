import 'package:flutter/material.dart';

import '../services/todo_service.dart';
import '../widgets/todo_list.dart';
import 'add_todo_screen.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key, required this.todoService});

  final TodoService todoService;

  @override
  ListScreenState createState() => ListScreenState();
}

class ListScreenState extends State<ListScreen> {
  // 状態管理：追加画面から戻ったときにリストを同期するため、キーで TodoList を再構築
  Key _todoListKey = UniqueKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TODOリスト')),
      body: TodoList(
        key: _todoListKey,
        todoService: widget.todoService, // TodoListでも保存/読み込みできるように渡そう
      ), // TodoList ウィジェットを配置
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // 追加画面へ行き、戻ってきたときに「更新があったか」を受け取ろう（true/false）
          final updated = await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AddTodoScreen(
                      todoService: widget.todoService, // 追加画面でも保存できるように渡そう
                    )),
          );

          // 状態管理：追加があったら TodoList を再構築し、永続化された最新リストを表示
          if (updated == true) {
            setState(() {
              _todoListKey = UniqueKey();
            });
          }
        },
        backgroundColor: const Color.fromARGB(255, 0, 0, 255), // ボタンの背景色
        foregroundColor: Colors.white, // ボタン内のアイコン色
        child: const Icon(Icons.add), // Flutter標準の「＋」アイコン
      ),
    );
  }
}