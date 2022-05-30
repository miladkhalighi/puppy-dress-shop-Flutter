import 'package:flutter/material.dart';

class Product {
  String title;
  String img;
  double price;

  Product({
    required this.title,
    required this.img,
    required this.price,
  });

}

List<Product> productList = [
  Product(title: 'PetVogue Classic \nCosy Sweater', img: 'assets/images/dog-blue.png', price: 2.57),
  Product(title: 'Sage Reversible \nSided Coat', img: 'assets/images/dog-yellow.png', price: 2.17),
  Product(title: 'PetVogue Classic \nCosy Sweater', img: 'assets/images/dog-blue.png', price: 2.57),
  Product(title: 'Sage Reversible \nSided Coat', img: 'assets/images/dog-yellow.png', price: 2.17),

];