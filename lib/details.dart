import 'dart:math' as math;

import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage(
      {Key? key, required this.index, required this.color, required this.image})
      : super(key: key);

  final int index;
  final Color color;
  final String image;

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
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
              height: 300,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(300),
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                    bottomRight: Radius.circular(0)),
                color: widget.color,
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
                height: 150,
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
                      )),
                ),
              ),
              Text(
                "Nike Air Max",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        )
      ],
    ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
