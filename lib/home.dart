import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:nike_ui/details.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  List<String> headlines = [
    "All",
    "Air Max",
    "Jordans",
    "Lifestyle",
    "Running",
    "Jumbing"
  ];

  List<Color> colors = [
    Color(0xFFFF88BE),
    Color(0xFF85D8C5),
    Color(0xFF746BDE),
    Color(0xFFEDA76C),
  ];

  List<String> Images = [
    "assets/1.png",
    "assets/2.png",
    "assets/3.png",
    "assets/4.png",
  ];

  ValueNotifier<double> notifier = ValueNotifier<double>(0);

  late AnimationController controller;
  late Animation colorAnimation;
  late Animation colorAnimation1;

  int _previousPage = 0;
  int _currrentPage = 0;
  PageController _pageController = PageController(
    viewportFraction: 0.8,
    initialPage: 0,
  );

  void _onScroll() {
    if (_pageController.page!.toInt() == _pageController.page) {
      _previousPage = _pageController.page!.toInt();
    }
    setState(() {
      _currrentPage = _pageController.page!.toInt();
    });

    //notifier.value = _pageController.page! - _previousPage;
    controller.value = _pageController.page! - _pageController.page!.toInt();
  }

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0,
      viewportFraction: 0.8,
    )..addListener(_onScroll);

    controller = AnimationController(vsync: this);
    colorAnimation =
        Tween<double>(begin: math.pi * notifier.value / 4, end: -math.pi / 3.5)
            .animate(controller);
    colorAnimation1 =
        Tween<double>(begin: -math.pi / 3.5, end: math.pi * notifier.value / 4)
            .animate(controller);

    controller.addListener(() {
      setState(() {});
    });

    _previousPage = _pageController.initialPage;
    super.initState();
  }

  @override
  void dispose() {
    notifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Icon(Icons.check),
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.card_travel))],
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
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
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
            height: 370,
            child: PageView.builder(
              controller: _pageController,
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: Duration(seconds: 1),
                        pageBuilder: (_, __, ___) => DetailsPage(
                          index: index,
                          color: colors[index],
                          image: Images[index],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.all(5),
                    child: Stack(
                      children: [
                        Hero(
                          tag: 'header$index',
                          child: Padding(
                            padding:
                                const EdgeInsets.only(right: 30, bottom: 70),
                            child: Material(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              color: colors[index],
                              child: Container(
                                width: double.infinity,
                                padding: EdgeInsets.only(left: 10, top: 30),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Nike Air Max",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 32,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text("Men's Fashion Shows",
                                        style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 14)),
                                    SizedBox(
                                      height: 25,
                                    ),
                                    Text("128 \$",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 28,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: AnimatedBuilder(
                            animation: notifier,
                            builder: (context, _) {
                              return Hero(
                                tag: 'image$index',
                                child: Transform.rotate(
                                  angle: _currrentPage == index
                                      ? colorAnimation.value
                                      : colorAnimation1.value,
                                  child: Container(
                                      margin: EdgeInsets.only(bottom: 20),
                                      width: MediaQuery.of(context).size.width /
                                          3 *
                                          2,
                                      height:
                                          MediaQuery.of(context).size.width /
                                              3 *
                                              2,
                                      alignment: Alignment.centerRight,
                                      child: Image.asset(
                                        Images[index],
                                        fit: BoxFit.contain,
                                      )),
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
