import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/pages/list.dart';
import 'package:flutter_application_1/views/pages/login.dart';

class HomePage extends StatefulWidget {
  String username;

  HomePage(this.username);

  @override
  State<StatefulWidget> createState() {
    return HomePageState(this.username);
  }
}

class HomePageState extends State<HomePage> {
  String username;

  HomePageState(this.username);

  var _images = [
    'assets/nasi-goreng.jpeg',
    'assets/nasi-lemak.jpeg',
    'assets/otak-otak.jpeg',
    'assets/siomay.jpeg'    
  ];

  var _darkThemeEnabled = false;

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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: _darkThemeEnabled ? ThemeData.dark() : ThemeData.light(),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Home'),
            actions: [
              PopupMenuButton(itemBuilder: (context) {
                return ['Toggle Theme'].map((e) {
                  return PopupMenuItem(
                      child: TextButton(
                    child: Text('Toggle Theme'),
                    onPressed: () {
                      setState(() {
                        _darkThemeEnabled = !_darkThemeEnabled;
                      });
                    },
                  ));
                }).toList();
              })
            ],
          ),
          drawer: Drawer(
            child: ListView(
              children: [
                ListTile(title: Text('${this.username}')),
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
          ),
          body: CarouselSlider(
            items: [
              Image(image: AssetImage(_images[0])),
              Image(image: AssetImage(_images[1])),
              Image(image: AssetImage(_images[2])),
              Image(image: AssetImage(_images[3])),
            ], options: CarouselOptions(
              initialPage: 0,
              enableInfiniteScroll: true,
              enlargeCenterPage: true,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3)
            )
          ),
        ));
  }
}
