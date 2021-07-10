import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/food.dart';
import 'package:flutter_application_1/views/pages/listdetail.dart';

import 'home.dart';
import 'login.dart';

class ListPage extends StatelessWidget {
  String username;

  ListPage(this.username);

  var _ctx;
  var _data = [
    Food('nasi-goreng.jpeg', 'Nasi Goreng', 25000, "Nasi dengan kecap dan ayam"),
    Food('nasi-lemak.jpeg', 'Nasi Lemak', 25000, "Nasi dengan wangi yang khas"),
    Food('otak-otak.jpeg', 'Otak-otak', 10000, "Olahan ikan yang dibakar"),
    Food('siomay.jpeg', 'Siomay', 15000, "Olahan ikan yang diberi saus kacang"),
  ];

  void _onPressed(Food f) {
    Navigator.push(_ctx, MaterialPageRoute(builder: (builder) {
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
              body: ListDetailPage(this.username, f.img, f.name, f.price, f.desc)));
    }));
  }

  void _home(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (builder) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: HomePage(this.username),
        ),
      );
    }));
  }

  void _food(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (builder) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: ListPage(this.username),
        ),
      );
    }));
  }

  void _logout(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (builder) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: LoginPage(),
        ),
      );
    }));
  }

  Widget _buildWidget(Food f) {
    return Card(
      child: ListTile(
        leading: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: 44,
            minWidth: 44,
            maxHeight: 64,
            maxWidth: 64,
          ),
          child: Image.asset(
            'assets/${f.img}',
            fit: BoxFit.cover,
          ),
        ),
        title: Text(f.name),
        trailing: ElevatedButton(
          child: Text('Details'),
          onPressed: () => _onPressed(f),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _ctx = context;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ListView(
          children: _data.map((e) => _buildWidget(e)).toList(),
        ),
        appBar: AppBar(
          title: Text('Home'),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              ListTile(
                  title: Text('${this.username}')
                ),
              ListTile(
                  title: TextButton(
                child: Text('Home'),
                onPressed: () => _home(context),
              )),
              ListTile(
                  title: TextButton(
                child: Text('Food'),
                onPressed: () => _food(context),
              )),
              ListTile(
                  title: TextButton(
                child: Text('Logout'),
                onPressed: () => _logout(context),
              )),
            ],
          ),
        )
      )   
    );
  }
}
