import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String rating;
  final double price; // Use double for price
  final double? discount; // Optional discount parameter

  ProductCard({
    required this.imageUrl,
    required this.title,
    required this.rating,
    required this.price,
    this.discount, // Initialize discount
  });

  @override
  Widget build(BuildContext context) {
    // Check if discount is provided and if it is different from price
    bool showDiscount = discount != null && discount! < price;

    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber, size: 16),
                SizedBox(width: 4),
                Text(rating),
              ],
            ),
            if (showDiscount) ...[
              // Display original price with strikethrough and discounted price
              
              SizedBox(height: 4),
              Row(
                children: [
                  Text(
                "£${(price).toStringAsFixed(2)}", // Original price
                style: TextStyle(
                  decoration: TextDecoration.lineThrough,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
                  Text(
                    "£${(price - discount!).toStringAsFixed(2)}", // Discounted price
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red, // Color for discounted price
                    ),
                  ),
              //     Text(
              //   " £$price",
              //   style: TextStyle(
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
                ],
              ),
            ] else ...[
              // Display only the current price if no discount or discount equals price
              Text(
                " £$price",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ],
        ),
        Positioned(
          right: 8,
          top: 8,
          child: Container(
            width: 26,
            height: 26,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              color: Colors.white,
            ),
            child: Icon(
              Icons.favorite_border,
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}
