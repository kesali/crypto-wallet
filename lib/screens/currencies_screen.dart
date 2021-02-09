import 'dart:math';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class CurrenciesScreen extends StatefulWidget {
  @override
  _CurrenciesScreenState createState() => _CurrenciesScreenState();
}

class _CurrenciesScreenState extends State<CurrenciesScreen> {
  final PageController _pageController = PageController();
  double _currentPosition = 0;

  @override
  void initState() {
    _pageController.addListener(() {
      _currentPosition = _pageController.page;
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF5F627D),
            Color(0xFF313347),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text('Your Coins'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: DotsIndicator(
                  dotsCount: 3,
                  position: _currentPosition,
                  decorator: DotsDecorator(
                    activeColor: Colors.white,
                    size: Size(4, 4),
                  ),
                ),
              ),
              Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.002)
                  ..rotateY(pi * _currentPosition),
                child: Container(
                  margin: EdgeInsets.only(bottom: 24),
                  width: double.infinity,
                  height: 190,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 10,
                        color: Colors.black54,
                        spreadRadius: -5,
                      )
                    ],
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF08AEEA),
                        Color(0xFF2AF598),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: 3,
                  itemBuilder: (context, index) => Container(
                    child: ListView.separated(
                      itemBuilder: (context, index) => ListTile(
                        title: Text(
                          index.toString(),
                        ),
                      ),
                      separatorBuilder: (context, index) => Divider(),
                      itemCount: 10,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
