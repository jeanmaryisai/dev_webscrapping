import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'listScreen.dart';
import 'main.dart';

void showSnackBar(BuildContext context,
    {String msj = 'Votre produit a été ajouté au panier'}) {
  final snackBar = SnackBar(
    content: Text(msj),
    duration: Duration(seconds: 3),
    action: SnackBarAction(
      label: 'OK',
      onPressed: () {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      },
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

List<Product> cartItems = [
  // Product(
  //   name: 'Produit 1',
  //   description: 'Description du produit 1',
  //   price: 9.99,
  //   quantity: 2,
  //   image: 'assets/images/glap.png',
  // ),
  // Product(
  //   name: 'Produit 2',
  //   description: 'Description du produit 2',
  //   price: 19.99,
  //   quantity: 1,
  //   image: 'assets/images/glap.png',
  // ),
];

void removeCartItemByName(String productName) {
  for (int i = 0; i < cartItems.length; i++) {
    if (cartItems[i].name == productName) {
      cartItems.removeAt(i);
      break;
    }
  }
}

void addToCart(String productName) {
  for (int i = 0; i < products.length; i++) {
    if (products[i].name == productName) {
      for (int j = 0; j < cartItems.length; j++) {
        if (cartItems[j].name == productName) {
          // cartItems.removeAt(i);
          return;
        }
        cartItems.add(products[i]);
      }
      break;
    }
  }
}

void addToWish(String productName) {
  for (int i = 0; i < products.length; i++) {
    if (products[i].name == productName) {
      for (int j = 0; j < cartItems.length; j++) {
        if (wishItem[j].name == productName) {
          // cartItems.removeAt(i);
          return;
        }
        wishItem.add(products[i]);
      }
      break;
    }
  }
}

Product? findProductByName(String name) {
  for (int i = 0; i < products.length; i++) {
    if (products[i].name == name) {
      return products[i];
    } else {
      return null;
    }
  }
}

List<Product> wishItem = [
  // Product(
  //   name: 'Produit 1',
  //   description: 'Description du produit 1',
  //   price: 9.99,
  //   quantity: 2,
  //   image: 'assets/images/glap.png',
  // ),
  // Product(
  //   name: 'Produit 2',
  //   description: 'Description du produit 2',
  //   price: 19.99,
  //   quantity: 1,
  //   image: 'assets/images/glap.png',
  // ),
];

// Future<List<Product>> favItem = fetchProducts(limit: 6);

// List<Product> products = [
//   Product(
//     name: 'Produit 1',
//     description: 'Description du produit 1',
//     price: 9.99,
//     quantity: 2,
//     image: 'assets/images/glap.png',
//   ),
//   Product(
//     name: 'Produit 2',
//     description: 'Description du produit 2',
//     price: 19.99,
//     quantity: 1,
//     image: 'assets/images/glap.png',
//   ),
// ];
List<Product> products = [];
List<Product> favItem = products.take(4).toList();

Map<String, dynamic> user = {
  'name': 'anonymous',
  'email': 'john.doe@example.com',
  'password': 'password123',
};

List<Categorie> categories = [
  Categorie(image: 'assets/images/glap.png', name: 'fdafda'),
  Categorie(image: 'assets/images/glap.png', name: 'fjyyyrda'),
  Categorie(image: 'assets/images/glap.png', name: 'fcvca'),
  Categorie(image: 'assets/images/glap.png', name: 'wqeqw'),
];
// Future<List<Product>> categories = fetchCategories(limit: 20);

bool isLoggedIn = false;

void login(context) {
  if (isLoggedIn) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MyApp()),
    );
  } else {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }
}

Future<List<Product>> fetchProducts() async {
  final response = await http.get(
      Uri.parse('https://api.escuelajs.co/api/v1/products?offset=0&limit=10'));

  if (response.statusCode == 200) {
    final List<dynamic> data = jsonDecode(response.body);

    return data.map((item) {
      return Product(
        name: item['title'],
        description: item['description'],
        price: item['price'].toDouble(),
        quantity: 0, // Par défaut, le produit a une quantité de 1
        image: item['images']
            [0], // Utilise la première image comme image principale
      );
    }).toList();
  } else {
    throw Exception('Failed to load products');
  }
}

Future<List<Categorie>> fetchCategories() async {
  final response =
      await http.get(Uri.parse(' https://api.escuelajs.co/api/v1/categories'));

  if (response.statusCode == 200) {
    final List<dynamic> data = jsonDecode(response.body);

    return data.map((item) {
      return Categorie(
        name: item['title'],
        idd: item['id'],
        image: item['images'],
      );
    }).toList();
  } else {
    throw Exception('Failed to load products');
  }
}
