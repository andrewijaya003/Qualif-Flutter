import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/pages/home.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  var _ctrlUsername = TextEditingController();
  var _ctrlPass = TextEditingController();
  var _checkUsername = false;
  var _checkPass = false;
  var _errUsername = '';
  var _errPass = '';

  void _onPressed(BuildContext context) {
    if (_ctrlUsername.text == "") {
      setState(() {
        _checkPass = false;
        _checkUsername = true;
        _errPass = '';
        _errUsername = 'Username is empty!';
      });
    } else if(_ctrlPass.text == ""){
      setState(() {
        _checkPass = true;
        _checkUsername = false;
        _errPass = 'Password is empty!';
        _errUsername = '';
      });
    } else if (_ctrlUsername.text.length < 5) {
      setState(() {
        _checkPass = false;
        _checkUsername = true;
        _errPass = '';
        _errUsername = 'Username length must be more than 5!';
      });
    } else {
      for (var i = 0; i < _ctrlPass.text.length; i++) {
        if (_ctrlPass.text[i] == '0' &&
            _ctrlPass.text[i] == '1' &&
            _ctrlPass.text[i] == '2' &&
            _ctrlPass.text[i] == '3' &&
            _ctrlPass.text[i] == '4' &&
            _ctrlPass.text[i] == '5' &&
            _ctrlPass.text[i] == '6' &&
            _ctrlPass.text[i] == '7' &&
            _ctrlPass.text[i] == '8' &&
            _ctrlPass.text[i] == '9') {
          break;
        } else if (i == _ctrlPass.text.length - 1) {
          if (_ctrlPass.text[i] != '0' &&
              _ctrlPass.text[i] != '1' &&
              _ctrlPass.text[i] != '2' &&
              _ctrlPass.text[i] != '3' &&
              _ctrlPass.text[i] != '4' &&
              _ctrlPass.text[i] != '5' &&
              _ctrlPass.text[i] != '6' &&
              _ctrlPass.text[i] != '7' &&
              _ctrlPass.text[i] != '8' &&
              _ctrlPass.text[i] != '9') {
            setState(() {
              _checkPass = true;
              _checkUsername = false;
              _errPass = 'Password must be contains a number!';
              _errUsername = '';
            });
          } else {
            Navigator.push(context, MaterialPageRoute(builder: (builder) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData.light(),
                home: Scaffold(
                  body: HomePage(_ctrlUsername.text),
                ),
              );
            }));
          }
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          width: 100,
          child: Image.asset('assets/hamburger.png')
        ),
        TextField(
          decoration: InputDecoration(
            hintText: 'Username',
            errorText: _checkUsername ? _errUsername : ''
          ),
          controller: _ctrlUsername,
        ),
        TextField(
          obscureText: true,
          decoration: InputDecoration(
            hintText: 'Password',
            errorText: _checkPass ? _errPass : ''
          ),
          controller: _ctrlPass,
        ),
        ElevatedButton(
            onPressed: () => _onPressed(context), child: Text('Validate!')),
      ],
    );
  }
}
