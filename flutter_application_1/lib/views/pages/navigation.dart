import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nav'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: TextButton(
                child: Text('Home'),
                onPressed: null,
              )
            ),
            ListTile(title: Text('Food')),
            ListTile(title: Text('Logout')),
          ],
        ),
      ),
    );
  }
}
