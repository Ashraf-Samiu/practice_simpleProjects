// Create a Flutter application that consists of the following:
// A stateful widget called ProductList that displays a list of products.
// Each product should have a name, price, and a "Buy Now" button.

// Implement a counter for each product that increments by 1
// every time the "Buy Now" button is pressed.

// When the counter for a product reaches 5,
// show a dialog box with the message "Congratulations!
// You've bought 5 {Product Name}!" Replace {Product Name}
// with the actual name of the product.

// Use the ListView widget to display the product list.

// Implement navigation to a new page called CartPage
// when the user presses a "Go to Cart" button.

// The CartPage should display the total number of products
// the user has bought.

import 'package:flutter/material.dart';

void main(){
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

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var products = [
    {"name": "Product 1", "price": "19.99", "count": "0"},
    {"name": "Product 2", "price": "29.99", "count": "0"},
    {"name": "Product 3", "price": "39.99", "count": "0"},
    {"name": "Product 4", "price": "49.99", "count": "0"},
    {"name": "Product 5", "price": "59.99", "count": "0"},
    {"name": "Product 6", "price": "69.99", "count": "0"},
    {"name": "Product 7", "price": "79.99", "count": "0"},
    {"name": "Product 8", "price": "89.99", "count": "0"},
    {"name": "Product 9", "price": "99.99", "count": "0"},
    {"name": "Product 10", "price": "109.99", "count": "0"},
    {"name": "Product 11", "price": "119.99", "count": "0"},
    {"name": "Product 12", "price": "129.99", "count": "0"},
  ];


  int count=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product List"),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context,index){
            return ListTile(
              title: Text(products[index]["name"]!),
              subtitle: Text(products[index]["price"]!),
              trailing: Column(
                children: [
                  Text("Counts: ${products[index]["count"]}"),
                  Expanded(
                    child: ElevatedButton(
                        onPressed: (){
                          int currentCount= int.parse(products[index]["count"]!);
                          currentCount++;
                          products[index]["count"]= currentCount.toString();
                          count++;
                          setState(() {});
                          if(count==5){
                            showDialog(context: context,
                                builder: (context){
                                  return AlertDialog(
                                    title: Text("Congratulations!"),
                                    content: Text("You've bought $count products"),
                                    actions: [
                                      TextButton(onPressed: (){
                                        Navigator.pop(context);
                                      }, child: Text("OK"))
                                    ],
                                  );
                              });
                          }
                    }, child: Text("Buy Now")),
                  ),
                ],
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.shopping_cart),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(
                builder: (context){
                  return CartPage(count: count);
                }));
          }),
    );
  }
}
class CartPage extends StatelessWidget{
  final int count;

  const CartPage({super.key,required this.count});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
        centerTitle: true,
      ),
      body: Center(
        child: Text("Total products: $count"),
      ),
    );
  }
}