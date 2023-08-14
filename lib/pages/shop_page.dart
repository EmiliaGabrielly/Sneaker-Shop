import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shop/models/cart.dart';
import 'package:sneaker_shop/models/shoe.dart';
import '../components/shoe_tiler.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  void addShoeToCart (Shoe shoe) {
    Provider.of<Cart> (context, listen: false).addItenToCart(shoe);

    //alert the user, shoe sucessfully added 
    showDialog(context: context, 
     builder: (context) => AlertDialog (
      title: Text('Sucessfully added'),
      content: Text('Check your cart'),
     ),
   );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer <Cart> (
   builder: (context, value, child) => Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 25.0, ),
          decoration: BoxDecoration(color: Colors.grey[200],
           borderRadius: BorderRadius.circular(0),
           ),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Search',
              style: TextStyle(color: Colors.grey) ,
              ),
              Icon(
                Icons.search),
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 25),
          child: Text (
            'everyone flies.. some fly longers than others',
            style: TextStyle(color: Colors.grey[600],),
            ),
        ),
        
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'hot picks ', 
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
               ),
        
                Text('See all',
                style: TextStyle(
                  fontWeight: FontWeight.bold, 
                  color: Colors.blue,
                ),
               ),       
            ],
          ),
        ),

        const SizedBox(height: 10),

        //list shoes for sale 
        Expanded(child: ListView.builder(
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          itemBuilder:(context, index) {

            //get a shoe from shop list
            Shoe shoe = value.getShoeList () [index];

            //return the shoe 
            return ShoeTiler (
              shoe: shoe,
              onTap: () => addShoeToCart(shoe),
            );
          }
        ),
      ),

        const Padding(
        padding:  EdgeInsets.only(top: 25.0, left: 25, right: 25),
        child: Divider(
          color: Colors.white,
          ),
        ),
       ],
      )
    );    
  }
}