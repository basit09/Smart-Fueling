import 'package:flutter/material.dart';
import 'package:smart_fuelling/qrcode/genratedQR.dart';
class GenrateQr extends StatefulWidget {
  @override
  _GenrateQrState createState() => _GenrateQrState();
}

TextEditingController mycontroller = new TextEditingController();

class _GenrateQrState extends State<GenrateQr> {
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
                          controller: mycontroller,
                          decoration: InputDecoration(
                            hintText: 'Full Name',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 18.0,
                            ),
                          ),
                          validator: (val) =>
                          val.isEmpty ? 'Enter your full name of the card' : null,
                          onEditingComplete: navigate,
                        ),
                        SizedBox(height: 20.0),

                        //Account Number
                        TextFormField(
                          //controller: mycontroller,
                          decoration: InputDecoration(
                            hintText: 'Account number',
                            hintStyle: TextStyle(
                                color: Colors.grey, fontSize: 18.0),
                          ),
                          onEditingComplete: navigate,
                        ),
                        SizedBox(height: 20.0),
                        TextFormField(
                          //controller: mycontroller,
                          decoration: InputDecoration(
                              hintText: 'Card Number',
                              hintStyle: TextStyle(
                                  color: Colors.grey, fontSize: 18.0
                              )
                          ),
                          onEditingComplete: navigate,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),

//genrating QR button
                        Container(
                          width: ((MediaQuery.of(context).size.width) - 45),
                          height: 50.0,
                          child: OutlineButton(
                            focusColor: Colors.red,
                            highlightColor: Colors.blue,
                            hoverColor: Colors.lightBlueAccent,
                            splashColor: Colors.blue,
                            borderSide: BorderSide(width: 3.0, color: Colors.blue),
                            shape: StadiumBorder(),
                            // will make the container edges curved
                            child: new Text(
                              "Genrate QR ",
                              style: TextStyle(fontSize: 17.0),
                            ),
                            onPressed: navigate,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ));
  }

  void navigate() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => GenratedQR(mycontroller.text)));
  }
}
