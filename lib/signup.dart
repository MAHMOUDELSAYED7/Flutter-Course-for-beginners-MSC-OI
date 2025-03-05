import 'dart:developer';

import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 100),
              Text(
                "Welcome!",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              // Very Important
              SizedBox(height: 100),
              buildTextField(
                  keyboardType: TextInputType.name,
                  label: "Full Name",
                  hintText: "Jone Mac",
                  iconData: Icons.email,
                  controller: fullNameController),
              SizedBox(height: 30),
              buildTextField(
                  keyboardType: TextInputType.emailAddress,
                  label: "Email",
                  hintText: "example@kh.co",
                  iconData: Icons.email,
                  controller: emailController),
              SizedBox(height: 30),
              buildTextField(
                keyboardType: TextInputType.visiblePassword,
                label: "Password",
                hintText: "password",
                iconData: Icons.lock,
                controller: passwordController,
                obscureText: true,
              ),
              SizedBox(height: 50),
              buildFormButton(
                  title: "Sign Up",
                  onPressed: () {
                    final email = emailController.text;
                    final password = passwordController.text;
                    final fullName = fullNameController.text;
                    log("Full Name is: ${fullName} Email is: ${email} , password is: ${password}");
                  }),

              SizedBox(height: 50),

              Row(
                children: [
                  Text("Already have an Account, "),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Sign In",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFormButton(
      {required String title, required void Function()? onPressed}) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                fixedSize: Size.fromHeight(55),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                elevation: 10,
                overlayColor: Colors.red,
                foregroundColor: Colors.black),
            onPressed: onPressed,
            child: Text(title),
          ),
        ),
      ],
    );
  }

  Widget buildTextField({
    required String label,
    required String hintText,
    required IconData iconData,
    required TextEditingController? controller,
    bool? obscureText,
    TextInputType? keyboardType,
  }) {
    return TextField(
      obscureText: obscureText == true ? isVisible : false,
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
          label: Text(label),
          suffixIcon: obscureText == true
              ? InkWell(
                  onTap: () {
                    isVisible = !isVisible;
                    setState(() {});
                  },
                  child:
                      Icon(isVisible ? Icons.visibility_off : Icons.visibility),
                )
              : null,
          border: OutlineInputBorder(),
          prefixIcon: Icon(iconData),
          hintText: hintText),
    );
  }
}
