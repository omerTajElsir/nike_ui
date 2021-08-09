import 'dart:math' as math;

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> headlines = [
    "All",
    "Air Max",
    "Jordans",
    "Lifestyle",
    "Running",
    "Jumbing"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Icon(Icons.check),
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.card_travel))
          ],
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu),
          ),
        ),
        body: ListView(
          children: [
            Container(
              height: 70,
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
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: 40,
                                height: 3,
                                color: Colors.black,
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
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 18),
                              ),
                            ],
                          ),
                        );
                },
              ),
            ),
            Container(
              height: 400,
              child: PageView.builder(
                controller: PageController(
                  viewportFraction: 0.8,
                  initialPage: 0,
                ),
                itemCount: headlines.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    width: 300,
                    child: Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 40),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            color: Colors.pink,
                          ),
                          child: Column(
                            children: [
                              Text(
                                "Nike Air Max",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text("Men's Fashion Shows",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18)),
                              Text("128 \$",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Transform.rotate(
                            angle: -math.pi / 4,
                            child: Container(
                                width: 250,
                                height: 250,
                                alignment: Alignment.centerRight,
                                child: Image.asset(
                                  "assets/1.png",
                                  fit: BoxFit.contain,
                                )),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
