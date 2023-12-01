import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery/models/cart_model.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text('My Cart '),
        centerTitle: true,
      ),
      body: Consumer<CartModel>(builder: (context, value, child){
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text('My Cart',
              textAlign: TextAlign.center,
              style: GoogleFonts.notoSerif(
                fontSize:35,
                fontWeight: FontWeight.bold,
                ),
              ),
            ),
          Expanded(
            child: ListView.builder(
              itemCount: value.cartItems.length,
              padding: const EdgeInsets.all(12),
              itemBuilder: (context, index){
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ListTile(
                      leading: Image.asset(value.cartItems[index][2],height: 36,),
                      title:Text(value.cartItems[index][0]),
                      subtitle: Text('\$' + value.cartItems[index][1]),
                      trailing: IconButton(
                        icon: const Icon(Icons.cancel),
                        onPressed: () =>Provider.of<CartModel>(context, listen: false)
                        .removeItemFromCart(index),
                      ),
                    ),
                  ),
                );
              })),

              //total + pay now.
              Padding(
                padding: const EdgeInsets.all(36.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(12)
                  ),
                  padding: const EdgeInsets.all(24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children:[
                          const Text('Total Price',
                          style: TextStyle(
                            color: Color.fromARGB(255, 206, 243, 207)
                          )
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text('\$' +' '+ value.calculateTotalPrice(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18
                          ),
                          )
                        ],
                      ),
                        //pay now 
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green.shade100),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const  EdgeInsets.all(12),
                    child: const Row(
                      children: [
                          Text('Pay Now',
                        style: TextStyle(
                          color: Colors.white,
                          
                        ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: Colors.white,
                        )
                      ],
                    ),
              )
                    ],
                  ),
                ),
              ),
             
        ],
      );
      },)
    );
  }
}