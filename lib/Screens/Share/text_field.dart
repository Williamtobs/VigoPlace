import 'package:flutter/material.dart';

class VigoTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool obScureText;
  final String hintText;
  final Icon icon;
  final IconButton? suffixIcon;
  final String? Function(String?)? validator;
  const VigoTextField(
      {Key? key,
      required this.controller,
      required this.obScureText,
      required this.hintText,
      required this.icon,
      this.suffixIcon,
      this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obScureText,
      validator: validator,
      decoration: InputDecoration(
          isDense: true,
          hintText: hintText,
          filled: true,
          fillColor: const Color.fromRGBO(243, 244, 248, 1),
          contentPadding: const EdgeInsets.all(18.0),
          prefixIcon: icon,
          suffixIcon: suffixIcon,
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red)),
          focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red)),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromRGBO(129, 53, 249, 1),
            ),
          ),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
            color: Color.fromRGBO(209, 210, 216, 1),
          ))),
    );
  }
}
