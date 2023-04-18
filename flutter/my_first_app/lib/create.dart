import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:my_first_app/customUrl.dart';

class CreatePage extends StatefulWidget {
  final Client client;
  const CreatePage({Key? key, required this.client}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New note'),
      ),
      body: Column(
        children: [
          TextField(
            controller: controller,
            maxLines: 10,
          ),
          ElevatedButton(
            onPressed: ()  {
              widget.client.post(getNotesUrl, body:{'body':controller.text });
              Navigator.pop(context);

            }, 
          
            child: Text('Create note'),
          )
        ],
      ),
    );
  }
}
