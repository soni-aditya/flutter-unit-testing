import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<FormState> _formkey = new GlobalKey<FormState>();
  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
            key: _formkey,
            child: ListView(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Center(
                    child: Text('Login'),
                  ),
                ),
                Container(
                  child: TextFormField(
                    decoration: InputDecoration(labelText: "Email"),
                    validator: FormValidator.validateEmail,
                    onSaved: (value) {
                      _email = value.trim();
                    },
                  ),
                ),
                Container(
                  child: TextFormField(
                    decoration: InputDecoration(labelText: "Passowrd"),
                    obscureText: true,
                    validator: FormValidator.validatePassword,
                    onSaved: (value) {
                      _email = value.trim();
                    },
                  ),
                ),
                RaisedButton(
                  onPressed: login,
                  child: Text('Login'),
                )
              ],
            )),
      ),
    );
  }

  login() async {
    final FormState form = _formkey.currentState;
    if (!form.validate()) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Scaffold.of(context).showSnackBar(
            SnackBar(content: Text('Please enter valid details')));
      });
    } else {
      form.save();
    }
  }
}

class FormValidator {
  static String validateEmail(String email) {
    if (email.isEmpty) return "Please enter an email!";
    Pattern pattern =
        r'^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(email)) {
      return "Please enter a valid email";
    }
    return null;
  }

  static String validatePassword(String value) {
    if (value.isEmpty) return 'Please choose a password.';
    if (value.length < 8) return 'Password must contain atleast 8 characters.';
    return null;
  }
}
