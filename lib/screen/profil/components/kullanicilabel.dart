import 'package:flowers/sabit_degerler.dart';
import 'package:flutter/material.dart';

class girislabel extends StatelessWidget {
  final IconData icon;
  final bool obscureText;
  final String hintText;
  final TextInputType? type;
  final void Function(String?)? func;
  final TextEditingController? controller;

  const girislabel({
    super.key,
    required this.icon,
    required this.obscureText,
    required this.hintText,
    this.type,
    this.func,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return "Bilgileri eksiksiz giriniz.";
          }
          return null;
        },
        controller: controller,
        onSaved: func,
        keyboardType: type,
        obscureText: obscureText,
        style: const TextStyle(
          color: siyah,
        ),
        decoration: InputDecoration(
            border: const UnderlineInputBorder(),
            prefixIcon: Icon(
              icon,
              color: siyah.withOpacity(.3),
            ),
            hintText: hintText),
        cursorColor: siyah.withOpacity(.3),
      ),
    );
  }
}
