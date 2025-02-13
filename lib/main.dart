import 'package:flutter/material.dart';
import 'package:flutter_course_for_beginners_msc/images.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

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

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(ImageManager.flutterBird, width: 200, height: 200),
          Container(
            color: Colors.amber,
            height: 400,
            width: 300,
            child: Stack(
              children: [
                Positioned(
                  top: 158,
                  left: 13,
                  child: Container(
                    width: 250,
                    height: 80,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
                Positioned(
                  top: 160,
                  left: 10,
                  child: Container(
                    width: 250,
                    height: 80,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
                Positioned(
                    top: 100,
                    child: Image.asset(ImageManager.jetPack,
                        width: 150, height: 150)),
                Positioned(
                  top: 190,
                  right: 55,
                  child: Text(
                    "Cross Platform",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Image.asset(ImageManager.android, width: 200, height: 200),
          Image.asset(ImageManager.bloC, width: 200, height: 200),
          Image.network(
            ImageManager.flutterNetworkImage,
          ),
          Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(20),
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(30),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                  ImageManager.flutterBirdNetwork,
                ),
              ),
            ),
            child: Text(
              "Hello",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //!1
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue,
                      width: 3,
                    ),
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: 150,
                  child: Center(
                    child: Visibility(
                      visible: true,
                      child: Text(
                        "A",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 32,
                          color: Colors.blue,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.italic,
                          decoration: TextDecoration.underline,
                          decorationThickness: 2,
                          decorationColor: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              //! 2
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue,
                      width: 3,
                    ),
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: 150,
                  child: Center(
                    child: Text(
                      "B",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.italic,
                        decoration: TextDecoration.underline,
                        decorationThickness: 2,
                        decorationColor: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}



//TODO:[Widgets] => Expanded (Column, Row) , Visibility , Wrap , Stack , Positioned , Icon
//TODO:  Image.asset , Image.network , DecorationImage (Container) , ImageProvider 