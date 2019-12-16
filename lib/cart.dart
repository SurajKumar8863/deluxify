import 'package:flutter/material.dart';


class cart extends StatefulWidget {
  @override
  _cartState createState() => _cartState();
}

class _cartState extends State<cart> {

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
                child: Text("Cart"),
              ),
            ],
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.favorite_border),
            )
          ],
          centerTitle: false,
        ),
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left:30.0,right: 30,top: 15,bottom: 15),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom:8.0),
                    child: Text("2 Items",style: TextStyle(fontSize: 17,color: Color.fromRGBO(137, 98, 31, 1),),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: new BoxDecoration(
                        border: new Border.all(
                          color: Color.fromRGBO(233, 233, 233, 1),
                          width: 1.5
                        ),
                      ),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text("testing"),
                            ],
                          ),
                          Container(
                            color: Color.fromRGBO(247, 247, 247, 247),

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: Center(
                                    child: InkWell(
                                        onTap: (){
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.only(top:20.0,bottom: 20),
                                          child: Text("Remove",style: TextStyle(color: Color.fromRGBO(137, 98, 31, 1),fontSize: 20),),
                                        )
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Center(
                                    child: InkWell(
                                        onTap: (){

                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.only(top:20.0,bottom: 20),
                                          child: Text("Edit",style: TextStyle(color: Color.fromRGBO(137, 98, 31, 1),fontSize: 20),),
                                        )
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}


