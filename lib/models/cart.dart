 import 'package:flutter/material.dart';

import 'shoe.dart';
// list of shoes for sale 
class  Cart  extends ChangeNotifier {

  List <Shoe> sheShop = [
  Shoe (
  name: ' Air Zoom Blue    ',
  price: '   236 ' ,
  description: '  um tenis azul  ' ,
  imagePath: '  li/images/airzoomazul.jpg  ' , 
  ),
  Shoe(
    name: 'Arcobaleno ' , 
  price: '400', 
  description: '', 
  imagePath: 'lib/images/arcobaleno.jpg',
  ),
  Shoe(
    name:'CourtZoom' ,
    price: '250', 
    description: '',
    imagePath: 'lib/images/courtzoom.jpg',
    ),
  Shoe(
    name:'SB Force 58 Skate ' ,
    price: '280', 
    description: '',
    imagePath: 'lib/images/SBForce58Skate.jpg',
    ),
  Shoe(
    name:'Essential 007' ,
    price: '', 
    description: '',
    imagePath: 'lib/images/essential007.jpg',
    ),
];

 // lis of shoes itens user cart 
List <Shoe> userCart = [];

 // get list  of shoes for sale 
 List <Shoe> getShoeList() {
  return sheShop;
}

 // get cart
 List <Shoe> getUserCart (){
  return userCart;
 }

 //add itens to cart
void addItenToCart  (Shoe shoe) {
  userCart.add(shoe);
  notifyListeners();
 }

 // remove itens to cart 
void removeItenFromCart (Shoe shoe) {
  userCart.remove(shoe);
  notifyListeners();
}

}