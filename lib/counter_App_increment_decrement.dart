// Create a Flutter screen that initially displays a count of 0.
// The screen should have two buttons: one labeled "+" and the other labeled "-".
// Requirements:
//
// Tapping the "+" button should increase the count by 1.
//
// Tapping the "-" button should decrease the count by 1,
// but the count should not go below 0.
//
// If the count reaches 5 or more,
// a dialog should appear with the message:
// "Button pressed {count} times."

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int count= 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Count:",
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            Text("$count",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: (){
                  count++;
                  if(count>=5){
                    showDialog(context: context,
                        builder: (context){
                          return AlertDialog(
                            content: Text("Button Pressed $count times"),
                            actions: [
                              TextButton(onPressed: (){
                                Navigator.pop(context);
                              },child: Text("Close"))
                            ],
                          );
                        }
                    );
                  }
                  setState(() {});
                }, child: Icon(Icons.add)),
                SizedBox(
                  width: 15,
                ),
                ElevatedButton(onPressed: (){
                  if(count>0){
                    count--;
                  }
                  setState(() {});
                }, child: Icon(CupertinoIcons.minus)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
