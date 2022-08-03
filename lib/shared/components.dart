import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  TextInput({
    Key? key,
    required this.inputController,
    required this.label,
    required this.icon,
    this.keyboard,
  }) : super(key: key);

  final TextEditingController inputController;
  final String label;
  final IconData icon;
  TextInputType? keyboard;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: inputController,
      keyboardType: keyboard ?? TextInputType.text,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        prefixIcon: Icon(icon),
        labelText: label,
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "This Field Must Not Be Empty!";
        }
      },
    );
  }
}
