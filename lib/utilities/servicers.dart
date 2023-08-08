import 'package:assessment/models/todo.dart';
import 'package:assessment/utilities/db_container.dart';

addTodo(String title, DateTime startDate, DateTime endDate) {
  final todo = ToDo()
    ..title = title
    ..createdDate = DateTime.now()
    ..startDate = startDate
    ..endDate = endDate
    ..isCompleted = false;
  final box = DBContainer.getTodo();
  box.add(todo);
}
