import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField(
      {super.key,
      required this.label,
      required this.hintText,
      this.onSaved,
      this.validator,
      this.keyboardType,
      this.obscureText,
      this.onChanged});
  final String label;
  final String hintText;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool? obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      validator: validator,
      onChanged: onChanged,
      cursorColor: Colors.green,
      obscureText: obscureText ?? false,
      keyboardType: keyboardType,
      //! Note
      // keyboardType: TextInputType.multiline,
      // maxLines: 5,
      // minLines: 1,
      textInputAction: TextInputAction.newline,
      maxLength: 72,
      decoration: InputDecoration(
        // fillColor: Colors.amber,
        // filled: true,

        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.black,
        )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.green,
        )),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.red,
        )),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.red,
        )),
        label: Text(label),
        hintText: hintText,
      ),
    );
  }
}
