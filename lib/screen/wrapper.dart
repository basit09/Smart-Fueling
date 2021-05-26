import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_fuelling/authenticate/authenticate.dart';
import 'package:smart_fuelling/home/home.dart';
import 'package:smart_fuelling/models/user.dart';
class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);



    // return either home or authentication
      if(user== null)
        {
          return authenticate();
        }else{
        return home();
      }
  }
}
