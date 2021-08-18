import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Hero(
          tag: 'header${widget.index}',
          child: Container(
            width: 200,
            height: 100,
            margin: EdgeInsets.only(right: 40),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              color: Colors.pink,
            ),
          ),
        )
      ],
    ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
