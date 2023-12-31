import 'package:assessment/constants/style.dart';
import 'package:assessment/models/todo.dart';
import 'package:assessment/utilities/db_container.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

updateTodo(ToDo todo, String title, DateTime startDate, DateTime endDate,
    bool status) {
  todo.title = title;
  todo.startDate = startDate;
  todo.endDate = endDate;
  todo.isCompleted = status;
  todo.save();
}

int year = int.parse(DateFormat('yyyy').format(DateTime.now()));
int month = int.parse(DateFormat('MM').format(DateTime.now()));
int day = int.parse(DateFormat('dd').format(DateTime.now()));

List<DateTime?> dialogCalendarPickerValue = [
  DateTime(year, month, day),
];

final calendarConfig = CalendarDatePicker2WithActionButtonsConfig(
    dayTextStyle: dayTextStyle,
    calendarType: CalendarDatePicker2Type.single,
    selectedDayHighlightColor: Colors.black,
    closeDialogOnCancelTapped: true,
    firstDayOfWeek: 1,
    weekdayLabelTextStyle: const TextStyle(
      color: Colors.black87,
      fontWeight: FontWeight.bold,
    ),
    controlsTextStyle: const TextStyle(
      color: Colors.black,
      fontSize: 15,
      fontWeight: FontWeight.bold,
    ),
    selectedDayTextStyle: dayTextStyle.copyWith(color: Colors.white),
    dayTextStylePredicate: ({required date}) {
      TextStyle? textStyle;
      if (date.weekday == DateTime.saturday ||
          date.weekday == DateTime.sunday) {
        textStyle = weekendTextStyle;
      }
      if (DateUtils.isSameDay(date, DateTime(2021, 1, 25))) {
        textStyle = anniversaryTextStyle;
      }
      return textStyle;
    },
    dayBuilder: ({
      required date,
      textStyle,
      decoration,
      isSelected,
      isDisabled,
      isToday,
    }) {
      Widget? dayWidget;
      if (date.day % 3 == 0 && date.day % 9 != 0) {
        dayWidget = Container(
          decoration: decoration,
          child: Center(
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Text(
                  date.day.toString(),
                  style: textStyle,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 27.5),
                  child: Container(
                    height: 4,
                    width: 4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color:
                          isSelected == true ? Colors.white : Colors.grey[500],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }
      return dayWidget;
    });

showInSnackBarSuccess(String value, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.black,
    content: Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Container(
            width: 21,
            height: 21,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.green),
            child: const Icon(
              Icons.done,
              size: 18,
            ),
          ),
        ),
        Flexible(
          child: Text(
            maxLines: 6,
            value,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    ),
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.all(30.0),
  ));
}

showInSnackBarFail(String value, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.black,
    content: Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Container(
            width: 21,
            height: 21,
            decoration:
                const BoxDecoration(shape: BoxShape.circle, color: Colors.red),
            child: const Icon(
              Icons.close,
              size: 18,
            ),
          ),
        ),
        Flexible(
          child: Text(
            value,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ],
    ),
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.all(30.0),
  ));
}
