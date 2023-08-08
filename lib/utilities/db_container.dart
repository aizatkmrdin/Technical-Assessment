import 'package:assessment/models/todo.dart';
import 'package:hive/hive.dart';

class DBContainer {
  static Box<ToDo> getTodo() => Hive.box<ToDo>('todo');
}
