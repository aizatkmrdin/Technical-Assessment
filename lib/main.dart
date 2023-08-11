import 'package:assessment/models/todo.dart';
import 'package:assessment/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //initialize Hive datbase
  await Hive.initFlutter();
  Hive.registerAdapter(ToDoAdapter());
  //Open todo database
  await Hive.openBox<ToDo>('todo');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Assessment',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
