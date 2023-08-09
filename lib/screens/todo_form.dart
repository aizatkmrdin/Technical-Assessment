import 'package:assessment/constants/color.dart';
import 'package:assessment/utilities/servicers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ToDoFormScreens extends StatelessWidget {
  const ToDoFormScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
        backgroundColor: primaryColor,
        elevation: 0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          dynamic rsp = addTodo('Test', DateTime.now(), DateTime.now());
          Navigator.pop(context);
        },
        child: Text(
          'Create Now',
          style: GoogleFonts.montserrat(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 18),
        child: Column(
          children: [
            Text('To-Do Title'),
            TextField(
              decoration: InputDecoration(labelText: 'Enter Message(max line 5)'),
              keyboardType: TextInputType.multiline,
              maxLines: 5, // <-- SEE HERE
            ),
            Text('Start Date'),
            Text('End Date'),
          ],
        ),
      ),
    );
  }
}
