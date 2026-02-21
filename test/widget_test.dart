// Todoアプリのウィジェットテスト
// アプリが起動し、一覧画面が表示されることを確認する

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:test_app/main.dart';
import 'package:test_app/services/todo_service.dart';

void main() {
  setUpAll(() async {
    // テスト用に SharedPreferences をモック（必須）
    SharedPreferences.setMockInitialValues({});
  });

  testWidgets('Todoアプリが起動し一覧画面が表示される', (WidgetTester tester) async {
    final prefs = await SharedPreferences.getInstance();
    final todoService = TodoService(prefs);

    await tester.pumpWidget(MyApp(todoService: todoService));
    await tester.pumpAndSettle();

    // 一覧画面の AppBar と FAB が表示されていること
    expect(find.text('TODOリスト'), findsOneWidget);
    expect(find.byIcon(Icons.add), findsOneWidget);
  });
}
