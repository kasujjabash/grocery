import 'package:flutter/material.dart';

class GroceryItemTile extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final String imagePath;
  final color;
  void Function()? onPressed;
  
  GroceryItemTile({super.key, 
  required this.itemName, 
  required this.itemPrice, 
  required this.imagePath, 
  required this.color,
  required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          color: color[100],
          borderRadius: BorderRadius.circular(12)
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //image
              Image.asset(imagePath, height: 64,),
              //itemName
              Text(itemName),
              //price + button
              MaterialButton(
                onPressed:(onPressed),
                color: color,
                child: Text('\$' + itemPrice,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                ),
                )
            ],
          ),
        ),
      ),
    );
  }
}