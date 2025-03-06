import 'dart:developer';

import 'package:flutter/material.dart';

import 'my_snackbar.dart';
import 'widgets/my_button.dart';
import 'widgets/my_text_form_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? name;
  String? email;
  String? password;
  String? confirmPassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(height: 120),
                  Text(
                    "Welcome Back!",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    "Register",
                    style: TextStyle(fontSize: 18, color: Colors.blue),
                  ),
                  SizedBox(height: 80),
                  MyTextFormField(
                    keyboardType: TextInputType.text,
                    label: "Name",
                    hintText: "Jone mate",
                    onSaved: (data) {
                      name = data;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Field is empty";
                      } else if (value.length < 2) {
                        return "Invalid name";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 15),
                  MyTextFormField(
                    keyboardType: TextInputType.emailAddress,
                    label: "Email",
                    hintText: "example@gmail.com",
                    onSaved: (data) {
                      email = data;
                    },
                    validator: (value) {
                      final bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value!);

                      if (!emailValid) {
                        return "Email not valid";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 15),
                  MyTextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    label: "Password",
                    obscureText: true,
                    hintText: "your password",
                    onSaved: (data) {
                      password = data;
                    },
                    onChanged: (value) {
                      confirmPassword = value;
                    },
                    validator: (value) {
                      RegExp regex = RegExp(
                          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                      if (value!.isEmpty) {
                        return 'Please enter password';
                      } else {
                        if (!regex.hasMatch(value)) {
                          return 'Enter valid password';
                        } else {
                          return null;
                        }
                      }
                    },
                  ),
                  SizedBox(height: 15),
                  MyTextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    label: "Confirm Passord",
                    obscureText: true,
                    hintText: "Enter Confirm password",
                    validator: (value) {
                      RegExp regex = RegExp(
                          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                      if (value!.isEmpty) {
                        return 'Please enter password';
                      } else if (!regex.hasMatch(value)) {
                        return 'Enter valid password';
                      } else if (confirmPassword != value) {
                        return "Password don't match";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Text("Already have an account? "),
                      InkWell(
                        child: Text(
                          "Login",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.blue),
                        ),
                        onTap: () => Navigator.pop(context),
                      )
                    ],
                  ),
                  SizedBox(height: 80),
                  MyButton(
                    title: "Register",
                    icon: Icons.login,
                    onPressed: () {
                      if (formKey.currentState?.validate() ?? false) {
                        FocusScope.of(context).unfocus();
                        formKey.currentState?.save();
                        //! SNACKBAR
                        showMySnackBar(context, "Register Successufly");
                        log("Name: $name , Email: $email , Password: $password , Confirm Password: $confirmPassword");
                      }
                    },
                  ),
                  SizedBox(height: 80),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
