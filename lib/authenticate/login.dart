import 'package:flutter/material.dart';
import 'package:smart_fuelling/services/auth.dart';
import 'package:smart_fuelling/shared/loading.dart';

class SignIn extends StatefulWidget {
  final Function togview;

  SignIn({this.togview});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  //to identify the form form key is being globalized
  final _formkey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        elevation: 0.0, // no drop shadow
        title: new Text('Login'),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.lightGreenAccent,
              Colors.blue,
            ])),
          ),
          Center(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(
                height: 350,
                width: 260,
                padding: EdgeInsets.all(16),
                child: Form(
                  key: _formkey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        //==================email======================
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Email'),
                          validator: (val) =>
                              val.isEmpty ? 'Enter an Email' : null,
                          onChanged: (val) {
                            setState(() => email = val);
                          },
                        ),

                        //==============password==================
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(labelText: 'Password'),
                          validator: (val) => val.length < 6
                              ? 'Enter password 6+ char long'
                              : null,
                          onChanged: (val) {
                            setState(() => password = val);
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        RaisedButton(
                          child: Text('Login'),
                          onPressed: () async {
                            if (_formkey.currentState.validate()) {
                              dynamic result = await _auth
                                  .loginWithEmailAndPass(email, password);
                              if (result == null) {
                                setState(() {
                                  error =
                                      'Can not login with these credentials';
                                });
                              }
                            }
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          color: Colors.blue,
                          textColor: Colors.white,
                        ),
                        SizedBox(height: 12.0),
                        Text(
                          error,
                          style: TextStyle(color: Colors.red, fontSize: 14.0),
                        ),

                        //=========SIGN UP BUTTON==============
                        Center(
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            color: Colors.blue[400],
                            textColor: Colors.white,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(child: new Text('Sign up')),
                                //Icon(Icons.person_add),
                              ],
                            ),
                            onPressed: () {
                              widget.togview();
                            },
                          ),
                        )
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
