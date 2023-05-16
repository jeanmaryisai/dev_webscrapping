import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:intra_app/note.dart';
import 'package:intra_app/update.dart';

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
      title: 'Isai Todo_app',
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
    // _retrieveNotes();
    super.initState();
  }

  int _currentIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  // _retrieveNotes() async {
  //   notes = [];
  //   List response = json.decode((await client.get(getNotesUrl)).body);
  //   response.forEach((element) {
  //     notes.add(Note.fromMap(element));
  //   });

  //   setState(() {});
  // }

  // void _deleteNote( int id) {
  //   client.delete(getNoteURLFromSlug(id));
  //   _retrieveNotes();
  // }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      HomePage(),
      CartPage(),
      Wishlist(),
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
                    builder: (context) => HelloWorldPage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.login_outlined),
              title: Text('Dekonekte'),
              onTap: () {
                // Action lorsque l'élément est cliqué
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
