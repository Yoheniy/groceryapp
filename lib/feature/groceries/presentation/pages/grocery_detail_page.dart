import 'package:flutter/material.dart';
import 'package:grocessary/feature/groceries/domain/entity/groceryItem_entity.dart';
import 'package:grocessary/feature/groceries/presentation/pages/grocery_cart_page.dart';

class GroceryDetailPage extends StatelessWidget {
  final GroceryItemEntity selectedGrocery; // Named parameter

  const GroceryDetailPage({Key? key, required this.selectedGrocery}) : super(key: key); // Constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Stack(
              children: [
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      image: NetworkImage(selectedGrocery.imageUrl), // Use imageUrl
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 16,
                  left: 16,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context); // This will pop back to the previous screen
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.arrow_back, color: Colors.black),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 16,
                  right: 16,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.favorite_border,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              selectedGrocery.title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "\$${(selectedGrocery.price - selectedGrocery.discount).toStringAsFixed(2)}", // Use discounted price
              style: TextStyle(
                fontSize: 20,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    SizedBox(width: 5),
                    Text(
                      "${selectedGrocery.rating} (1,205)", // Use rating
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "See all reviews",
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              selectedGrocery.description, // Use description
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 16),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "See more",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Additional Options:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Column(
              children: selectedGrocery.options.map((option) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(option.name), // Use option name
                  Row(
                    children: [
                      Text("+ \$${option.price.toStringAsFixed(2)}"), // Use option price
                      Checkbox(
                        value: false, // Placeholder for actual value
                        onChanged: (bool? value) {
                          // Handle checkbox change
                        },
                      ),
                    ],
                  ),
                ],
              )).toList(),
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              height: 77,
              padding: EdgeInsets.only(left: 8, right: 16),
              decoration: BoxDecoration(color: Color.fromARGB(255, 254, 254, 254)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      height: 60,
                      width: 160,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () {
                              // Decrease quantity logic
                            },
                          ),
                          Text(
                            "1", // Placeholder for actual quantity
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {
                              // Increase quantity logic
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 60,
                    width: 190,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GroceryCartPage(),
                          ),
                        );
                      },
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.shopping_cart, color: Colors.white),
                            SizedBox(width: 8),
                            Text(
                              "Add to Basket",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
