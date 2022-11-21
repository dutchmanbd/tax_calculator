import 'package:flutter/material.dart';

class MyTextFiled extends StatelessWidget {
  final String hintText;
  final TextInputType inputType;
  final TextInputAction? action = TextInputAction.next;
  final ValueChanged<String>? onChanged;

  const MyTextFiled({
    Key? key,
    required this.hintText,
    required this.inputType,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      textAlignVertical: TextAlignVertical.center,
      keyboardType: inputType,
      maxLines: 1,
      minLines: 1,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
        hintText: hintText,
      ),
      textInputAction: action,
    );
  }
}
