import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:my_first_app/customUrl.dart';

class UpdatePage extends StatefulWidget {
  final Client client;
  final int id;
  final String body;
  const UpdatePage(
      {Key? key, required this.client, required this.id, required this.body})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  TextEditingController controller = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    controller.text = widget.body;
    super.initState(); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Note'),
      ),
      body: Column(
        children: [
          TextField(
            controller: controller,
            maxLines: 10,
          ),
          ElevatedButton(
            onPressed: () {
              widget.client.put(getNoteURLFromSlug(widget.id),
                  body: {'body': controller.text});
              Navigator.pop(context);
            },
            child: Text('Update Note'),
          )
        ],
      ),
    );
  }
}
