import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountDetails extends StatefulWidget {
  @override
  _AccountDetailsState createState() => _AccountDetailsState();
}

class _AccountDetailsState extends State<AccountDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF7A9BEE),
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: new Text(
            "Account Details",
            style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 30.0,
                color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height - 82.0,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  color: Colors.transparent,
                ),
                Positioned(
                  top: 75.5,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(45.0),
                        topRight: Radius.circular(45.0),
                      ),
                      color: Colors.white,
                    ),
                    height: MediaQuery
                        .of(context)
                        .size
                        .height - 100.0,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                     // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        SizedBox(height: 20.0),
                        //Full Name
                         TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Full Name',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 18.0,
                            ),
                          ),
                           validator: (val) =>
                           val.isEmpty ? 'Enter your full name of the card' : null,
                        ),
                        SizedBox(height: 20.0),

                        //Account Number
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Account number',
                            hintStyle: TextStyle(
                                color: Colors.grey, fontSize: 18.0),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Card Number',
                            hintStyle: TextStyle(
                              color: Colors.grey, fontSize: 18.0
                            )
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        RaisedButton(
                          child: Text("Submit",style: TextStyle(fontSize: 20.0, color: Colors.white),),
                          splashColor: Colors.blue[100],


                          onPressed: (){},
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),


                          ),
                          color: Colors.blue,

                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ));
  }
}
