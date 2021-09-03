import 'package:flutter/material.dart';

class Product{
  final int id;
  final String name;
  final String imageUrl;
  final double price;
  final int quantity;

  Product({@required this.id, @required this.name, @required this.imageUrl, @required this.price, this.quantity = 1});

}