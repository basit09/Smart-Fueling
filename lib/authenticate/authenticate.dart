import 'package:flutter/material.dart';
import 'package:smart_fuelling/authenticate/login.dart';
import 'package:smart_fuelling/authenticate/signup.dart';

class authenticate extends StatefulWidget {
  @override
  _authenticateState createState() => _authenticateState();
}

class _authenticateState extends State<authenticate> {
  bool showSignIn = true;

  void toggleView() {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return SignIn( togview : toggleView);
    } else {
      return Signup(togview: toggleView);
    }
  }
}
