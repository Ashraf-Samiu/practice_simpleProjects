///Flutter Intro Practice Project
import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}
class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.account_circle,
              color: Colors.green,
              size: 50,
            ),
            Text("John Doe",
              style: TextStyle(
                color: Colors.green,
                fontSize: 30,
              ),
            ),
            Text("Flutter Developer",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 20
              ),
            )
          ],
        ),
      ),
    );
  }
}
