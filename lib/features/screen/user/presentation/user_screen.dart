import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:metal_head/core/routes/route_name.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                context.go(RouteName.client);
              },
              child: Text('Go to Client Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
