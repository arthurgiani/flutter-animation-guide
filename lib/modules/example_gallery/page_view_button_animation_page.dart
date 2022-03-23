import 'package:flutter/material.dart';

class PagewViewButtonAnimationPage extends StatefulWidget {
  const PagewViewButtonAnimationPage({Key? key}) : super(key: key);

  @override
  _PagewViewButtonAnimationPageState createState() =>
      _PagewViewButtonAnimationPageState();
}

class _PagewViewButtonAnimationPageState
    extends State<PagewViewButtonAnimationPage>
    with SingleTickerProviderStateMixin {
  late final PageController _pageController;

  int _currentIndex = 0;

  late final AnimationController animationController;
  late final Animation<double> scaleTransition;

  @override
  void initState() {
    _pageController = PageController();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 100,
      ),
    );

    scaleTransition = Tween<double>(begin: 1, end: 0.8).animate(
      animationController,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PageView'),
      ),
      body: PageView(
        controller: _pageController,
        children: [
          Container(color: Colors.red),
          Container(color: Colors.green),
          Container(color: Colors.black)
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: GestureDetector(
        onTap: () {
          final hasRemainingPages = _currentIndex != 2;
          if (hasRemainingPages) {
            _currentIndex++;
            _pageController.animateToPage(
              _currentIndex,
              duration: Duration(milliseconds: 500),
              curve: Curves.linear,
            );
          }
        },
        onTapDown: (_) {
          animationController.forward();
        },
        onTapUp: (_) {
          animationController.reverse();
        },

        /// Tap the button and see that the button shrinks and then grows
        /// again after user stops to press the button
        child: AnimatedBuilder(
          animation: animationController,
          builder: (context, _) {
            return Transform.scale(
              scale: scaleTransition.value,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  shape: BoxShape.circle,
                ),
                height: 100,
                width: 100,
                child: Icon(Icons.arrow_forward),
              ),
            );
          },
        ),
      ),
    );
  }
}
