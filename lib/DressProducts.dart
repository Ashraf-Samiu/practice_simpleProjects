//On pressing the + and - icons:
// The no of item will increase/decrease
// Total amount will be the calculated according
// to the number of items and unit price
// If any item is added 5 units a dialog will appear
// with the message “You have added 5 $itemName on your bag!”
// On pressing CHECK OUT a snackBar will appear
// with a congratulating message.
// Don’t need to implement any other click events.
// The design must be responsive.

import 'package:flutter/cupertino.dart';
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
class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}
class HomeScreenState extends State<HomeScreen>{
  List<String> images= [
    "https://cdn.pixabay.com/photo/2022/09/23/05/22/winter-7473671_1280.jpg",
    "https://cdn.pixabay.com/photo/2016/03/25/09/04/t-shirt-1278404_1280.jpg",
    "https://cdn.pixabay.com/photo/2016/04/24/21/29/football-1350720_1280.jpg"
  ];
  List<String> titles = ["Pullover", "T-Shirt", "Sport Dress"];
  List<String> colors = ["Black", "Grey", "Red"];
  List<String> sizes = ["L", "M", "L"];
  List<int> prices = [51, 30, 43];
  List<int> itemCounts= [1,1,1];/// Count for each item individually
  void onPressedIncrement(int index){
    itemCounts[index]++;
    if(itemCounts[index]==5){
      showAlertDialog(titles[index]);
    }
    setState(() {});
  }

  void onPressedDecrement(int index){
    if(itemCounts[index]>1){
      itemCounts[index]--;
    }
    setState(() {});
  }

  void showAlertDialog(String itemName){
    showDialog(context: context, builder: (context){
      return AlertDialog(
        title: const Center(child: Text("Congratulations!")),
        content: Text("You have added 5 $itemName on your bag"),
        actions: [
          Center(
            child: ElevatedButton(onPressed: (){
              Navigator.pop(context);
            }, style: ElevatedButton.styleFrom(
              minimumSize: const Size(200, 30),
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)
              ),
            ), child: const Text("OKAY"),
            ),
          )
        ],
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    int totalPrice= 0;
    for(int i=0;i<prices.length; i++) {
      totalPrice += prices[i]*itemCounts[i];
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.search,color: Colors.black,))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("My Bag",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
                flex: 6,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: images.length,
                    itemBuilder: (context,index){
                      return Card(
                        child: Row(
                          children: [
                            SizedBox(
                              height: 120,
                              child: Image.network(
                                images[index],
                                width: 115,
                                height: 120,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Expanded(
                                child: Column(
                                  children: [
                                    ListTile(
                                      title: Text(titles[index],
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600
                                        ),
                                      ),
                                      subtitle: Row(
                                        children: [
                                          const Text("Color: "),
                                          Text(colors[index],
                                            style: const TextStyle(
                                                color: Colors.black45,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                          const SizedBox(width: 6),
                                          const Text("Size: "),
                                          Text(
                                            sizes[index],
                                            style: const TextStyle(
                                                color: Colors.black45,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold
                                            ),
                                          )
                                        ],
                                      ),
                                      trailing: const Icon(Icons.more_vert),
                                    ),
                                    Row(
                                      children: [
                                        const SizedBox(width: 10),
                                        FloatingActionButton(
                                          backgroundColor: Colors.white,
                                          foregroundColor: Colors.black,
                                          mini: true,
                                          onPressed: (){
                                            onPressedIncrement(index);
                                          },child: const Icon(Icons.add),
                                        ),
                                        const SizedBox(width: 10),
                                        Text("${itemCounts[index]}",
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        FloatingActionButton(
                                          backgroundColor: Colors.white,
                                          foregroundColor: Colors.black,
                                          mini: true,
                                          onPressed: (){
                                            onPressedDecrement(index);
                                          },child: const Icon(CupertinoIcons.minus),
                                        ),
                                        Expanded(child: ListTile(
                                          trailing: Text("${prices[index]*itemCounts[index]}\$",
                                            style: const TextStyle(
                                                fontSize: 15,
                                                color: Colors.black
                                            ),
                                          ),
                                        ))
                                      ],
                                    )
                                  ],
                                )
                            )
                          ],
                        ),
                      );
                    }
                )
            ),
            Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ListTile(
                      subtitle: const Text("Total Amount: "),
                      trailing: Text("$totalPrice\$"),
                    ),
                    ElevatedButton(onPressed: (){
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Congratulations! Your Order has been Placed"))
                      );
                    }, style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)
                        )),child: const Text("CHECK OUT"),
                    ),
                  ],
                )
            )
          ],
        ),
      ),
    );
  }
}