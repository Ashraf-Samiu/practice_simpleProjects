// Create a Flutter app with the following features:
// - An app bar titled "Photo Gallery"
// - A scrollable view with a welcome message.
// - A text field.
// - A grid of at least 6 network images with captions.
/* - Each image triggers a snackBar when clicked,
     you can show any text on the message.*/
/* - Below the grid, a list of three sample photos
     with titles and subtitles.*/
/* - An upload button that shows the message
     “Photos Uploaded Successfully!” in a snackBar.*/
/* - Use any font style or icon size that makes the
     UI visually appealing.*/

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
  var photos = [
    {"image": "https://cdn.pixabay.com/photo/2020/06/12/22/04/lion-5292016_1280.jpg", "title": "Clicked on photo-1"},
    {"image": "https://cdn.pixabay.com/photo/2018/08/03/23/36/cat-3582978_1280.jpg", "title": "Clicked on photo-2"},
    {"image": "https://cdn.pixabay.com/photo/2013/10/09/02/26/cattle-192976_1280.jpg", "title": "Clicked on photo-3"},
    {"image": "https://cdn.pixabay.com/photo/2013/07/19/00/18/tiger-165189_1280.jpg", "title": "Clicked on photo-4"},
    {"image": "https://cdn.pixabay.com/photo/2017/10/20/10/58/elephant-2870777_1280.jpg", "title": "Clicked on photo-5"},
    {"image": "https://cdn.pixabay.com/photo/2021/01/28/03/13/person-5956897_1280.jpg", "title": "Clicked on photo-6"}
  ];
  mySnackBar(message,context){
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message))
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Photo Gallery"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Welcome to My Photo Gallery!",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.transparent,
                hintText: "Search for photos..",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            GridView.builder(
                shrinkWrap: true,
                itemCount: photos.length,
                gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8
                ),
                itemBuilder: (context,index){
                  return InkWell(
                    onTap: (){
                      mySnackBar(photos[index]["title"], context);
                    },
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.all(8),
                            padding: EdgeInsets.all(8),
                            width: double.infinity,
                            height: 300,
                            child: Image.network(
                              photos[index]["image"]!,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Text("Photo-$index")
                      ],
                    ),
                  );
                }),
              SizedBox(
                height: 10,
              ),
              Text("Sample Photos",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600
                ),
              ),
            SizedBox(
              height: 10,
            ),
            ListView(
              shrinkWrap: true,
              children: [
                ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                      "https://cdn.pixabay.com/photo/2016/11/18/17/20/living-room-1835923_1280.jpg"
                    ),
                  ),
                  title: Text("Photo-1"),
                  subtitle: Text("Description for Photo-1"),
                ),
                ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                        "https://cdn.pixabay.com/photo/2017/08/07/20/05/doctors-2607295_1280.jpg"
                    ),
                  ),
                  title: Text("Photo-2"),
                  subtitle: Text("Description for Photo-2"),
                ),
                ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                        "https://cdn.pixabay.com/photo/2017/08/06/22/01/books-2596809_1280.jpg"
                    ),
                  ),
                  title: Text("Photo-3"),
                  subtitle: Text("Description for Photo-3"),
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.upload),
          onPressed: (){
            mySnackBar("Photos Uploaded Successfully", context);
          }),
    );
  }
}