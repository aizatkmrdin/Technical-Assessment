import 'package:assessment/models/todo.dart';
import 'package:assessment/utilities/db_container.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: ValueListenableBuilder<Box<ToDo>>(
            valueListenable: DBContainer.getTodo().listenable(),
            builder: (context, box, _) {
              final listOfToDo = box.values.toList().cast<ToDo>();
              return Text(' asd');
            }));
  }
}
