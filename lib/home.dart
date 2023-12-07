import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        onScroll();
      });
    super.initState();
  }

  double _scrollOffSet = 0.0;

  void onScroll() {
    setState(() {
      _scrollOffSet = _scrollController.offset;
      print(_scrollOffSet);
    });
  }

  //Layers Speed
  double _layer1Speed = 0.5;
  double _layer2Speed = 0.45;
  double _layer3Speed = 0.42;
  double _layer4Speed = 0.375;
  double sunSpeed = 0.25;

  // Layers Horizontal Speed
  double _layer1HSpeed = 0.1;
  double _layer2HSpeed = 0.08;
  double _layer3HSpeed = 0.075;
  double _layer4HSpeed = 0.07;

  bool showText = false;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var layoutHeight = screenSize.height * 3;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 66, 240, 210),
              Color.fromARGB(255, 253, 244, 193),
            ],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: screenSize.height * 0.4 + (_scrollOffSet + sunSpeed),
              right: screenSize.width * 0.3,
              left: 0,
              child: SvgPicture.asset('asserts/images/sun.svg'),
            ),
            Positioned(
              right: _layer4HSpeed * _scrollOffSet * -1,
              left: _layer4HSpeed * _scrollOffSet * -1,
              bottom: -20 + _layer4Speed * _scrollOffSet,
              child: SvgPicture.asset('asserts/images/mountains-layer-4.svg'),
            ),
            Positioned(
              right: _layer3HSpeed * _scrollOffSet * -1,
              left: _layer3HSpeed * _scrollOffSet * -1,
              bottom: -20 + _layer3Speed * _scrollOffSet,
              child: SvgPicture.asset('asserts/images/mountains-layer-2.svg'),
            ),
            Positioned(
              right: _layer2HSpeed * _scrollOffSet * -1,
              left: _layer2HSpeed * _scrollOffSet * -1,
              bottom: -30 + _layer2Speed * _scrollOffSet,
              child: SvgPicture.asset('asserts/images/trees-layer-2.svg'),
            ),
            Positioned(
              bottom: -65 + _layer1Speed * _scrollOffSet,
              right: _layer1HSpeed * _scrollOffSet * -1,
              left: _layer1HSpeed * _scrollOffSet * -1,
              child: SvgPicture.asset(
                'asserts/images/layer-1.svg',
                fit: BoxFit.fitWidth,
              ),
            ),
            Positioned(
                top: screenSize.height + (_layer1Speed * _scrollOffSet * -1),
                right: 0,
                left: 0,
                height: screenSize.height,
                child: Container(
                  color: Colors.black,
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          "Harsh Mankotia",
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "This is the Parallax Effect",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
            Positioned.fill(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Container(
                  height: layoutHeight,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
