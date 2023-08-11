// ignore_for_file: must_be_immutable

import 'package:assessment/constants/color.dart';
import 'package:assessment/constants/date.dart';
import 'package:assessment/models/todo.dart';
import 'package:assessment/utilities/servicers.dart';
import 'package:assessment/widgets/custom_button.dart';
import 'package:assessment/widgets/fill_form.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

class ToDoFormScreen extends StatefulWidget {
  ToDoFormScreen({required this.isUpdate, this.todo, super.key});

  bool isUpdate;
  ToDo? todo;
  @override
  State<ToDoFormScreen> createState() => _ToDoFormScreenState();
}

class _ToDoFormScreenState extends State<ToDoFormScreen> {
  bool isCompleted = false;
  final todoTitleController = TextEditingController();
  final startDateController = TextEditingController();
  final endDateController = TextEditingController();

  @override
  void initState() {
    if (widget.isUpdate) getToDoValue(widget.todo!);
    super.initState();
  }

  //Get todo list if its a update form
  getToDoValue(ToDo todo) {
    setState(() {
      todoTitleController.text = todo.title;
      startDateController.text = cardDisplayDateFormat.format(todo.startDate);
      endDateController.text = cardDisplayDateFormat.format(todo.endDate);
      isCompleted = todo.isCompleted;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(widget.isUpdate ? 'Update To-Do List' : 'Add New To-Do List'),
        backgroundColor: primaryColor,
        elevation: 0,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 18),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          'To-Do Title',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      FillForm(
                        hint: 'Please key in your To-Do title here',
                        controller: todoTitleController,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          'Start Date',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      Stack(
                        children: [
                          InkWell(
                            onTap: () async {
                              final values =
                                  await showCalendarDatePicker2Dialog(
                                context: context,
                                config: calendarConfig,
                                dialogSize: const Size(325, 400),
                                borderRadius: BorderRadius.circular(15),
                                dialogBackgroundColor: Colors.white,
                              );
                              if (values != null) {
                                setState(() {
                                  startDateController.text =
                                      cardDisplayDateFormat.format(values[0]!);
                                });
                              }
                            },
                            child: FillForm(
                              disable: false,
                              hint: 'Select a date',
                              controller: startDateController,
                            ),
                          ),
                          if (startDateController.text.isNotEmpty)
                            Positioned.fill(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Align(
                                    alignment: Alignment.centerRight,
                                    child: IconButton(
                                      onPressed: () {
                                        setState(
                                          () => startDateController.clear(),
                                        );
                                      },
                                      icon: const Icon(
                                        Iconsax.close_square,
                                        color: Colors.black,
                                      ),
                                    )),
                              ),
                            )
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          'End Date',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      Stack(
                        children: [
                          InkWell(
                            onTap: () async {
                              final values =
                                  await showCalendarDatePicker2Dialog(
                                context: context,
                                config: calendarConfig,
                                dialogSize: const Size(325, 400),
                                borderRadius: BorderRadius.circular(15),
                                dialogBackgroundColor: Colors.white,
                              );
                              if (values != null) {
                                setState(() {
                                  endDateController.text =
                                      cardDisplayDateFormat.format(values[0]!);
                                });
                              }
                            },
                            child: FillForm(
                              disable: false,
                              hint: 'Select a date',
                              controller: endDateController,
                            ),
                          ),
                          if (endDateController.text.isNotEmpty)
                            Positioned.fill(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Align(
                                    alignment: Alignment.centerRight,
                                    child: IconButton(
                                      onPressed: () {
                                        setState(
                                          () => endDateController.clear(),
                                        );
                                      },
                                      icon: const Icon(
                                        Iconsax.close_square,
                                        color: Colors.black,
                                      ),
                                    )),
                              ),
                            )
                        ],
                      ),
                    ],
                  ),
                ),
                if (widget.todo != null)
                  CheckboxListTile(
                    fillColor: MaterialStateProperty.all<Color>(primaryColor),
                    title: Text(
                      "Completed ?",
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                    value: isCompleted,
                    onChanged: (newValue) {
                      setState(() {
                        isCompleted = newValue!;
                      });
                    },
                    controlAffinity: ListTileControlAffinity
                        .leading, //  <-- leading Checkbox
                  ),
              ],
            ),
          ),
          Positioned(
              bottom: 40,
              width: MediaQuery.of(context).size.width,
              child: InkWell(
                  onTap: () {
                    if (todoTitleController.text.isEmpty ||
                        startDateController.text.isEmpty ||
                        endDateController.text.isEmpty) {
                      showInSnackBarFail('Please Complete To-Do Form', context);
                    } else {
                      if (widget.isUpdate) {
                        //Update todo details to database
                        updateTodo(
                            widget.todo!,
                            todoTitleController.text,
                            DateFormat('dd MMM yyyy')
                                .parse(startDateController.text),
                            DateFormat('dd MMM yyyy')
                                .parse(endDateController.text),
                            isCompleted);
                        showInSnackBarSuccess(
                            'Successfully Update To-Do List', context);
                        Navigator.pop(context);
                      } else {
                        //Add todo details to database
                        addTodo(
                          todoTitleController.text,
                          DateFormat('dd MMM yyyy')
                              .parse(startDateController.text),
                          DateFormat('dd MMM yyyy')
                              .parse(endDateController.text),
                        );
                        showInSnackBarSuccess(
                            'Successfully Add New To-Do List', context);
                        Navigator.pop(context);
                      }
                    }
                  },
                  child: CustomButton(
                      title: widget.isUpdate ? 'Update Now' : 'Create Now')))
        ],
      ),
    );
  }
}
