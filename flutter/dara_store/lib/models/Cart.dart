// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

import '../repo.dart';
import 'Product.dart';

class Cart {
  final Product product;
  int numOfItem;
  int userId;
  Product getById(int id){
    Product product= Product(
    id: 1,
    images: [
      "assets/images/ps4_console_white_1.png",
      "assets/images/ps4_console_white_2.png",
      "assets/images/ps4_console_white_3.png",
      "assets/images/ps4_console_white_4.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Wireless Controller for PS4™",
    price: 64.99,
    description: description,
    rating: 4.8,
    isFavorite: true,
    isPopular: true,
  )
  ; demoProducts.forEach((element) {
      if (element.id == id){
        product= element;
      }
    });
    return product;
  }
  Cart({
    required this.product,
    required this.numOfItem,
    required this.userId,
  });

  Cart copyWith({
    Product? product,
    int? numOfItem,
    int? userId,
  }) {
    return Cart(
      product: product ?? this.product,
      numOfItem: numOfItem ?? this.numOfItem,
      userId: userId ?? this.userId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'product': product.toMap(),
      'numOfItem': numOfItem,
      'userId': userId,
    };
  }

  factory Cart.fromMap(Map<String, dynamic> map) {
    return Cart(
      product: Product.fromMap(map['product'] as Map<String,dynamic>),
      numOfItem: map['numOfItem'] as int,
      userId: map['userId'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Cart.fromJson(String source) => Cart.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Cart(product: $product, numOfItem: $numOfItem, userId: $userId)';

  @override
  bool operator ==(covariant Cart other) {
    if (identical(this, other)) return true;
  
    return 
      other.product == product &&
      other.numOfItem == numOfItem &&
      other.userId == userId;
  }

  @override
  int get hashCode => product.hashCode ^ numOfItem.hashCode ^ userId.hashCode;
}

// Demo data for our cart

