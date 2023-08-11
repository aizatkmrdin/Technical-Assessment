import 'package:hive/hive.dart';
part 'todo.g.dart';

//Hive
@HiveType(typeId: 0)
class ToDo extends HiveObject {
  @HiveField(0)
  late String title;

  @HiveField(1)
  late DateTime createdDate;

  @HiveField(2)
  late DateTime startDate;

  @HiveField(3)
  late DateTime endDate;

  @HiveField(4)
  late bool isCompleted;
}
