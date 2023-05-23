// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:collection/collection.dart';

import 'package:flutter/material.dart';

class Product {
  final int id;
  final String title;
  final String description;
  final List<dynamic> images;
  final List<Color> colors;
  final double rating;
  final double price;
  bool isFavorite;
  bool isPopular;
  int caterogyId;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.images,
    required this.colors,
    this.rating = 0.0,
    required this.price,
    this.isFavorite = false,
    this.isPopular = false,
    this.caterogyId = 0,
  });

  Product copyWith({
    int? id,
    String? title,
    String? description,
    List<dynamic>? images,
    List<Color>? colors,
    double? rating,
    double? price,
    bool? isFavorite,
    bool? isPopular,
    int? caterogyId,
  }) {
    return Product(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      images: images ?? this.images,
      colors: colors ?? this.colors,
      rating: rating ?? this.rating,
      price: price ?? this.price,
      isFavorite: isFavorite ?? this.isFavorite,
      isPopular: isPopular ?? this.isPopular,
      caterogyId: caterogyId ?? this.caterogyId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'images': images,
      'colors': colors.map((x) => x.value).toList(),
      'rating': rating,
      'price': price,
      'isFavorite': isFavorite,
      'isPopular': isPopular,
      'caterogyId': caterogyId,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] as int,
      title: map['title'] as String,
      description: map['description'] as String,
      price: map['price'] as double,
      rating: map['rating'] as double,
      isFavorite: map['isFavorite'] as bool,
      isPopular: map['isPopular'] as bool,
      caterogyId: map['caterogyId'] as int,
      images: List<dynamic>.from(
        (map['images'] as List<dynamic>),),
      colors: List<Color>.from(
          (map['colors'] as List<int>).map<Color>(
            (x) => Color(x),
          ),
        ),);
      
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Product(id: $id, title: $title, description: $description, images: $images, colors: $colors, rating: $rating, price: $price, isFavorite: $isFavorite, isPopular: $isPopular, caterogyId: $caterogyId)';
  }

  @override
  bool operator ==(covariant Product other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.id == id &&
        other.title == title &&
        other.description == description &&
        listEquals(other.images, images) &&
        listEquals(other.colors, colors) &&
        other.rating == rating &&
        other.price == price &&
        other.isFavorite == isFavorite &&
        other.isPopular == isPopular &&
        other.caterogyId == caterogyId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        images.hashCode ^
        colors.hashCode ^
        rating.hashCode ^
        price.hashCode ^
        isFavorite.hashCode ^
        isPopular.hashCode ^
        caterogyId.hashCode;
  }
}

// Our demo Products
