import 'package:flutter/material.dart';

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

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //!1
          Container(
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
            width: 150,
            height: 150,
            child: Center(
              child: Text(
                "Hello World!",
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
          //! 2
          Container(
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
            width: 150,
            height: 150,
            child: Center(
              child: Text(
                "hey Flutter!",
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
        ],
      ),
    ));
  }
}

//TODO:  widgets => no child widget => text , one child widget , more one child (List<Widgets>) => Column , row

//TODO:  widgets can be =>  text , image , audio , video , circle , every thing

//! Task 
//TODO:  MyApp , MaterialApp , Scaffold , Text , Center , Container , Align , Column , MainAxisAlignment. [(center=> (0,0)) (spaceAround 1 - 2 - 1)  (spaceEvenly 1 - 1 - 1)  (spaceBetween (center spcae))]  , Row , SizedBox


//TODO:  naming in flutter => variables => homeScreen , class(Widgets) => HomeScreen  , files => home_screen