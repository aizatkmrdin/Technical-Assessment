// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:assessment/models/todo.dart';
import 'package:assessment/screens/home.dart';
import 'package:assessment/screens/todo_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() {
  testWidgets('HomeScreen widget test', (WidgetTester tester) async {
    await Hive.initFlutter();
    Hive.registerAdapter(ToDoAdapter());
    //Open todo database
    await Hive.openBox<ToDo>('todo');
    Hive.close();
    await tester.pumpWidget(
      MaterialApp(
        home: HomeScreen(),
      ),
    );

    // Verify that the widget tree is built correctly
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(FloatingActionButton), findsOneWidget);
    expect(find.byType(ValueListenableBuilder), findsOneWidget);
    // Add more verification as needed

    // You can simulate interactions and perform further tests
    // For example, you can tap the FloatingActionButton and verify the result
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle(); // Wait for animations to complete

    // Verify that the expected navigation occurred
    expect(find.byType(ToDoFormScreen), findsOneWidget);
  });

  testWidgets('ToDoFormScreen widget test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ToDoFormScreen(
          isUpdate: false,
        ),
      ),
    );

    // Verify that the widget tree is built correctly
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(AppBar), findsOneWidget);
    expect(find.byType(TextField), findsWidgets); // You should customize this based on your UI
    expect(find.byType(CheckboxListTile), findsWidgets); // You should customize this based on your UI

    // You can simulate interactions and perform further tests
    // For example, you can enter text into text fields and tap buttons
    final textField = find.byType(TextField).first;
    await tester.enterText(textField, 'Sample Title');
    await tester.pumpAndSettle(); // Wait for animations to complete

    // Verify that the text was entered correctly
    expect(find.text('Sample Title'), findsOneWidget);

    // Now you can test interaction with the button
    final button = find.text('Create Now');
    await tester.tap(button);
    await tester.pumpAndSettle();

    // Verify that the expected snackbar message appeared
    expect(find.text('Successfully Add New To-Do List'), findsOneWidget);

    // Add more tests for other interactions and scenarios
  });
}
