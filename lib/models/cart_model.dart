import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier{
final List _shopItems = [
  //[itemName, ItemPrice, ImagePath, color]
  ["Avacado", "4.0", "lib/images/ovacado.jpeg" , Colors.green],
  ["Banana", "3.5", "lib/images/banana.jpeg", Colors.yellow],
  ["Chicken", "12.0", "lib/images/chicken.jpeg", Colors.brown],
  ["Water", "2.65", "lib/images/water.jpeg", Colors.blue],
];

//List of cart items
List _cartItems = [];

get shopeItem => _shopItems;

get cartItems => _cartItems;

//add items to cart
void addItemToCart(int index){
  _cartItems.add(_shopItems[index]);
  notifyListeners();
}

//remove items to cart
void removeItemFromCart(int index){
  _cartItems.remove(index);
  notifyListeners();
}
//calculate total price
String calculateTotalPrice(){
  double totalPrice = 0; 
  for (int i = 0; i < _cartItems.length; i++){
    totalPrice += double.parse(_cartItems[i][1]);
  }
  return totalPrice.toStringAsFixed(2);
}
}