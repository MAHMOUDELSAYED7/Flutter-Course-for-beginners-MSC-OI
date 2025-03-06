import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_course_for_beginners_msc/register.dart';

import 'my_snackbar.dart';
import 'widgets/my_button.dart';
import 'widgets/my_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? email;
  String? password;

  showMyDialog() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(
                "Welcome",
                // textAlign: TextAlign.center,
              ),
              content: Text(
                "MSC OI Flutter course",
                // textAlign: TextAlign.center,
              ),

              // actionsAlignment: MainAxisAlignment.center,
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text("Submit")),
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text("Cancel")),
              ],
            ));
  }

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
                    "Login",
                    style: TextStyle(fontSize: 18, color: Colors.blue),
                  ),
                  SizedBox(height: 80),
                  MyTextFormField(
                    keyboardType: TextInputType.text,
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
                  Row(
                    children: [
                      Text("Dont have an account? "),
                      InkWell(
                        child: Text(
                          "Register",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.blue),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterScreen(),
                              ));
                        },
                      )
                    ],
                  ),
                  SizedBox(height: 80),
                  MyButton(
                    title: "Login",
                    icon: Icons.login,
                    onPressed: () {
                      if (formKey.currentState?.validate() ?? false) {
                        formKey.currentState?.save();
                        showMyDialog();
                        //! SNACKBAR
                        // showMySnackBar( context, "Login Successufly");
                        log("Email: $email , Password: $password");
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
