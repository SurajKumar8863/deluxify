import 'package:flutter/material.dart';
import 'package:flutter_range_slider/flutter_range_slider.dart' as slider;
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:vertical_tabs/vertical_tabs.dart';


class products extends StatefulWidget {
  @override
  _productsState createState() => _productsState();
}

class _productsState extends State<products> {

  @override
  void initState(){

  }
  bool showsort=false;
  bool showfilter=false;
  double _lowerValue = 100.0;
  double _upperValue = 10000.0;
  double _lowerValueFormatter = 100.0;
  double _upperValueFormatter = 10000.0;
  Map<String, bool> values = {
    'SubCat 1': false,
    'SubCat 2': false,
    'SubCat 3': false,
    'SubCat 4': false,
    'SubCat 5': false,
  };


  List<Map<String,String>> productslist=[
    {'productname':'Name 1','url':'https://img.freepik.com/free-vector/beauty-skin-care-background_52683-728.jpg?size=626&ext=jpg','price':'100'},
    {'productname':'Name 1','url':'https://static01.nyt.com/images/2019/10/22/multimedia/22xp-sundayriley/22xp-sundayriley-articleLarge.jpg','price':'100'},
    {'productname':'Name 1','url':'https://cdn.shopify.com/s/files/1/1944/0163/products/skin-care-system-system-level-1-pos-1_1150x.png?v=1571851004','price':'100'},
    {'productname':'Name 1','url':'https://marketing.fitbit.com/images/og-images/versa2-full-40c54dc4b0d18f40ea5bb7d51ac69cd3.jpg','price':'100'},
    {'productname':'Name 1','url':'https://cdn.shopify.com/s/files/1/2028/2057/files/sk-products-hand-new-m1.png?587782','price':'100'},
    {'productname':'Name 1','url':'http://www.mamiyaleaf.com/assets/slider/product/product_slider_heinz_baumann.jpg','price':'100'},
    {'productname':'Name 1','url':'https://methodhome.com/wp-content/uploads/laundry_p-v2-500x500.png','price':'100'},
    {'productname':'Name 1','url':'https://kevinmurphy.com.au/wp-content/uploads/2017/06/product-type-2.png','price':'100'},
    {'productname':'Name 1','url':'https://static.home.product.which.co.uk/home/media/images/676x480_ct/2865_Oppo_Reno_2_Product_Desktop_1__8f32a882e007db4c680c30d30ac76dfb.jpg','price':'100'},


  ];

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
                child: Text("Products"),
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                InkWell(
                  onTap: (){
                    setState(() {
                      showfilter==false?showfilter=true:showfilter=false;
                      showfilter==true?showsort=false:showfilter=false;

                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top:8.0,left: 20,),
                    child: Container(
                      decoration: new BoxDecoration(border: Border(
                        bottom: BorderSide( //                    <--- top side
                          color: Colors.black,
                          width: 1.5,
                        ),
                      )),
                      width: MediaQuery.of(context).size.width*0.40,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom:5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("Filter",style: TextStyle(fontSize: 18),),
                            Icon(Icons.arrow_drop_down)
                          ],
                        ),
                      ),),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:8.0,left: 20,),
                  child: InkWell(
                    onTap: (){
                      setState(() {
                        showsort==false?showsort=true:showsort=false;
                        showsort==true?showfilter=false:showsort=false;

                      });
                    },
                    child: Container(
                      decoration: new BoxDecoration(border: Border(
                        bottom: BorderSide( //                    <--- top side
                          color: Colors.black,
                          width: 1.5,
                        ),
                      )),
                      width: MediaQuery.of(context).size.width*0.40,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom:5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("Sort",style: TextStyle(fontSize: 18),),
                            Icon(Icons.arrow_drop_down)
                          ],
                        ),
                      ),),
                  ),
                ),

              ],
            ),
            showsort==true?Container(
              decoration: new BoxDecoration(color: Color.fromRGBO(233,233,233, 1)),
              child: Padding(
                padding: const EdgeInsets.only(right:25.0,left: 25,top: 10,bottom: 10),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(child: Icon(Icons.cancel),),
                        Padding(
                          padding: const EdgeInsets.only(left:15.0),
                          child: Text("Sort By:",style: TextStyle(fontSize: 20,color: Colors.black),),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:10.0,bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Popularity",style: TextStyle(fontSize: 20,color: Colors.black),),
                          Padding(
                            padding: const EdgeInsets.only(right:18.0),
                            child: Container(child: Icon(Icons.radio_button_checked),),
                          ),

                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:10.0,bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Whats New",style: TextStyle(fontSize: 20,color: Colors.black),),
                          Padding(
                            padding: const EdgeInsets.only(right:18.0),
                            child: Container(child: Icon(Icons.radio_button_unchecked),),
                          ),

                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:10.0,bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Price High to Low",style: TextStyle(fontSize: 20,color: Colors.black),),
                          Padding(
                            padding: const EdgeInsets.only(right:18.0),
                            child: Container(child: Icon(Icons.radio_button_unchecked),),
                          ),

                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:10.0,bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Price Low to High",style: TextStyle(fontSize: 20,color: Colors.black),),
                          Padding(
                            padding: const EdgeInsets.only(right:18.0),
                            child: Container(child: Icon(Icons.radio_button_unchecked),),
                          ),

                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:10.0,bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Nearest to Me",style: TextStyle(fontSize: 20,color: Colors.black),),
                          Padding(
                            padding: const EdgeInsets.only(right:18.0),
                            child: Container(child: Icon(Icons.radio_button_unchecked),),
                          ),

                        ],
                      ),
                    ),


                  ],
                ),
              ),
            ):SizedBox(),
            showfilter==true?Container(
              decoration: new BoxDecoration(color: Color.fromRGBO(233,233,233, 1)),
              child: Column(
                children: <Widget>[
                  new Container(
                    decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            color: Colors.black,
                            width: 0.5
                          )
                        )
                    ),
                    child:null,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right:25.0,left: 25,top: 0,bottom: 0),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right:20.0,left: 20,top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Price",style: TextStyle(fontSize: 16, color: Colors.black),),
                              Text("Any Price",style: TextStyle(fontSize: 16, color: Colors.black),)
                            ],
                          ),
                        ),
                        SliderTheme(
                          data: SliderThemeData(
                            activeTrackColor: Color.fromRGBO(137, 98, 31, 1),
                            activeTickMarkColor: Color.fromRGBO(137, 98, 31, 1),
                            disabledActiveTickMarkColor: Color.fromRGBO(137, 98, 31, 1),
                            disabledActiveTrackColor: Color.fromRGBO(137, 98, 31, 1),
                            valueIndicatorColor: Color.fromRGBO(137, 98, 31, 1),
                            thumbColor: Color.fromRGBO(137, 98, 31, 1),
                            trackHeight: 1,
                          ),
                          child: slider.RangeSlider(
                            min: 100,
                            max: 10000,
                            lowerValue: _lowerValue,
                            upperValue: _upperValue,
                            divisions: 100,
                            touchRadiusExpansionRatio: 10,
                            showValueIndicator: true,

                            valueIndicatorMaxDecimals: 0,
                            onChanged: (double newLowerValue, double newUpperValue) {
                              setState(() {
                                _lowerValue = newLowerValue;
                                _upperValue = newUpperValue;
                              });
                            },
                            onChangeStart: (double startLowerValue, double startUpperValue) {
                              print('Started with values: $startLowerValue and $startUpperValue');
                            },
                            onChangeEnd: (double newLowerValue, double newUpperValue) {
                              print('Ended with values: $newLowerValue and $newUpperValue');
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right:20.0,left: 20,bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("100",style: TextStyle(fontSize: 16, color: Colors.black),),
                              Text(_lowerValue.round().toString()+" to "+_upperValue.round().toString(),style: TextStyle(fontSize: 16, color: Color.fromRGBO(137, 98, 31, 1),),),
                              Text("100000",style: TextStyle(fontSize: 16, color: Colors.black),)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  new Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Color.fromRGBO(177, 177, 177, 1),
                                width: 0.5
                            )
                        )
                    ),
                    child:null,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 10,
                        child: Container(
                          height: MediaQuery.of(context).size.height*0.40,
                          child: VerticalTabs(
                            selectedTabBackgroundColor: Colors.white,
//                            contentScrollAxis: Axis.vertical,
                            tabsWidth: MediaQuery.of(context).size.width*0.40,

                            tabs: <Tab>[
                              Tab(child: Text('Ideal for',style: TextStyle(color: Colors.black),)),
                              Tab(child: Text('Brand',style: TextStyle(color: Colors.black),)),
                              Tab(child: Text('Category 1',style: TextStyle(color: Colors.black),)),
                              Tab(child: Text('Category 2',style: TextStyle(color: Colors.black),)),
                              Tab(child: Text('Testing Cat 1',style: TextStyle(color: Colors.black),)),
                              Tab(child: Text('Testing Cat 2',style: TextStyle(color: Colors.black),)),
                            ],
                            contents: <Widget>[

                              Container(
                                  child: ListView(
                                      children: values.keys.map((String key) {
                                        return new CheckboxListTile(
                                          activeColor: Colors.black,
                                          title: new Text(key,style: TextStyle(color: Colors.black),),
                                          value: values[key],
                                          onChanged: (bool value) {
                                            setState(() {
                                              values[key] = value;
                                            });
                                          },
                                        );
                                      }).toList()), padding: EdgeInsets.all(20)
                              ),
                              Container(
                                  child: ListView(
                                      children: values.keys.map((String key) {
                                        return new CheckboxListTile(
                                          activeColor: Colors.black,

                                          title: new Text(key,style: TextStyle(color: Colors.black),),
                                          value: values[key],
                                          onChanged: (bool value) {
                                            setState(() {
                                              values[key] = value;
                                            });
                                          },
                                        );
                                      }).toList()), padding: EdgeInsets.all(20)
                              ),
                              Container(
                                  child: ListView(
                                      children: values.keys.map((String key) {
                                        return new CheckboxListTile(
                                          activeColor: Colors.black,

                                          title: new Text(key,style: TextStyle(color: Colors.black),),
                                          value: values[key],
                                          onChanged: (bool value) {
                                            setState(() {
                                              values[key] = value;
                                            });
                                          },
                                        );
                                      }).toList()), padding: EdgeInsets.all(20)
                              ),
                              Container(
                                  child: ListView(
                                      children: values.keys.map((String key) {
                                        return new CheckboxListTile(
                                          activeColor: Colors.black,

                                          title: new Text(key,style: TextStyle(color: Colors.black),),
                                          value: values[key],
                                          onChanged: (bool value) {
                                            setState(() {
                                              values[key] = value;
                                            });
                                          },
                                        );
                                      }).toList()), padding: EdgeInsets.all(20)
                              ),
                              Container(
                                  child: ListView(
                                      children: values.keys.map((String key) {
                                        return new CheckboxListTile(
                                          activeColor: Colors.black,

                                          title: new Text(key,style: TextStyle(color: Colors.black),),
                                          value: values[key],
                                          onChanged: (bool value) {
                                            setState(() {
                                              values[key] = value;
                                            });
                                          },
                                        );
                                      }).toList()), padding: EdgeInsets.all(20)
                              ),
                              Container(
                                  child: ListView(
                                      children: values.keys.map((String key) {
                                        return new CheckboxListTile(
                                          activeColor: Colors.black,
                                          title: new Text(key,style: TextStyle(color: Colors.black),),
                                          value: values[key],
                                          onChanged: (bool value) {
                                            setState(() {
                                              values[key] = value;
                                            });
                                          },
                                        );
                                      }).toList()), padding: EdgeInsets.all(20)
                              ),


                            ],
                            ),
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Color.fromRGBO(177, 177, 177, 1),
                                      width: 0.5
                                  ),
                                  right: BorderSide(
                                      color: Color.fromRGBO(177, 177, 177, 1),
                                      width: 0.5
                                  )
                              )
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Center(
                          child: InkWell(
                            onTap: (){
                              setState(() {
                                showfilter=false;
                              });
                            },
                              child: Padding(
                                padding: const EdgeInsets.only(top:20.0,bottom: 20),
                                child: Text("Clear",style: TextStyle(color: Color.fromRGBO(137, 98, 31, 1),fontSize: 20),),
                              )
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Center(
                          child: InkWell(
                            onTap: (){
                              setState(() {
                                showfilter=false;
                              });
                            },
                              child: Padding(
                                padding: const EdgeInsets.only(top:20.0,bottom: 20),
                                child: Text("Apply",style: TextStyle(color: Color.fromRGBO(137, 98, 31, 1),fontSize: 20),),
                              )
                          ),
                        ),
                      )
                    ],
                  )

                ],
              ),
            ):SizedBox(),
            Flexible(
              child: SingleChildScrollView(
                child: GridView.builder(
                    physics: ScrollPhysics(),
                    gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: productslist.length,
                    itemBuilder: (BuildContext ctx,int index){
                      return Padding(
                        padding: const EdgeInsets.only(left:20.0,right: 20,top: 15),
                        child: Hero(
                          tag: Text(productslist[index]['productname'],style: TextStyle(fontSize: 22,color: Colors.amber,),),
                          child: Material(
                            child: InkWell(
                              onTap: (){
//                          navigateToDetail(_posts[index]);
                              },
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
                                                    productslist[index]['url'])
                                            )
                                        )
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top:8.0),
                                      child: Text(productslist[index]['productname']+"", textAlign: TextAlign.left,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)
                                      ),
                                    ),
                                    Text("Rs. "+ productslist[index]['price']+"", textAlign: TextAlign.left,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ],
        )
    );
  }
}


