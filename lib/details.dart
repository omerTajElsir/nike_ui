import 'dart:math' as math;

import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage(
      {Key? key, required this.index, required this.color, required this.image, required this.name, required this.desc, required this.price})
      : super(key: key);

  final int index;
  final Color color;
  final String image;
  final String name;
  final String desc;
  final String price;

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {

  List<String> headlines = [
    "Photos",
    "Colors",
    "Sizes",
    "Reviews"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Positioned(
          top: -30,
          child: Hero(
            tag: 'header${widget.index}',
            child: Container(
              height: 250,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(600),
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                    bottomRight: Radius.circular(0)),
                color: widget.color,
              ),
              child: Stack(
                children: [

                ],
              ),
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(

            children: [
              SizedBox(
                height: 120,
              ),
              Hero(
                tag: 'image${widget.index}',
                child: Transform.rotate(
                  angle: math.pi / 6,
                  child: Container(

                      margin: EdgeInsets.only(bottom: 20),
                      width: 200,
                      height: 200,
                      alignment: Alignment.centerRight,
                      child: Image.asset(
                        widget.image,
                        fit: BoxFit.contain,
                      ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 40,
          left: 15,
          child: IconButton(
            icon: Icon(Icons.arrow_back,color: Colors.white,), onPressed: () { Navigator.pop(context); },
          ),
        ),
        Positioned(
          top: 270,
          child: Container(
            height: MediaQuery.of(context).size.height-270,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: Text(
                      widget.name,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 50,top: 5,right: 20),
                    child: Text(
                      widget.desc,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 50,top: 35,right: 20,bottom: 15),
                    child: Text(
                      widget.price+"\$",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 32,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  height: 60,
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: ListView.builder(
                    itemCount: headlines.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return index == 0
                          ? Container(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          children: [
                            Text(
                              headlines[index],
                              style:
                              TextStyle(color: Colors.black, fontSize: 18),
                            )
                          ],
                        ),
                      )
                          : Container(
                        padding: EdgeInsets.all(13),
                        child: Column(
                          children: [
                            Text(
                              headlines[index],
                              style: TextStyle(
                                  color: Colors.grey.shade400, fontSize: 18),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                Container(
                  width: double.infinity,
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: EdgeInsets.all(0),
                                child: Material(
                                  borderRadius: BorderRadius.all(Radius.circular(30)),
                                  color: Colors.grey.shade200,
                                  child: Center(
                                      child: Image.asset(
                                        "assets/1.png",
                                        width: 80,
                                        height: 80,
                                        fit: BoxFit.cover,
                                      )),
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 100,
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: EdgeInsets.all(0),
                                child: Material(
                                  borderRadius: BorderRadius.all(Radius.circular(30)),
                                  color: Colors.grey.shade200,
                                  child: Center(
                                      child: Image.asset(
                                        "assets/top.png",
                                        width: 80,
                                        height: 80,
                                        fit: BoxFit.cover,
                                      )),
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 100,
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: EdgeInsets.all(0),
                                child: Material(
                                  borderRadius: BorderRadius.all(Radius.circular(30)),
                                  color: Colors.grey.shade200,
                                  child: Center(
                                      child: Image.asset(
                                        "assets/bottom.png",
                                        width: 80,
                                        height: 80,
                                        fit: BoxFit.cover,
                                      )),
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 30,),

                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  child: Material(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Colors.black,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 40,right: 40),
                      child: Container(
                        width: MediaQuery.of(context).size.width/2,
                        height: 70,
                        child: Center(
                            child: Text("But Now",style: TextStyle(color: Colors.white),)),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 30,),
              ],
            ),
          ),
        ),


        // Positioned(
        //   bottom: 20,
        //   child:
        // ),
      ],
    ), // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
