import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class FuelPoints extends StatefulWidget {
  @override
  _FuelPointsState createState() => _FuelPointsState();
}

class _FuelPointsState extends State<FuelPoints> {
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
            "Fuel Points",
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
                  height: MediaQuery.of(context).size.height - 82.0,
                  width: MediaQuery.of(context).size.width,
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
                    height: MediaQuery.of(context).size.height - 100.0,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        SizedBox(height: 20.0),
                        //Full Name
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "Fuel Points",
                            border: new OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.teal)),
                            hintText: '',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 18.0,
                            ),
                          ),
                        ),

                        SizedBox(height: 20.0),

                        SizedBox(
                          height: 15.0,
                        ),
                        RaisedButton(
                          child: Text(
                            "Add More",
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.white),
                          ),
                          splashColor: Colors.blue[100],
                          onPressed: () {},
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
