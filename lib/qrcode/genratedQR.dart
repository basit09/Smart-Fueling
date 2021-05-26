import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenratedQR extends StatefulWidget {
  final myQR;

  const GenratedQR(this.myQR);

  @override
  _GenratedQRState createState() => _GenratedQRState();
}

class _GenratedQRState extends State<GenratedQR> {
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
            "Genrated QR ",
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
                        QrImage(
                          data: widget.myQR,
                          foregroundColor: Colors.blue,
                          version: QrVersions.auto,
                          size: 240.0,
                          gapless: false,
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
}
