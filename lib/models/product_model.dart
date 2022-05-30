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


  List<Product> producList = [
    Product(title: 'PetVogue Classic \nCosy Sweater', img: '', price: 2.57),
    Product(title: 'Sage Reversible \nSided Coat', img: '', price: 2.17),

  ];

}