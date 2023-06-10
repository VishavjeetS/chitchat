import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final IconData icon;
  final bool obsecureText;
  const MyTextField(
      {super.key,
      required this.hintText,
      required this.controller,
      required this.icon,
      required this.obsecureText});

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  String text = "";
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: Colors.grey.shade400,
        ),
        prefixIcon: Icon(widget.icon),
        suffixIcon: IconButton(
            onPressed: () {
              widget.controller.clear();
              setState(() {
                text = "";
              });
            },
            icon: text.isNotEmpty
                ? const Icon(Icons.close_outlined)
                : const Icon(null)),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 0.0,
        ),
      ),
      obscureText: widget.obsecureText,
      onChanged: (value) {
        setState(() {
          text = value;
        });
      },
    );
  }
}
