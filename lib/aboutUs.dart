import 'package:flutter/material.dart';


class about extends StatefulWidget {
  @override
  _aboutState createState() => _aboutState();
}

class _aboutState extends State<about> {

  @override
  void initState(){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Stack(
            children: <Widget>[
              Center(
                child: new Image.asset(
                  'assets/logo-icon.png',
                  color: Color.fromRGBO(177, 140, 69, 1),
                  fit: BoxFit.fill,
                ),
              ),
              Center(
                child: Text("About Us"),
              ),
            ],
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.shopping_cart),
            )
          ],
          centerTitle: false,
        ),
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Container(
            child: Text(""),
          ),
        )
    );
  }
}


