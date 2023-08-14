import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shop/models/cart.dart';

import '../components/cart_item.dart';
import '../models/shoe.dart';

class CartPage extends StatelessWidget {
  const CartPage ({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer <Cart> (builder: (context, value, child) => 
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(' My cart',
          style:  TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
          ),
            const SizedBox(height: 25),

            //get individual shoe
            Expanded(child: ListView.builder(
              itemCount: value.getUserCart().length,
              itemBuilder: (context, index) {
              Shoe individualShoe = value.getUserCart()[index];

            //return the cart item
              return CartItem (shoe: individualShoe,);
            },
          ),     
         ),
        ],
       ),
     ),
    );
  }
}