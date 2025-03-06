
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    required this.title,
    this.icon,
    this.onPressed,
  });
  final String title;
  final IconData? icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          fixedSize: Size(double.maxFinite, 50)),
      onPressed: onPressed,
      label: Text(title),
      icon: Icon(icon, color: Colors.white),
    );
  }
}
