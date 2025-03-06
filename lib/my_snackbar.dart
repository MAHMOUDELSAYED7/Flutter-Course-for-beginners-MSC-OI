import 'package:flutter/material.dart';

void showMySnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(content, textAlign: TextAlign.center),
    margin: EdgeInsets.all(10),
    behavior: SnackBarBehavior.floating,
    // backgroundColor: Colors.blue,
    showCloseIcon: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15)
    ),
    duration: Duration(seconds: 3),
  ));
}
