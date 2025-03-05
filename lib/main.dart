import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_course_for_beginners_msc/images.dart';
import 'package:flutter_course_for_beginners_msc/signup.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.blue,
              primary: Colors.blue,
              onPrimary: Colors.blue)),
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                "Welcome Back!",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 100),
              // Very Important
              buildTextField(
                  label: "Email",
                  hintText: "example@kh.co",
                  iconData: Icons.email,
                  controller: emailController),
              SizedBox(height: 30),
              buildTextField(
                label: "Password",
                hintText: "password",
                iconData: Icons.lock,
                controller: passwordController,
                obscureText: true,
              ),
              SizedBox(height: 50),
              buildFormButton(
                  title: "Login",
                  onPressed: () {
                    final email = emailController.text;
                    final password = passwordController.text;
                    log("Email is: ${email} , password is: ${password}");
                  }),

              SizedBox(height: 50),

              Row(
                children: [
                  Text("Dont have and Account, "),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => SignUpScreen(),));
                    },
                    child: Text(
                      "Sign Up",
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
  }) {
    return TextField(
      obscureText: obscureText == true ? isVisible : false,
      controller: controller,
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

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   bool isDarkMode = false;
//   int counter = 0;
//   bool isHover = false;
//   int rorateValue = 0;
//   double size = 25;
//   bool isVisible = true;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Welcome"),
//         backgroundColor: isDarkMode ? Colors.blue : Colors.yellow,
//         centerTitle: true,
//         leading: IconButton(
//           onPressed: () {
//             isDarkMode = !isDarkMode;
//             setState(() {});
//           },
//           icon: Icon(
//             isDarkMode ? Icons.dark_mode : Icons.light_mode,
//             color: isDarkMode ? Colors.white : Colors.black,
//           ),
//         ),
//       ),
//       backgroundColor: isDarkMode ? Colors.black : Colors.white,
//       body: SizedBox(
//         width: double.infinity,
//         height: double.infinity,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Visibility(visible: isVisible, child: Text("Hello World")),
//             const SizedBox(height: 10),
//             Offstage(offstage: !isVisible, child: Text("Hello World")),
//             const SizedBox(height: 30),
//             InkWell(
//               onTap: () {
//                 isVisible = !isVisible;
//                 setState(() {});
//               },
//               child: Card(
//                 margin: EdgeInsets.zero,
//                 color: Colors.yellow,
//                 shape: BeveledRectangleBorder(),
//                 child: Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
//                   child: Text("Hide"),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 30),
//             RotatedBox(
//                 quarterTurns: rorateValue,
//                 child: Icon(
//                   Icons.arrow_back,
//                   size: size,
//                 )),
//             const SizedBox(height: 30),
//             IconButton(
//               onPressed: () {
//                 rorateValue++;
//                 if (size < 60) {
//                   size++;
//                 }
//                 setState(() {});
//               },
//               icon: Icon(Icons.rotate_90_degrees_ccw),
//             ),
//             const SizedBox(height: 30),
//             Text(
//               counter.toString(),
//               style: TextStyle(
//                   fontSize: 38,
//                   fontWeight: FontWeight.w600,
//                   color: isDarkMode ? Colors.white : Colors.black),
//             ),
//             const SizedBox(height: 30),
//             ElevatedButton(
//               onLongPress: () {
//                 setState(() {
//                   counter += 3;
//                 });
//               },
//               onHover: (val) {
//                 isHover = val;
//                 setState(() {});
//               },
//               onPressed: () {
//                 setState(() {
//                   counter++;
//                 });
//               },
//               style: ElevatedButton.styleFrom(
//                   backgroundColor: isDarkMode ? Colors.blue : Colors.yellow,
//                   fixedSize: Size(300, 45),
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                       side: BorderSide(
//                         color: Colors.black,
//                       )),
//                   elevation: 10,
//                   overlayColor: Colors.red,
//                   foregroundColor: Colors.black),
//               child: Text(
//                 "Increase (1)",
//                 style: TextStyle(
//                   color: isHover ? Colors.red : Colors.black,
//                 ),
//               ),
//             ),
//             SizedBox(height: 30),
//             OutlinedButton(
//                 onPressed: () {
//                   counter = 0;
//                   setState(() {});
//                 },
//                 child: Text("Reset"))
//           ],
//         ),
//       ),
//     );
//   }
// }

// MaterialButton , OutlinedButton , IconButton , TextButton , ElevatedButton , GestureDetector , Inkwell

/*
style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  isDarkMode ? Colors.blue : Colors.yellow,
                ),
                fixedSize: WidgetStatePropertyAll(Size(300, 45)),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(
                        color: Colors.black,
                      )),
                ),
                elevation: WidgetStatePropertyAll(10),
                overlayColor: WidgetStatePropertyAll(Colors.red),
                foregroundColor: WidgetStatePropertyAll(Colors.black),
              ),
 */

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SizedBox(
//       width: double.infinity,
//       height: double.infinity,
//       child: Stack(
//         alignment: Alignment.center,
//         children: [
//           //* green
//           Positioned(
//             top: 100,
//             right: 20,
//             child: Container(
//               padding: EdgeInsets.all(10),
//               margin: EdgeInsets.all(10),
//               decoration: BoxDecoration(
//                 border: Border.all(
//                   color: Colors.blue,
//                   width: 3,
//                 ),
//                 color: Colors.green,
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               width: 150,
//               height: 150,
//               child: Center(
//                 child: Text(
//                   "hey Flutter!",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 32,
//                     color: Colors.black,
//                     fontWeight: FontWeight.w700,
//                     fontStyle: FontStyle.italic,
//                     decoration: TextDecoration.underline,
//                     decorationThickness: 2,
//                     decorationColor: Colors.black,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           //! Red
//           Positioned(
//             left: 20,
//             top: 100,
//             child: Container(
//               padding: EdgeInsets.all(10),
//               margin: EdgeInsets.all(10),
//               decoration: BoxDecoration(
//                 border: Border.all(
//                   color: Colors.blue,
//                   width: 3,
//                 ),
//                 color: Colors.red,
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               width: 150,
//               height: 150,
//               child: Center(
//                 child: Text(
//                   "hey Flutter!",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 32,
//                     color: Colors.black,
//                     fontWeight: FontWeight.w700,
//                     fontStyle: FontStyle.italic,
//                     decoration: TextDecoration.underline,
//                     decorationThickness: 2,
//                     decorationColor: Colors.black,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Positioned(
//             left: 135,
//             top: 120,
//             child: Container(
//               decoration:
//                   BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
//               width: 30,
//               height: 30,
//               child: Center(
//                 child: Icon(
//                   Icons.add,
//                   color: Colors.white,
//                   size: 25,
//                 ),
//               ),
//             ),
//           ),
//           // Yellow
//           Positioned(
//             right: 20,
//             top: 300,
//             child: Container(
//               padding: EdgeInsets.all(10),
//               margin: EdgeInsets.all(10),
//               decoration: BoxDecoration(
//                 border: Border.all(
//                   color: Colors.blue,
//                   width: 3,
//                 ),
//                 color: Colors.amber,
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               width: 150,
//               height: 150,
//               child: Center(
//                 child: Text(
//                   "hey Flutter!",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 32,
//                     color: Colors.black,
//                     fontWeight: FontWeight.w700,
//                     fontStyle: FontStyle.italic,
//                     decoration: TextDecoration.underline,
//                     decorationThickness: 2,
//                     decorationColor: Colors.black,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     ));
//   }
// }

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SingleChildScrollView(
//       scrollDirection: Axis.vertical,
//       child: Column(
//         spacing: 10,
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Image.asset(ImageManager.flutterBird, width: 200, height: 200),
//           Container(
//             color: Colors.amber,
//             height: 400,
//             width: 300,
//             child: Stack(
//               children: [
//                 Positioned(
//                   top: 158,
//                   left: 13,
//                   child: Container(
//                     width: 250,
//                     height: 80,
//                     decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(30)),
//                   ),
//                 ),
//                 Positioned(
//                   top: 160,
//                   left: 10,
//                   child: Container(
//                     width: 250,
//                     height: 80,
//                     decoration: BoxDecoration(
//                         color: Colors.blue,
//                         borderRadius: BorderRadius.circular(30)),
//                   ),
//                 ),
//                 Positioned(
//                     top: 100,
//                     child: Image.asset(ImageManager.jetPack,
//                         width: 150, height: 150)),
//                 Positioned(
//                   top: 190,
//                   right: 55,
//                   child: Text(
//                     "Cross Platform",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Image.asset(ImageManager.android, width: 200, height: 200),
//           Image.asset(ImageManager.bloC, width: 200, height: 200),
//           Image.network(
//             ImageManager.flutterNetworkImage,
//           ),
//           Container(
//             margin: EdgeInsets.all(20),
//             padding: EdgeInsets.all(20),
//             width: 200,
//             height: 200,
//             decoration: BoxDecoration(
//               color: Colors.red,
//               borderRadius: BorderRadius.circular(30),
//               image: DecorationImage(
//                 fit: BoxFit.fill,
//                 image: NetworkImage(
//                   ImageManager.flutterBirdNetwork,
//                 ),
//               ),
//             ),
//             child: Text(
//               "Hello",
//               textAlign: TextAlign.center,
//               style: TextStyle(color: Colors.white),
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               //!1
//               Expanded(
//                 flex: 1,
//                 child: Container(
//                   padding: EdgeInsets.all(10),
//                   margin: EdgeInsets.all(10),
//                   decoration: BoxDecoration(
//                     border: Border.all(
//                       color: Colors.blue,
//                       width: 3,
//                     ),
//                     color: Colors.red,
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   height: 150,
//                   child: Center(
//                     child: Visibility(
//                       visible: true,
//                       child: Text(
//                         "A",
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontSize: 32,
//                           color: Colors.blue,
//                           fontWeight: FontWeight.w700,
//                           fontStyle: FontStyle.italic,
//                           decoration: TextDecoration.underline,
//                           decorationThickness: 2,
//                           decorationColor: Colors.blue,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               //! 2
//               Expanded(
//                 flex: 2,
//                 child: Container(
//                   padding: EdgeInsets.all(10),
//                   margin: EdgeInsets.all(10),
//                   decoration: BoxDecoration(
//                     border: Border.all(
//                       color: Colors.blue,
//                       width: 3,
//                     ),
//                     color: Colors.amber,
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   height: 150,
//                   child: Center(
//                     child: Text(
//                       "B",
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontSize: 32,
//                         color: Colors.black,
//                         fontWeight: FontWeight.w700,
//                         fontStyle: FontStyle.italic,
//                         decoration: TextDecoration.underline,
//                         decorationThickness: 2,
//                         decorationColor: Colors.black,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     ));
//   }
// }
//

//TODO:[Widgets] => Expanded (Column, Row) , Visibility , Wrap , Stack , Positioned , Icon
//TODO:  Image.asset , Image.network , DecorationImage (Container) , ImageProvider
