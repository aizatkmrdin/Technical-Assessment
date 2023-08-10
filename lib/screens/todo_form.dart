import 'package:assessment/constants/color.dart';
import 'package:assessment/utilities/servicers.dart';
import 'package:assessment/widgets/custom_button.dart';
import 'package:assessment/widgets/fill_form.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

class ToDoFormScreens extends StatefulWidget {
  const ToDoFormScreens({super.key});

  @override
  State<ToDoFormScreens> createState() => _ToDoFormScreensState();
}

class _ToDoFormScreensState extends State<ToDoFormScreens> {
  final todoTitleController = TextEditingController();
  final startDateController = TextEditingController();
  final endDateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
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
                                setState(
                                  () {
                                    setState(() {
                                      startDateController.text = getValueText(
                                        calendarConfig.calendarType,
                                        values,
                                      );
                                    });
                                  },
                                );
                              }
                            },
                            child: FillForm(
                              disable: false,
                              hint: 'Select a date',
                              controller: startDateController,
                            ),
                          ),
                          startDateController.text.isNotEmpty
                              ? Positioned.fill(
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
                              : Container()
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
                                setState(
                                  () {
                                    setState(() {
                                      endDateController.text = getValueText(
                                        calendarConfig.calendarType,
                                        values,
                                      );
                                    });
                                  },
                                );
                              }
                            },
                            child: FillForm(
                              disable: false,
                              hint: 'Select a date',
                              controller: endDateController,
                            ),
                          ),
                          endDateController.text.isNotEmpty
                              ? Positioned.fill(
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
                              : Container()
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              bottom: 40,
              width: MediaQuery.of(context).size.width,
              child: InkWell(
                  onTap: () {
                    addTodo(
                      todoTitleController.text,
                      DateFormat("yyyy-MM-dd").parse(startDateController.text),
                      DateFormat("yyyy-MM-dd").parse(endDateController.text),
                    );
                    Navigator.pop(context);
                  },
                  child: CustomButton(title: 'Create Now')))
        ],
      ),
    );
  }
}
