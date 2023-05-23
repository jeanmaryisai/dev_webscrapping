import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:intra_app/note.dart';
import 'package:intra_app/update.dart';
import 'package:intra_app/utils.dart';

import 'cards.dart';
import 'create.dart';
import 'customUrl.dart';
import 'listScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Isai Shop',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const MyHomePage(title: 'Isai Shop'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Client client = http.Client();
  List<Note> notes = [];

  @override
  void initState() {
    // TODO: implement initState
    _retrieveData(); 
    super.initState();
  }

  int _currentIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _removeCartItem(String name) {
    removeCartItemByName(name);
    setState(() {});
  }

  void _removeWishItem(String name) {
    for (int i = 0; i < wishItem.length; i++) {
      if (wishItem[i].name == name) {
        cartItems.add(wishItem[i]);
        wishItem.removeAt(i);
        break;
      }
    }

    setState(() {});
  }

  void _addToCart(String name) {
    addToCart(name);
    setState(() {});
  }

  void _addToWish(String name) {
    addToWish(name);
    setState(() {});
  }

  _retrieveData() async {
    notes = [];
    List response = json.decode((await client.get(Uri.parse(
            'https://api.escuelajs.co/api/v1/products?offset=0&limit=10')))
        .body);
    response.forEach((item) {
      products.add(Product(
        name: item['title'],
        description: item['description'],
        price: item['price'].toDouble(),
        quantity: 0, // Par défaut, le produit a une quantité de 1
        image: item['images'][0],
      ));
    });
  }

  //   setState(() {});
  // }

  // void _deleteNote( int id) {
  //   client.delete(getNoteURLFromSlug(id));
  //   _retrieveNotes();
  // }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    List<Widget> pages = [
      HomePage(add: _addToCart, addWish: _addToWish),
      CartPage(deleteCartItem: _removeCartItem),
      Wishlist(deleteWishItem: _removeWishItem),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Isai Boutik',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.list_alt_outlined),
              title: Text('Lis pwodwi'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HelloWorldPage(
                      add: _addToCart,
                      addWish: _addToWish,
                    ),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.login_outlined),
              title: Text('Dekonekte'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
            ),
          ],
        ),
      ),

      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        elevation:
            8, // Ajoutez cette ligne pour définir l'élévation de l'élément actif
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Panier',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Liste de souhaits',
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => CheckoutPage())),
        tooltip: 'Checkout',
        child: const Icon(
          Icons.payment,
          size: 24,
        ),
        backgroundColor: Colors.orange,
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
