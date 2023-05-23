// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'cards.dart';
import 'main.dart';
import 'utils.dart';

class HelloWorldPage extends StatelessWidget {
  final String filter;
  final bool isUser;
  final Function(String) add;
  final Function(String) addWish;

  const HelloWorldPage({
    Key? key,
    this.filter = 'all',
    this.isUser = false,
    required this.add,
    required this.addWish,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var title = 'Produits';
    if (isUser) {
      title = 'Wish list';
    }
    if (filter != 'all') {
      title = 'Porduits| $filter';
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: RefreshIndicator(
            onRefresh: () async {},
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Expanded(
                child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];

                    return ProductCard(
                      productName: product.name,
                      productImage: product.image,
                      addProduct: add,
                      addWishProduct: addWish,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductPage(
                              product: product,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ])));
  }
}

class HomePage extends StatelessWidget {
  final Function(String) add;
  final Function(String) addWish;

  const HomePage({super.key, required this.add, required this.addWish});
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        // _retrieveNotes();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Catégories',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];

                return CategoryCard(
                  categoryName: category.name,
                  categoryImage: category.image,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HelloWorldPage(
                          filter: category.name,
                          add: add,
                          addWish: addWish,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Produits',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: favItem.length,
              itemBuilder: (context, index) {
                final product = favItem[index];

                return ProductCard(
                  productName: product.name,
                  productImage: product.image,
                  addProduct: add,
                  addWishProduct: addWish,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductPage(
                          product: product,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),

          //   ListView.builder(
          //   itemCount: notes.length,
          //   itemBuilder: (BuildContext context, int index) {
          //     return ListTile(
          //       title: Text(notes[index].body),
          //       onTap: () => Navigator.of(context).push(MaterialPageRoute(
          //         builder: (context)=>UpdatePage(
          //           client:client,
          //           body:notes[index].body,
          //           id:notes[index].id,
          //           )
          //         )),
          //       trailing: IconButton(
          //         icon: Icon(Icons.delete),
          //         onPressed:() => _deleteNote(notes[index].id)),
          //       // icon: Icon.createWithUrl(notes[index].icon),
          //       // action: () => _addNote(),
          //     );
          //   },
          // ),
        ],
      ),
    );
  }
}

class Product {
  final String name;
  final String description;
  final double price;
  final int quantity;
  final String image;

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.quantity,
    required this.image,
  });
}

class Categorie {
  final String name;
  final String image;
  final int idd;

  Categorie({
    required this.name,
    required this.image,
    this.idd= 0,
  });
}

//

class CartPage extends StatelessWidget {
  final Function(String) deleteCartItem;

  CartPage({required this.deleteCartItem});

  @override
  Widget build(BuildContext context) {
    double total = 0;

    return Scaffold(
      appBar: AppBar(
        title: Text('Panier'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final cartItem = cartItems[index];
                total += cartItem.price * cartItem.quantity;

                return ListTile(
                  leading: Image.asset(
                    cartItem.image,
                    width: 48,
                    height: 48,
                  ),
                  title: Text(cartItem.name),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(cartItem.description),
                      SizedBox(height: 4),
                      Text(
                        '\$${cartItem.price.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Qty: ${cartItem.quantity}'),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          deleteCartItem(cartItem.name);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Total: \$${total.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Wishlist extends StatelessWidget {
  final Function(String) deleteWishItem;

  const Wishlist({super.key, required this.deleteWishItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wishlist'),
      ),
      body: ListView.builder(
        itemCount: wishItem.length,
        itemBuilder: (context, index) {
          final cartItem = wishItem[index];
          return ListTile(
            leading: Image.asset(
              cartItem.image,
              width: 48,
              height: 48,
            ),
            title: Text(cartItem.name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(cartItem.description),
                SizedBox(height: 4),
                Text(
                  '\$${cartItem.price.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.add_shopping_cart_rounded),
                  onPressed: () {
                    deleteWishItem(cartItem.name);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class CheckoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double total = 0;

    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final cartItem = cartItems[index];
                total += cartItem.price * cartItem.quantity;

                return ListTile(
                  leading: Image.asset(
                    cartItem.image,
                    width: 48,
                    height: 48,
                  ),
                  title: Text(cartItem.name),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Quantité: ${cartItem.quantity}'),
                      Text(
                        'Prix: \$${(cartItem.price * cartItem.quantity).toStringAsFixed(2)}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Résumé de la commande',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 8),
                Text('Total: \$${total.toStringAsFixed(2)}'),
              ],
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Méthodes de paiement',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.credit_card),
                  title: Text('Carte de crédit'),
                  onTap: () {
                    // Méthode de paiement par carte de crédit
                    // Ajoutez votre logique ici
                  },
                ),
                ListTile(
                  leading: Icon(Icons.monetization_on),
                  title: Text('MonCash'),
                  onTap: () {
                    // Méthode de paiement MonCash
                    // Ajoutez votre logique ici
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Bienvenue',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Nom d\'utilisateur',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Mot de passe',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                isLoggedIn = true;
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MyApp()),
                );
              },
              child: Text('Se connecter'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductPage extends StatelessWidget {
  final Product product;

  const ProductPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(product.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    product.description,
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${product.price}',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              
                              addToCart(product.name);
                            },
                            icon: Icon(
                              Icons.shopping_cart,
                              color: Colors.black,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              addToWish(product.name);
                            },
                            icon: Icon(
                              Icons.favorite_border,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Détails du produit',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Disponibilité:  En stock',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Note',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber),
                      Icon(Icons.star, color: Colors.amber),
                      Icon(Icons.star, color: Colors.amber),
                      Icon(Icons.star_half, color: Colors.amber),
                      Icon(Icons.star_outline, color: Colors.amber),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
