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
    "assets/2.png",
    "assets/4.png",
    "assets/1.png",
    "assets/3.png",
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
        title: Image.asset("assets/nike.png"),
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        actions: [Image.asset("assets/cart.png")],
        leading: IconButton(
          onPressed: () {},
          icon: Image.asset("assets/menu.png"),
        ),
      ),
      body: ListView(
        children: [
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
                        reverseTransitionDuration: Duration(seconds: 1),
                        pageBuilder: (_, __, ___) => DetailsPage(
                          index: index,
                          color: colors[index],
                          image: Images[index],
                          name: "Nike Air Max",
                          desc:
                              "Nike, Inc. is an American multinational that is engaged in the design.",
                          price: "160",
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
                                const EdgeInsets.only(right: 30, bottom: 50),
                            child: Material(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              color: colors[index],
                              child: Container(
                                width: double.infinity,
                                padding: EdgeInsets.only(left: 20, top: 30),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Nike Air Max",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 32,
                                          fontFamily: "AvenirBold"),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text("Men's Fashion Shows",
                                        style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 16)),
                                    SizedBox(
                                      height: 25,
                                    ),
                                    Text("128 \$",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 28,
                                            fontFamily: "AvenirBold")),
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
                                      margin: EdgeInsets.only(bottom: 0),
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
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 10),
            child: Text(
              "New Arivals",
              style: TextStyle(color: Colors.black87, fontSize: 20),
            ),
          ),
          Container(
            width: double.infinity,
            height: 100,
            padding: EdgeInsets.only(left: 30, right: 30),
            child: Row(
              children: [
                Container(
                  width: 120,
                  height: 100,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.all(0),
                          child: Material(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            color: Colors.grey.shade200,
                            child: Container(
                              width: 100,
                              height: 100,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Transform.rotate(
                          angle: math.pi * notifier.value,
                          child: Container(
                              width: 100,
                              height: 100,
                              alignment: Alignment.centerRight,
                              child: Image.asset(
                                "assets/new1.png",
                                fit: BoxFit.contain,
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Nike ZoomX fit",
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 18,
                            fontFamily: "AvenirBold"),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "New Running shoes",
                        style: TextStyle(color: Colors.black87, fontSize: 16),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            width: double.infinity,
            height: 100,
            padding: EdgeInsets.only(left: 30, right: 30),
            child: Row(
              children: [
                Container(
                  width: 120,
                  height: 100,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.all(0),
                          child: Material(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            color: Colors.grey.shade200,
                            child: Container(
                              width: 100,
                              height: 100,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Transform.rotate(
                          angle: math.pi * notifier.value,
                          child: Container(
                              width: 100,
                              height: 100,
                              alignment: Alignment.centerRight,
                              child: Image.asset(
                                "assets/new2.png",
                                fit: BoxFit.contain,
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Nike React Presto",
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 18,
                            fontFamily: "AvenirBold"),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Men's fation shoes",
                        style: TextStyle(color: Colors.black87, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
