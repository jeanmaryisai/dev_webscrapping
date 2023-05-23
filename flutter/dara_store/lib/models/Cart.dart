// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

import '../repo.dart';
import 'Product.dart';

class Cart {
  final Product product;
  int numOfItem;
  int userId;

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

