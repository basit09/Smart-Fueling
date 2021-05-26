import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_fuelling/drawer/account_details.dart';
import 'package:smart_fuelling/home/FuelPoints.dart';
import 'package:smart_fuelling/qrcode/genrateQr.dart';
import 'package:smart_fuelling/services/auth.dart';
import 'package:smart_fuelling/services/database.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
      value: DatabaseService().accountdetails,
      child: Scaffold(
        backgroundColor: Colors.indigo[500],
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: new Text(
            "Smart Fuelling",
            style: TextStyle(
                //fontStyle:,
                fontSize: 30.0,
                color: Colors.white),
          ),
          actions: [
            FlatButton(
              child: Row(
                children: [
                  new //Text('Log Out'),
                  Icon(Icons.logout),
                ],
              ),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
          ],
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
                        topLeft: Radius.circular(75.0),
                      ),
                      color: Colors.white,
                    ),
                    height: MediaQuery.of(context).size.height - 100.0,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: GridView.count(
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 20,
                            crossAxisCount: 2,
                            primary: false,
                            children: <Widget>[


 //homepage widgets
                              //fuel points
                              InkWell(
                                child: Card(
                                  color: Colors.blue[100],
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),

                                  ),
                                  child: Column(
                                    children: [
                                      Image(
                                        image:
                                            AssetImage('images/fuel-pump.png'),
                                        height: 120.0,
                                        width: 85.0,
                                        color: Colors.deepOrangeAccent,
                                      ),
                                      Text('Fuel Points'),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => FuelPoints()));
                                },
                                splashColor: Colors.blue[100],
                              ),
//qr code
                              InkWell(
                                child: Card(

                                  color: Colors.blue[100],

                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),

                                  ),
                                  child: Column(
                                    children: [
                                      Image(
                                        image:
                                        AssetImage('images/qr.png'),
                                        height: 120.0,
                                        width: 100.0,
                                        //color: Colors.transparent,
                                      ),
                                      Text('Qr Code'),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => GenrateQr()));
                                },
                                splashColor: Colors.blue[100],
                              ),

                              InkWell(
                                child: Card(
                                  color: Colors.blue[100],
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),

                                  ),
                                  child: Column(
                                    children: [
                                      Image(
                                        image:
                                        AssetImage('images/fl.jpg'),
                                        height: 120.0,
                                        width: 80.0,
                                       // color: Colors.deepOrangeAccent,
                                      ),
                                      Text('Fuel Logs'),
                                    ],
                                  ),
                                ),
                                onTap: () {},
                                splashColor: Colors.blue[100],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        //===========DRAWER=========================

        drawer: new Drawer(
            child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: Text(
                'Gigax',
                style: TextStyle(fontSize: 20.0),
              ),
              accountEmail: Text(
                'test@test.com',
                style: TextStyle(fontSize: 19.0),
              ),
              currentAccountPicture: GestureDetector(
                child: new CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: new Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
              ),
              decoration: BoxDecoration(color: Colors.indigo[500]),
            ),
            //List body
//=====================DRAWER LIST STARTED=====================
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => GenrateQr()));
              },
              child: new ListTile(
                title: Text("QR code "),
                leading: new Icon(
                  Icons.qr_code_sharp,
                  color: Colors.blue[500],
                ),
              ),
            ),
//Bank account
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AccountDetails()));
              },
              child: new ListTile(
                title: Text("Bank Account "),
                leading: new Icon(
                  Icons.account_balance,
                  color: Colors.blue[500],
                ),
              ),
            ),

//SIGN OUT

            InkWell(
              onTap: () async {
                await _auth.signOut();
              },
              child: new ListTile(
                title: new Text("Log out"),
                leading: Icon(
                  Icons.logout,
                  color: Colors.blueAccent,
                ),
              ),
            ),

//SETTINGS
            Divider(), // for  dividing  horizontal line
            InkWell(
              onTap: () {},
              child: new ListTile(
                title: Text("Setting"),
                leading: new Icon(
                  Icons.settings,
                  color: Colors.blueAccent,
                ),
              ),
            ),

//ABOUT US
            InkWell(
              onTap: () {},
              child: new ListTile(
                title: new Text("About us"),
                leading: new Icon(
                  Icons.info_rounded,
                  color: Colors.blueAccent,
                ),
              ),
            ),

// HELP
            InkWell(
              onTap: () {},
              child: new ListTile(
                title: new Text("Help"),
                leading: Icon(
                  Icons.help,
                  color: Colors.blueAccent,
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
