import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utilities/styles.dart';
import '../utilities/useful_fct.dart';
import 'login.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Color(0xFFf4d160),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.1, 0.4, 0.7, 0.9],
            colors: [
              Color(0xFF4C97DE),
              Color(0xFF3D7BB5),
              Color(0xFF316494),
              Color(0xFF28527A),
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => goOn(LoginPage(), context),
                  child: Text(
                    'Skip',
                    style: TextStyle(
                      color: Color(0xFFfbeeac),
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              Container(
                height: 600.0,
                child: PageView(
                  physics: ClampingScrollPhysics(),
                  controller: _pageController,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(40.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Center(
                            child: Image.asset(
                              'assets/onboarding0.png',
                              height: 300.0,
                              width: 300.0,
                            ),
                          ),
                          SizedBox(height: 30.0),
                          Text(
                            'Connect people\naround the world',
                            style: kTitleStyle,
                          ),
                          Text(
                            'Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt',
                            style: kSubtitleStyle,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(40.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Center(
                            child: Image.asset(
                              'assets/onboarding1.png',
                              height: 300.0,
                              width: 300.0,
                            ),
                          ),
                          Text(
                            'Live your life smarter\nwith us!',
                            style: kTitleStyle,
                          ),
                          Text(
                            'Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt',
                            style: kSubtitleStyle,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(40.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Center(
                            child: Image.asset(
                              'assets/onboarding2.png',
                              height: 300.0,
                              width: 300.0,
                            ),
                          ),
                          Text(
                            'Get a new experience\nof imagination',
                            style: kTitleStyle,
                          ),
                          Text(
                            'Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ',
                            style: kSubtitleStyle,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buildPageIndicator(),
              ),
              _currentPage != _numPages - 1
                  ? Expanded(
                      child: Align(
                        alignment: FractionalOffset.bottomRight,
                        child: TextButton(
                          onPressed: () {
                            _pageController.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                'Next',
                                style: TextStyle(
                                  color: Color(0xFFfbeeac),
                                  fontSize: 22.0,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: Color(0xFFfbeeac),
                                size: 30.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : Text(''),
            ],
          ),
        ),
      ),
      bottomSheet: _currentPage == _numPages - 1
          ? Container(
              height: 100.0,
              width: double.infinity,
              color: Color(0xFF8ac4d0),
              child: GestureDetector(
                onTap: () => goOn(LoginPage(), context),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 30.0),
                    child: Text(
                      'Get started',
                      style: TextStyle(
                        color: Color(0xFFfbeeac),
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            )
          : Text(''),
    );
  }
}
