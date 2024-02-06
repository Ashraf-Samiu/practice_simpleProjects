// Description :
// 1. Must be designed with an appBar
// whose height is 100 and elevation is 70 with 2 icons.
// One icon is on the left side and the other one is on the
// right side of appBar. Title will be the center position
// of the app bar. And the background color is green.

// 2. In the body, set the text as given the figure.
// [please be careful for the 2nd sentence,
// must follow the figure for design].

import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  mySnackBar(message,context){
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message))
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: const Icon(
            Icons.home,
            size: 30,
        ),
        title: const Text(
          "Home",
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold
          ),
        ),
        toolbarHeight: 100,
        centerTitle: true,
        elevation: 70,
        actions: [
          IconButton(onPressed: (){
            mySnackBar("Pressed on Search Button", context);
          }, icon: const Icon(Icons.search))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "This is Basic Practice Project!",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            RichText(text: const TextSpan(
                text: "My ",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.red
                ),
                children: [
                  TextSpan(
                      text: "Name ",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      )
                  ),
                  TextSpan(
                    text: "is ",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple
                    ),
                  ),
                  TextSpan(
                      text: "Md Ashraf Hossain Samiu",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.amber
                      )
                  )
                ]
            ))
          ],
        ),
      ),
    );
  }
}


