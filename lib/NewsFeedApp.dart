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
class HomeScreen extends StatelessWidget{
  var dummyImages = [
    "https://via.placeholder.com/150",
    "https://via.placeholder.com/150",
    "https://via.placeholder.com/150",
    "https://via.placeholder.com/150",
    "https://via.placeholder.com/150",
    "https://via.placeholder.com/150",
    "https://via.placeholder.com/150",
    "https://via.placeholder.com/150",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News Feed"),
      ),
      body: OrientationBuilder(builder: (context,orientation){
        return (orientation==Orientation.portrait)?
            buildPortraitLayOut():
            buildLandScapeLayout();
      }),
    );
  }
  Widget buildPortraitLayOut(){
    return ListView.builder(
      itemCount: dummyImages.length,
        itemBuilder: (context,index){
          return Card(
            child: Container(
              padding: EdgeInsets.all(8.0),
              child: Image.network(dummyImages[index]),
            ),
          );
        });
     }
     Widget buildLandScapeLayout(){
        return GridView.builder(
            itemCount: dummyImages.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount
              (crossAxisCount: 2),
              itemBuilder: (context,index){
                return Card(
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    child: Image.network(
                      dummyImages[index]
                    ),
                  ),
                );
              }
            );
      }
}
