// Create the following screen which rearranges its widgets
// while changing orientation.
// Use any image or icon as placeholders.

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
  List<String> images= [
    "https://cdn.pixabay.com/photo/2014/12/27/15/31/camera-581126_1280.jpg",
    "https://cdn.pixabay.com/photo/2014/12/27/15/31/camera-581126_1280.jpg",
    "https://cdn.pixabay.com/photo/2014/12/27/15/31/camera-581126_1280.jpg",
    "https://cdn.pixabay.com/photo/2014/12/27/15/31/camera-581126_1280.jpg",
    "https://cdn.pixabay.com/photo/2014/12/27/15/31/camera-581126_1280.jpg",
    "https://cdn.pixabay.com/photo/2014/12/27/15/31/camera-581126_1280.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: OrientationBuilder(
          builder: (context,orientation){
            return (orientation==Orientation.portrait)?
                buildPortraitScreen():
                buildLandScapeScreen();
          }),
    );
  }
  Widget buildPortraitScreen(){
    return Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 190,
              backgroundImage: NetworkImage(
                  "https://cdn.pixabay.com/photo/2016/01/09/18/27/camera-1130731_1280.jpg"
              ),
            ),
            Text("John Doe",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600
              ),
            ),
            Wrap(
              children: [
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit."),
                Text("Sed euismod mauris vel sem vulputate, eget efficitur justo efficitur.vehicula libero"),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: images.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 4,
                      mainAxisSpacing: 3
                  ),
                  itemBuilder: (context,index){
                    return Image.network(
                        images[index],
                        fit: BoxFit.cover
                    );
                  }),
            )
          ],
        )
    );
  }
  Widget buildLandScapeScreen(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 140,
          backgroundImage: NetworkImage(
              "https://cdn.pixabay.com/photo/2016/01/09/18/27/camera-1130731_1280.jpg"
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("John Doe",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Wrap(
                children: [
                  Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod"),
                  Text("vel sem vulputate, eget efficitur justo efficitur.")
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Expanded(
                child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: images.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5
                    ),
                    itemBuilder: (context,index){
                      return Image.network(
                        images[index],
                        fit: BoxFit.cover,
                      );
                    }),
                )
            ],
          ),
        ),
      ],
    );
  }
}