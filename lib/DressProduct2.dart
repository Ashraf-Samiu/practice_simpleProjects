import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ShoppingCartScreen(),
    );
  }
}

class Database{
  List<Map<String,dynamic>> items= [
    {
      "name":"pullover",
      "color": "Black",
      "size": "L",
      "price": 10.00,
      "quantity": 1,
      "image": 'https://assets.ajio.com/medias/sys_master/root/20230624/cog9/6496592feebac147fcf098ea/-473Wx593H-465330195-green-MODEL.jpg',
    },
    {
      "name":"Shirt",
      "color": "Blue",
      "size": "M",
      "price": 20.00,
      "quantity": 1,
      "image": 'https://images.bestsellerclothing.in/data/selected/21-oct-2023/122003001_g1.jpg?width=415&height=550&mode=fill&fill=blur&format=auto',
    },
    {
      "name":"pullover",
      "color": "Black",
      "size": "S",
      "price": 15.00,
      "quantity": 1,
      "image": 'https://m.media-amazon.com/images/I/71R7b4Fu8ML._AC_UY1100_.jpg',
    }
  ];
}
class ShoppingCartScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ShoppingCartScreenState();
  }
}
class ShoppingCartScreenState extends State<ShoppingCartScreen>{
  int quantity= 1;
  int maxQuantity= 5;
  Database database= Database();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("My Bag",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold
          ),
        ),
        actions: [
          IconButton(onPressed: (){},icon: Icon(
            Icons.search, color: Colors.black,)
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Expanded(
                child: ListView.builder(
                  itemCount: database.items.length,
                    itemBuilder:(context,index){
                      return buildCartItem(database.items[index]);
                    })
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Total Amount: \$${(database.items.fold<double>(0, (total, item) => total + item['price'] * item['quantity'])).toStringAsFixed(2)}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: (){
                mySnackBar(context);
              },style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,vertical: 8
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ), child: Text("CHECK OUT",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),
                  ),
              ),
            )
          ],
        ),
      ),
    );
  }
  ///SnackBar method
  mySnackBar(context){
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Congratulations! Your order has been placed"))
    );
  }
  ///AlertDialog
  showDialogue(){
    return showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text("Congratulations!",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green
              ),
            ),
            content: Text(
              "You have added 5 items to your bag!",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black
              ),
            ),
            actions: [
              Center(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(10)
                  ),child: TextButton(onPressed: (){
                    Navigator.of(context).pop();
                  }, child: Text("OKAY",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white
                    ),
                )),
                ),
              )
            ],
          );
        }
    );
  }

  ///cart items
  Widget buildCartItem(Map<String,dynamic> item){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
              item['image'],
              fit: BoxFit.fill,
              width: 100,
              height: 100,
          ),
          SizedBox(width: 16),
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item["name"],
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 8),
                  Text("Color: ${item["color"]}"),
                  SizedBox(height: 8),
                  Text("Size: ${item["size"]}"),
                  Row(
                    children: [
                      IconButton(onPressed: (){
                        if(item["quantity"]>1){
                          item['quantity']--;
                          setState(() {});
                        }
                      }, icon: Icon(Icons.remove)),
                      SizedBox(width: 8),
                      Text("${item["quantity"]}"),
                      SizedBox(width: 8),
                      IconButton(onPressed: (){
                        if(item["quantity"]< maxQuantity){
                          setState(() {});
                          item["quantity"]++;
                        }else{
                          showDialogue();
                        }
                      }, icon: Icon(Icons.add))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Total: \$${item["price"]*item["quantity"]}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                      )
                    ],
                  )
                ],
              )
          )
        ],
      ),
    );
  }
}
