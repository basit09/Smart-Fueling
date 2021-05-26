import 'package:flutter/material.dart';
import 'package:smart_fuelling/services/auth.dart';

class Signup extends StatefulWidget {
  final Function togview;

  Signup({this.togview});

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  // instance of auth service class
  final AuthService _auth = AuthService();

  //to identify the form formkey is being globalized
  final _formkey = GlobalKey<FormState>();
  // Controller for checking confirm password
  TextEditingController _passwordController = new TextEditingController();

  //text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signup'),
        actions: <Widget>[
          FlatButton(
            child: Row(
              children: <Widget>[Text('Login'), Icon(Icons.person)],
            ),
            textColor: Colors.white,
            onPressed: () {
              widget.togview();
            },
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.limeAccent,
              Colors.redAccent,
            ])),
          ),
          Center(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(
                height: 300,
                width: 300,
                padding: EdgeInsets.all(16),
                child: Form(
                  key: _formkey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        //email
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Email'),
                          validator: (val) =>
                              val.isEmpty ? 'Enter an Email' : null,
                          onChanged: (val) {
                            setState(() => email = val);
                          },
                        ),

                        //password
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Password'),
                          obscureText: true,
                          controller: _passwordController,
                          validator: (val) => val.length < 6
                              ? 'Enter password 6+ char long'
                              : null,
                          onChanged: (val) {
                            setState(() => password = val);
                          },
                        ),

                        //Confirm Password
                        TextFormField(
                          decoration:
                              InputDecoration(labelText: 'Confirm Password'),
                          obscureText: true,
                          validator: (val) {
                            if (val.isEmpty ||
                                val != _passwordController.text) {
                              return 'password doesn\'t match';
                            }
                            return null;
                          },

                          onChanged: (val) {
                            setState(() => password = val);
                          },
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        RaisedButton(
                          child: Text('Submit'),
                          onPressed: () async {
                            if (_formkey.currentState.validate()) {
                              dynamic result = await _auth
                                  .registerWithEmailAndPass(email, password);
                              if (result == null) {
                                setState(() =>
                                    error = 'Please enter valid email address');
                              }
                            }
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          color: Colors.blue,
                          textColor: Colors.white,
                        ),

                        // sizedbox is made to display the valid email error
                        SizedBox(height: 12.0),
                        Text(
                          error,
                          style: TextStyle(color: Colors.red, fontSize: 14.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
