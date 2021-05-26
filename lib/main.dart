import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_fuelling/screen/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:smart_fuelling/services/auth.dart';
import 'package:smart_fuelling/models/user.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper(),

      ),
    );
  }
}

