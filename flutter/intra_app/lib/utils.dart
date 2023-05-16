    import 'package:flutter/material.dart';

import 'listScreen.dart';

void showSnackBar(BuildContext context) {
    final snackBar = SnackBar(
      content: Text('Votre produit a été ajouté au panier'),
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
    Product(
      name: 'Produit 1',
      description: 'Description du produit 1',
      price: 9.99,
      quantity: 2,
      image: 'assets/images/glap.png',
    ),
    Product(
      name: 'Produit 2',
      description: 'Description du produit 2',
      price: 19.99,
      quantity: 1,
      image:'assets/images/glap.png',
    ),
  ];

List<Product> wishItem = [
    Product(
      name: 'Produit 1',
      description: 'Description du produit 1',
      price: 9.99,
      quantity: 2,
      image: 'assets/images/glap.png',
    ),
    Product(
      name: 'Produit 2',
      description: 'Description du produit 2',
      price: 19.99,
      quantity: 1,
      image:'assets/images/glap.png',
    ),
  ];
var currentUser ='anonymous';
