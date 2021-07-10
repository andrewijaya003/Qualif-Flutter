import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/pages/home.dart';
import 'package:flutter_application_1/views/pages/list.dart';
import 'package:flutter_application_1/views/pages/login.dart';
import 'package:flutter_application_1/views/pages/navigation.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: Scaffold( 
        body: LoginPage()
      ),
      // initialRoute: '/',
      // routes: <String, WidgetBuilder>{
      //   '/' : (BuildContext context) => const HomePage()
      // },
    );
  }
}
