//Create a single page that displays a list of items.
//An app bar titled "My Shopping List.", with a cart icon.
/* A list of at least 5 shopping items displayed using
  ListTile widgets.*/
/* Each item should have an icon (use any icon) and a name
  (name of any object). Apply suitable styling for visual appeal.*/

import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
class HomeScreen extends StatelessWidget{
  List<String> fruits= [
    "Apples",
    "Bananas",
    "Bread",
    "Milk",
    "Eggs"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Shopping List"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart))
        ],
      ),
      body: ListView.builder(
          itemCount: fruits.length,
          itemBuilder: (context,index){
            return ListTile(
              leading: Icon(Icons.shopping_bag),
              title: Text(fruits[index]),
            );
          }),
    );
  }
}