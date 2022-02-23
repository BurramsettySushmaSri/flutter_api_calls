import 'package:flutter/material.dart';

import 'http_service.dart';
class DetailScreen extends StatelessWidget {
  // In the constructor, require a Todo.
  const DetailScreen({Key? key, required this.postdata}) : super(key: key);

  // Declare a field that holds the Todo.
  final Post postdata;

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: Text((postdata.id).toString()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(postdata.body),
      ),
    );
  }
}