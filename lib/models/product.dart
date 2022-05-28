import 'package:flutter/material.dart';

class Product {
  final String image, title;
  final int price;
  final Color bgcolor;

  Product(
      {required this.image,
      required this.title,
      required this.price,
      this.bgcolor = const Color(0xFFEFEFF2)});
}

List<Product> demo_product = [
  Product(
    image: "assets/images/product_0.png",
    title: "Long Shirts",
    price: 120,
    bgcolor: const Color(0xFFFEFBF9),
  ),
  Product(
    image: "assets/images/product_1.png",
    title: "Casual Shirts",
    price: 99,
  ),
  Product(
    image: "assets/images/product_2.png",
    title: "Curved Shirts",
    price: 199,
    bgcolor: const Color(0xFFF8FEFB),
  ),
  Product(
    image: "assets/images/product_0.png",
    title: "Casual Nolin",
    price: 149,
    bgcolor: const Color(0xFFEEEEED),
  ),
];
