import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery/componets/grocery_item_tile.dart';
import 'package:grocery/models/cart_model.dart';
import 'package:grocery/pages/cart_page.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed:() => Navigator.push(context, MaterialPageRoute(builder: (context){
          return CartPage();
        },),),
        backgroundColor: Colors.black,
        child:Icon(Icons.shopping_bag),
         ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          const  SizedBox(
              height: 50,
            ),
            //good morning
          const Padding(
              padding:  EdgeInsets.symmetric(horizontal: 25),
              child: Text('Good Morning, '),
            ),
            //let's order fress items
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:25.0, vertical: 5),
              child: Text("Let's Order fresh items for you.",
              
              style: GoogleFonts.notoSerif(
                fontSize:35,
                fontWeight: FontWeight.bold,
                ),),
            ),
            //divider
            const Padding(
              padding:  EdgeInsets.symmetric(horizontal:25.0),
              child: Divider(
                
              ),
            ),
            //fresh items + grid
            const SizedBox(
              height: 24,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal:25.0),
              child: Text('Fresh items',
              style: TextStyle(
                fontSize: 16
              ),
              ),
            ),
            //Grid
            Expanded(
              child: Consumer<CartModel>(
                builder: (context, value, child) {
                  return GridView.builder(
                    itemCount: value.shopeItem.length,
                    padding: const EdgeInsets.all(12),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1/1.3
                      ),
                    itemBuilder: (context, index) {
                      // Access list elements using square brackets
                      List<dynamic> currentItem = value.shopeItem[index];
                      return GroceryItemTile(
                        itemName: currentItem[0],
                        itemPrice: currentItem[1],
                        imagePath: currentItem[2],
                        color: currentItem[3],
                        onPressed:() {
                          Provider.of<CartModel>(context, listen: false)
                          .addItemToCart(index);
                        }
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}