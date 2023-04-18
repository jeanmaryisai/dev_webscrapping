import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:my_first_app/note.dart';

import 'create.dart';
import 'customUrl.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Isai Todo_app'),
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
    _retrieveNotes();
    super.initState();
  }

  _retrieveNotes() async {
    notes = [];
    List response = json.decode((await client.get(getNotesUrl)).body);
    response.forEach((element) {
      notes.add(Note.fromMap(element));
    });

    setState(() {});
  }

  void _deleteNote( int id) {
    client.delete(getNoteURLFromSlug(id));
    _retrieveNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          _retrieveNotes();
        },
        child: ListView.builder(
          itemCount: notes.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(notes[index].body),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context)=>UpdatePage(
                  client:client,
                  body:notes[index].body,
                  id:notes[index].id,
                  )
                )),
              trailing: IconButton(
                icon: Icon(Icons.delete), 
                onPressed:() => _deleteNote(notes[index].id)),
              // icon: Icon.createWithUrl(notes[index].icon),
              // action: () => _addNote(),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CreatePage(client:client))),
        tooltip: 'Add note',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
