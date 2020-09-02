import 'package:flutter/material.dart';
import 'package:flutter_animation_guide/components/custom_scaffold.dart';

class ImplicitAnimationsIntroPage extends StatefulWidget {
  @override
  _ImplicitAnimationsIntroPageState createState() =>
      _ImplicitAnimationsIntroPageState();
}

class _ImplicitAnimationsIntroPageState
    extends State<ImplicitAnimationsIntroPage> with TickerProviderStateMixin {
  AnimationController _firstContainerController;

  AnimationController _secondContainerController;
  AnimationStatus _secondControllerStatus;

  @override
  void initState() {
    _firstContainerController =
        AnimationController(vsync: this, duration: Duration(seconds: 3))
          ..repeat();

    _secondContainerController =
        AnimationController(vsync: this, duration: Duration(seconds: 3))
          ..addStatusListener((status) {
            _secondControllerStatus = status;
            if (_secondControllerStatus == AnimationStatus.completed) {
              _secondContainerController.reverse();
            } else if (_secondControllerStatus == AnimationStatus.dismissed) {
              _secondContainerController.forward();
            }
          })
          ..forward();

    super.initState();
  }

  @override
  void dispose() {
    _firstContainerController.dispose();
    _secondContainerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: Text("Introduction"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "What implicit animation is?",
            style: Theme.of(context).textTheme.headline1,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Implicit animation represents the simplest and easiest way to create visual effects in the widgets of your UI.",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "In a nutshell, when you decide to use an implicit animation widget you're making a trade off between control and simplicity, where an widget will manage all the animation effects for you.",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "A huge amount of widgets that we use on a daily basis as a Flutter developer already have an animated version like: Container, Positioned, Align and many others.",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            "When implicit animations will be the best option for me?",
            style: Theme.of(context).textTheme.headline2,
          ),
          SizedBox(height: 20),
          Text(
            "1. Your animation must not repeat forever during your page's lifecycle, or while a certain condition is true. It must start and end under determined parameters.",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(height: 10),
          Text(
            "2. The values of your animation process must be continuous. You can see this effect on the right container, where it becomes large and then starts to shrink again. Implicit animations works quite well in this scenario. If you want the left container animation, you must look for an explicit animation.",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ScaleTransition(
                scale: _firstContainerController,
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.red,
                ),
              ),
              SizedBox(width: 20),
              ScaleTransition(
                scale: _secondContainerController,
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            "3. When you dont want to animate multiple widgets together in a coordinated way.",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(height: 20),
          Text(
            "Now, go back to the previous screen and check the buttons that will take you to an explained tutorial of the particular built-in widget that Flutter provides for us. Enjoy!",
            style: Theme.of(context).textTheme.headline2,
          ),
        ],
      ),
    );
  }
}
