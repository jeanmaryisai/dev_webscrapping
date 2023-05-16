import 'package:flutter/material.dart';

import 'cards.dart';
import 'utils.dart';

class HelloWorldPage extends StatelessWidget {
  final String filter;
  final bool isUser;

  const HelloWorldPage({
    super.key,
    this.filter = 'all',
    this.isUser = false,
  });

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
                child: GridView.count(
                  crossAxisCount: 2,
                  children: [
                    ProductCard(
                      productName: 'Chemise',
                      productImage: 'assets/images/glap.png',
                      onTap: () {
                        showSnackBar(context);
                      },
                    ),
                    ProductCard(
                      productName: 'Pantalon',
                      productImage: 'assets/images/glap.png',
                      onTap: () {
                        showSnackBar(context);
                      },
                    ),
                    ProductCard(
                      productName: 'Pantalon',
                      productImage: 'assets/images/glap.png',
                      onTap: () {
                        showSnackBar(context);
                      },
                    ),
                    // Ajoutez d'autres cartes de produits ici
                  ],
                ),
              ),
            ])));
  }
}

class HomePage extends StatelessWidget {
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
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CategoryCard(
                  categoryName: 'Vêtements',
                  categoryImage: 'assets/images/glap.png',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const HelloWorldPage(filter: "vetements"),
                      ),
                    );
                  },
                ),
                CategoryCard(
                  categoryName: 'Chaussures',
                  categoryImage: 'assets/images/glap.png',
                  onTap: () {
                    // Action lorsque le produit est cliqué
                  },
                ),
                // Ajoutez d'autres cartes de catégories ici
              ],
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
            child: GridView.count(
              crossAxisCount: 2,
              children: [
                ProductCard(
                  productName: 'Chemise',
                  productImage: 'assets/images/glap.png',
                  onTap: () {
                    // Action lorsque le produit est cliqué
                  },
                ),
                ProductCard(
                  productName: 'Pantalon',
                  productImage: 'assets/images/glap.png',
                  onTap: () {
                    // Action lorsque le produit est cliqué
                  },
                ),
                ProductCard(
                  productName: 'Pantalon',
                  productImage: 'assets/images/glap.png',
                  onTap: () {
                    // Action lorsque le produit est cliqué
                  },
                ),
                // Ajoutez d'autres cartes de produits ici
              ],
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

// 

class CartPage extends StatelessWidget {

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
                    // Supprimer l'article du panier
                    // Vous pouvez ajouter votre logique ici
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
                    // Supprimer l'article du panier
                    // Vous pouvez ajouter votre logique ici
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


