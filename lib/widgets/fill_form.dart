import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FillForm extends StatefulWidget {
  const FillForm({
    required this.hint,
    this.controller,
    this.onTap,
    this.disable,
    this.onChange,
    Key? key,
  }) : super(key: key);

  final String hint;
  final TextEditingController? controller;
  final bool? disable;
  final VoidCallback? onTap;
  final Function(String)? onChange;

  @override
  State<FillForm> createState() => _FillFormState();
}

class _FillFormState extends State<FillForm> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextFormField(
        enabled: widget.disable,
        onTap: widget.onTap,
        onChanged: widget.onChange,
        keyboardType: TextInputType.multiline,
        minLines: widget.hint.contains('title') ? 4 : 1,
        maxLines: widget.hint.contains('title') ? null : 1,
        textAlignVertical: TextAlignVertical.center,
        style: const TextStyle(color: Colors.black),
        controller: widget.controller,
        decoration: InputDecoration(
          disabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFE2E2E2),
              width: 2.0,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          contentPadding: const EdgeInsets.all(15.0),
          fillColor: const Color(0xFFE2E2E2),
          filled: true,
          hintText: widget.hint,
          hintStyle: GoogleFonts.hindSiliguri(
              textStyle: const TextStyle(
                  color: Color(0xFF919098),
                  fontSize: 18,
                  fontWeight: FontWeight.w500)),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFE2E2E2),
              width: 2.0,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            borderSide: BorderSide(
              color: Color(0xFFE2E2E2),
              width: 2.0,
            ),
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          prefixIconColor: Colors.white,
        ),
      ),
    );
  }
}
