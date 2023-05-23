import 'package:flutter/material.dart';

import '../../../repo.dart';

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
              itemCount: demoCarts.length,
              itemBuilder: (context, index) {
                final cartItem = demoCarts[index];
                total += cartItem.product.price * cartItem.numOfItem;

                return ListTile(
                  leading: Image.asset(
                    cartItem.product.images[0],
                    width: 48,
                    height: 48,
                  ),
                  title: Text(cartItem.product.title),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Quantité: ${cartItem.numOfItem}'),
                      Text(
                        'Prix: \$${(cartItem.product.price * cartItem.numOfItem).toStringAsFixed(2)}',
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