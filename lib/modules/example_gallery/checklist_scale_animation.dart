import 'package:flutter/material.dart';

class ChecklistScaleAnimation extends StatefulWidget {
  const ChecklistScaleAnimation({Key? key}) : super(key: key);

  @override
  _ChecklistScaleAnimationState createState() =>
      _ChecklistScaleAnimationState();
}

class _ChecklistScaleAnimationState extends State<ChecklistScaleAnimation>
    with SingleTickerProviderStateMixin {
  late final PageController _pageController;

  late final AnimationController animationController;

  late final Animation<double> checkListScaleTransition;
  late final Animation<Color?> containerColorTransition;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 1,
      ),
    );
    checkListScaleTransition = Tween<double>(begin: 0, end: 1).animate(
      animationController,
    );
    containerColorTransition =
        ColorTween(begin: Colors.yellow, end: Colors.green).animate(
      animationController,
    );
    _pageController = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checklist Scale'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            if (animationController.status == AnimationStatus.completed) {
              animationController.reverse();
              _pageController.animateToPage(
                0,
                duration: Duration(seconds: 1),
                curve: Curves.linear,
              );
            } else {
              animationController.forward();
              _pageController.animateToPage(
                1,
                duration: Duration(seconds: 1),
                curve: Curves.linear,
              );
            }
          },
          child: AnimatedBuilder(
            animation: animationController,
            builder: (context, _) {
              return Container(
                height: 70,
                decoration: BoxDecoration(
                  color: containerColorTransition.value,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                width: MediaQuery.of(context).size.width * 0.5,
                child: Row(
                  children: [
                    _ChecklistContainerWidget(
                      checkListScaleTransition: checkListScaleTransition,
                    ),
                    Expanded(
                      child: _TextsPageViewWidget(
                        pageController: _pageController,
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _TextsPageViewWidget extends StatelessWidget {
  const _TextsPageViewWidget({
    Key? key,
    required PageController pageController,
  })  : _pageController = pageController,
        super(key: key);

  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      scrollDirection: Axis.vertical,
      children: [
        Center(
          child: Text(
            'Text1',
            style: TextStyle(fontSize: 20),
          ),
        ),
        Center(
          child: Text(
            'Text2',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ],
    );
  }
}

class _ChecklistContainerWidget extends StatelessWidget {
  const _ChecklistContainerWidget({
    Key? key,
    required this.checkListScaleTransition,
  }) : super(key: key);

  final Animation<double> checkListScaleTransition;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Transform.scale(
        scale: checkListScaleTransition.value,
        child: Icon(Icons.check),
      ),
    );
  }
}
