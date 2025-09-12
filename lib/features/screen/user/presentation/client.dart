import 'package:flutter/material.dart';

class Client extends StatelessWidget {
  const Client({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Client Screen')),
      body: Center(child: Text('Hello Client')),
    );
  }
}
