import 'package:deluxify/aboutUs.dart';
import 'package:deluxify/cart.dart';
import 'package:deluxify/contactUs.dart';
import 'package:deluxify/favourite.dart';
import 'package:deluxify/products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:native_share/native_share.dart';
import 'package:url_launcher/url_launcher.dart';



const URL = "http://www.google.com";

class HomePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}


class _HomePageState extends State<HomePage> {
  get name => null;

  navigateToAboutUs() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => about()));
  }
  navigateToContactUs() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => contact()));
  }
  navigateToFavourite() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => favourite()));
  }
  navigateToProducts() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => products()));
  }
  navigateToCart() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => cart()));
  }
  _getgriditems(){
    List<Widget> widgets = [];
    Map<String,String> icon={"http://aelida.com/wp-content/uploads/2012/12/retro-handbag.jpg":"Bags","https://images-na.ssl-images-amazon.com/images/I/71yPA9JDiiL._UY395_.jpg":"Jewellery","https://i.pinimg.com/236x/ed/23/87/ed23872180d03a750d0a3d39ef5ab3a1--oakley-sunglasses-ray-ban-sunglasses-outlet.jpg":"Sunglasses","https://raymondleejewelers.net/wp-content/uploads/2019/07/woman-wearing-mens-watches-trend.jpg":"Watches"};
    var keys = icon.keys.toList();
    var values = icon.values.toList();
    for(int i=0;i<keys.length;i++){
      widgets.add(
          GridViewItems(keys[i], values[i], navigateToProducts)
      );
    }
    return widgets;
  }

  _getListData() {
    List<Widget> widgets = [];
    Map<String,String> icon={"logo-icon.png":"All","bag.png":"Bags","jewel.png":"jewellery","sunglass.png":"Sunglasses","watch.png":"watches"};
    var keys = icon.keys.toList();
    var values = icon.values.toList();
    for (int i = 0; i < keys.length; i++) {
      widgets.add(Column(
        children: <Widget>[
          new RawMaterialButton(
            onPressed: () {},
            child: IconButton(
              icon: Image.asset("assets/"+keys[i]), onPressed: navigateToProducts,
            ),
            shape: new CircleBorder(),
            fillColor: Color.fromRGBO(233, 233, 233, 1),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(values[i]),
          )
        ],
      ));
    }
    return widgets;
  }


  @override
  void initState() {
    super.initState();
  }

  // version controlling here
  final version = Text(
    'Version Beta\n\n Built By VR Consulting',
    textAlign: TextAlign.center,
    style: TextStyle(color: Colors.grey,letterSpacing: 3,),
  );

  bool showsearch=false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    Widget showpopup(){
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Dialog(
              shape: new RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
              child: new Container(
                width: MediaQuery.of(context).size.width,
                decoration: new BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                ),
                child: new Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Container(
                      child: Center(child: Text("Get Started",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),)),
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      color: Color.fromRGBO(137, 98, 31, 1),
                    ),
                    new Container(
                      child: Padding(
                        padding: const EdgeInsets.only(top:30.0,bottom: 8,left: 30,right: 30),
                        child: Center(child: Text("Access our full collection, earn rewards and unlock all our features.",style: TextStyle(color: Colors.black,fontSize: 18,),textAlign: TextAlign.center,)),
                      ),
                      width: MediaQuery.of(context).size.width,
                    ),
                    new Row(
                      children: <Widget>[
                        new Expanded(
                          flex: 1,
                          child: new Container(
                            padding: EdgeInsets.all(13),
                            margin: EdgeInsets.all(10),
                            decoration: new BoxDecoration(
                              borderRadius: BorderRadius.circular(0),
                              color: Color.fromRGBO(137, 98, 31, 1)
                            ),
                            child: Center(child: new Text("Create an Account",maxLines: 2,style: TextStyle(color: Colors.white,fontSize: 16))),
                          ),
                        ),
                        new SizedBox(width: 0,),
                        new Expanded(
                          flex: 1,
                          child: new Container(
                            padding: EdgeInsets.all(13),
                            margin: EdgeInsets.all(10),
                            decoration: new BoxDecoration(
                                borderRadius: BorderRadius.circular(0),
                                color: Colors.black
                            ),
                            child: Center(child: new Text("Sign In",maxLines: 2,style: TextStyle(color: Colors.white,fontSize: 16),)),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          });
        }


    Widget logo(){
      return new Hero(
        tag: 'hero',
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('assets/logo.png',fit: BoxFit.fill,height: 120,),
            ),
          ],
        ),
      );
    }//WillPop scope used to disable the back button in home page
    return WillPopScope(
      //required for disabling back
      onWillPop: () async => false,

      child: MaterialApp(
          title: "MyApp",
          theme: new ThemeData(
            primaryColor: Color.fromRGBO(137, 98, 31, 1),
            primaryColorLight: Color.fromRGBO(137, 98, 31, 1),
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
          ),

          home: DefaultTabController(
            length: 3,
            child: Scaffold(
                appBar: new AppBar(
                  iconTheme: IconThemeData(color: Colors.white),
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
                        child: Text("Discovery"),
                      ),
                    ],
                  ),
                  centerTitle: true,
                  actions: <Widget>[
                    new IconButton(
                      icon: new Icon(Icons.search),
                      iconSize: 30,
                      color: Colors.white,
                      onPressed: () {
                        setState(() {
                          showsearch==false?showsearch=true:showsearch=false;
                        });
                      },
                    ),
                  ],

                  //for tabs in header
                ),
                bottomNavigationBar: BottomNavigationBar(
                  onTap: null,
                  backgroundColor: Color.fromRGBO(137, 98, 31, 1),
                  selectedItemColor: Colors.black,
                  unselectedItemColor: Colors.white,
                  type: BottomNavigationBarType.fixed,
                  currentIndex: 2,
                  items: <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: InkWell(
                          onTap: null,
                          child: Icon(Icons.home,)
                      ),
                      title: Text("",style: TextStyle(fontSize: 0.1),),
                    ),
                    BottomNavigationBarItem(
                      icon: InkWell(
                          onTap: showpopup,
                          child: Icon(Icons.bookmark_border)),
                      title: Text("",style: TextStyle(fontSize: 0.1),),
                    ),
                    BottomNavigationBarItem(
                      backgroundColor: Color.fromRGBO(219, 198, 154,1),
                      icon: Container(
                        decoration: new BoxDecoration(color: Color.fromRGBO(222, 195, 155, 1)),
                        child: Padding(
                          padding: const EdgeInsets.only(right:18.0,left: 18,bottom: 8,top: 8),
                          child: InkWell(
                              onTap: navigateToCart,
                              child: Icon(Icons.shopping_cart)),
                        ),
                      ),
                      title: Text("",style: TextStyle(fontSize: 0.1),),
                    ),
                    BottomNavigationBarItem(
                      icon: InkWell(
                        onTap: navigateToFavourite,
                          child: Icon(Icons.favorite_border)),
                      title: Text("",style: TextStyle(fontSize: 0.1),),
                    ),
                    BottomNavigationBarItem(
                      icon: InkWell(
                          onTap: showpopup,
                          child: Icon(Icons.account_circle)),
                      title: Text("",style: TextStyle(fontSize: 0.1),),
                    ),
                  ],
                ),
                drawer: Drawer(
                    child: Container(
                      child: ListView(
                        padding: EdgeInsets.zero,
                        children: <Widget>[
                          new SizedBox(
                            height: 200,
                            child: DrawerHeader(
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(137, 98, 31, 1),
                                ),
                                child: Container(
                                  child: Column(
                                    children: <Widget>[
                                      logo(),

                                    ],
                                  ),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey.shade200))),
                              child: InkWell(
                                splashColor: Colors.amberAccent,
                                onTap: navigateToContactUs,
                                child: Container(
                                  height: 50,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Icon(Icons.contact_mail,color: Color.fromRGBO(137, 98, 31, 1),),
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Text(
                                              "Contact Us",
                                              style: TextStyle(
                                                fontSize: 16.0,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey.shade200))),
                              child: InkWell(
                                splashColor: Colors.amberAccent,
                                onTap: navigateToAboutUs,
                                child: Container(
                                  height: 50,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Icon(Icons.contacts,color: Color.fromRGBO(137, 98, 31, 1),),
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Text(
                                              "About Us",
                                              style: TextStyle(
                                                fontSize: 16.0,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey.shade200))),
                              child: InkWell(
                                splashColor: Colors.amberAccent,
                                onTap: (){launch('tel:<+9779867816929>');},
                                child: Container(
                                  height: 50,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Icon(Icons.phone_in_talk,color: Color.fromRGBO(137, 98, 31, 1),),
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Text(
                                              "Call Us",
                                              style: TextStyle(
                                                fontSize: 16.0,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey.shade200))),
                              child: InkWell(
                                splashColor: Colors.amberAccent,
                                onTap: null,
                                child: Container(
                                  height: 50,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Icon(Icons.chat,color: Color.fromRGBO(137, 98, 31, 1),),
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Text(
                                              "Chat With Us",
                                              style: TextStyle(
                                                fontSize: 16.0,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey.shade200))),
                              child: InkWell(
                                splashColor: Colors.amberAccent,
                                onTap: (){NativeShare.share({'title':'Deluxify App','url':'ankitshah.com.np','image':null});},
                                child: Container(
                                  height: 50,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Icon(Icons.share,color: Color.fromRGBO(137, 98, 31, 1),),
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Text(
                                              "Share This App",
                                              style: TextStyle(
                                                fontSize: 16.0,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),

//                          Center(
//                            child: Padding(
//                              padding: const EdgeInsets.all(8.0),
//                              child: Padding(
//                                padding: const EdgeInsets.only(top: 90.0),
//                                child: version,
//                              ),
//                            ),
//                          ),
                        ],
                      ),
                    )),
                // Starting the code for tab bars...
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: showsearch==true?Card(

                          child: Row(
                            textDirection: TextDirection.rtl,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(right:8.0),
                                child: FlatButton(
                                    color: Color.fromRGBO(137, 98, 31, 1),
                                    textColor: Colors.white,
                                    disabledColor: Colors.grey,
                                    disabledTextColor: Colors.black,
                                    padding: EdgeInsets.all(8.0),
                                    splashColor: Color.fromRGBO(115, 100, 50, 1),
                                    onPressed: () {},
                                    child: Text("SEARCH")
                                ),
                              ),
                              Expanded(child: Padding(
                                padding: const EdgeInsets.only(left:8.0),
                                child: TextFormField(
                                  autofocus: true,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Search Your Product'
                                  ),
                                ),
                              ))
                            ],
                          ),
                        ):null,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: SizedBox(
                          height: 68,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: _getListData(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:8.0),
                        child: SizedBox(
                            height: 160.0,
                            child: Carousel(
                              images: [
                                AssetImage("assets/slider1.jpg"),
                                AssetImage("assets/slider2.jpg"),
                                AssetImage("assets/slider3.jpg"),
                              ],
                              dotSize: 4.0,
                              dotSpacing: 10.0,
                              dotColor: Colors.lightGreenAccent,
                              indicatorBgPadding: 5.0,
                              dotBgColor: Colors.transparent,
//                              borderRadius: true,
                              overlayShadowSize: 0.3,
                            )
                        ),
                      ),
                      GridView(
                          controller: new ScrollController(keepScrollOffset: false),
                          shrinkWrap: true,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 1.1,
                            crossAxisCount: 2,
                            mainAxisSpacing: 1.0,
                            crossAxisSpacing: 1.0,
                          ),
                          children: _getgriditems()
                      ),
                    ],
                  ),
                )
            ),
          )),
    );
  }
}




class GridViewItems extends StatelessWidget{
  String image;
  String text;
  Function onTap;
  GridViewItems(this.image, this.text, this.onTap);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(

        child: InkWell(
          splashColor: Colors.amberAccent,
          onTap: onTap,
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                    height: 115,
                    width: 150,
                    decoration: new BoxDecoration(
                        shape: BoxShape.rectangle,
                        image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: new NetworkImage(
                                image)
                        )
                    )
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      text+"",
                      textAlign: TextAlign.center
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

}

