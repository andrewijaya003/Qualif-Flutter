import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/comment.dart';

import 'home.dart';
import 'list.dart';
import 'login.dart';

class ListDetailPage extends StatefulWidget {
  String username;
  String img;
  String name;
  String desc;
  int price;

  ListDetailPage(this.username, this.img, this.name, this.price, this.desc);

  @override
  State<StatefulWidget> createState() {
    return ListDetailPageState(
        this.username, this.img, this.name, this.price, this.desc);
  }
}

class ListDetailPageState extends State<ListDetailPage> {
  String username;
  String img;
  String name;
  String desc;
  int price;

  ListDetailPageState(
      this.username, this.img, this.name, this.price, this.desc);

  var _ctrlComment = new TextEditingController();

  var data = [];

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

  void _onPressed(BuildContext context) {
    print(_ctrlComment.text);
    if (_ctrlComment.text == "") {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Comment must be filled!')));
    } else {
      setState(() {
        listComment.add(new Comment(_ctrlComment.text, name, username));
      });
      _ctrlComment.text = '';
    }
  }

  Widget _buildWidget(Comment c) {
    return Card(
      child: ListTile(
        leading: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: 44,
            minWidth: 44,
            maxHeight: 64,
            maxWidth: 64,
          ),
        ),
        title: Text(c.content + " by " + c.username),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    data.clear();
    for (var i = 0; i < listComment.length; i++) {
      if (listComment[i].product == name) {
        data.add(listComment[i]);
      }
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              title: Text('Home'),
              bottom: TabBar(
                tabs: [
                  Tab(icon: Image.asset('dish.png')),
                  Tab(icon: Image.asset('speech-bubble.png')),
                ],
              ),
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
            body: TabBarView(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Image(
                        image: AssetImage('assets/$img'),
                      ),
                      Text(name),
                      Text(price.toString()),
                      Text(desc),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Comment',
                        ),
                        controller: _ctrlComment,
                      ),
                      ElevatedButton(
                          onPressed: () => _onPressed(context),
                          child: Text('Submit!'))
                    ],
                  ),
                ),
                ListView(
                  children: data.map((e) => _buildWidget(e)).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
