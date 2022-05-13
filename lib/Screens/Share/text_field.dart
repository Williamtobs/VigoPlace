import 'package:flutter/material.dart';

class VigoTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool obScureText;
  final String hintText;
  final Icon icon;
  final Icon? suffixIcon;
  const VigoTextField(
      {Key? key,
      required this.controller,
      required this.obScureText,
      required this.hintText,
      required this.icon,
      this.suffixIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obScureText,
      decoration: InputDecoration(
          isDense: true,
          hintText: hintText,
          filled: true,
          fillColor: const Color.fromRGBO(243, 244, 248, 1),
          //icon: icon,
          prefixIcon: icon,
          suffix: suffixIcon,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromRGBO(209, 210, 216, 1),
            ),
          ),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
            color: Color.fromRGBO(209, 210, 216, 1),
          ))),
    );
  }
}
