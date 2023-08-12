import 'package:assessment/constants/color.dart';
import 'package:assessment/models/todo.dart';
import 'package:assessment/screens/todo_form.dart';
import 'package:assessment/utilities/db_container.dart';
import 'package:assessment/widgets/todo_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          key: const Key('addButton'),
          backgroundColor: primaryColor,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => ToDoFormScreen(
                          isUpdate: false,
                        )));
          },
          child: const Icon(
            Icons.add,
            color: Colors.black,
          ),
        ),
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .3,
              color: primaryColor,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: AppBar().preferredSize.height,
                    ),
                    //Greeting Widget
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Welcome back to your 👋',
                              style: GoogleFonts.montserrat(color: Colors.black87, fontSize: 17, fontWeight: FontWeight.w400),
                            ),
                            Text(
                              'ToDo List',
                              style: GoogleFonts.montserrat(color: Colors.black, fontSize: 32, letterSpacing: -1, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.all(2), // Border width
                            decoration: BoxDecoration(color: const Color(0xFF102038), borderRadius: BorderRadius.circular(14)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(14),
                              child: SizedBox.fromSize(
                                size: const Size.fromRadius(24), // Image radius
                                child:
                                    Image.network('https://icon-library.com/images/no-user-image-icon/no-user-image-icon-3.jpg', fit: BoxFit.cover),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    //Get new value in list if has changes
                    ValueListenableBuilder<Box<ToDo>>(
                        valueListenable: DBContainer.getTodo().listenable(),
                        builder: (context, box, _) {
                          final listOfToDo = box.values.toList().cast<ToDo>();
                          if (listOfToDo.isEmpty) {
                            return Text(
                              'The List is Empty',
                              style: GoogleFonts.montserrat(fontSize: 18),
                            );
                          } else {
                            return Column(
                              children: [
                                ...List.generate(
                                  listOfToDo.length,
                                  (index) => InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => ToDoFormScreen(
                                                    isUpdate: true,
                                                    todo: listOfToDo[index],
                                                  )));
                                    },
                                    child: ToDoCard(
                                      status: listOfToDo[index].isCompleted,
                                      title: listOfToDo[index].title,
                                      startDate: listOfToDo[index].startDate,
                                      endDate: listOfToDo[index].endDate,
                                    ),
                                  ),
                                )
                              ],
                            );
                          }
                        }),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
