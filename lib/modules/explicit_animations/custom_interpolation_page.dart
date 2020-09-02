import 'package:flutter/material.dart';
import 'package:flutter_animation_guide/components/custom_scaffold.dart';

class CustomInterpolationPage extends StatefulWidget {
  @override
  _CustomInterpolationPageState createState() =>
      _CustomInterpolationPageState();
}

class _CustomInterpolationPageState extends State<CustomInterpolationPage>
    with SingleTickerProviderStateMixin {
  AnimationController _firstContainerAnimationController;
  Animation _scaleTransition;
  Animation _colorTransition;

  @override
  void initState() {
    _firstContainerAnimationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    )..repeat();
    super.initState();

    _scaleTransition = Tween<double>(begin: 0, end: 1)
        .animate(_firstContainerAnimationController);
    _colorTransition = ColorTween(begin: Colors.red, end: Colors.blue).animate(
        CurvedAnimation(
            parent: _firstContainerAnimationController,
            curve: Interval(0.5, 1.0)));
  }

  @override
  void dispose() {
    _firstContainerAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: Text("Custom Interpolation"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Flexible(
                child: Text(
                  "Interpolation",
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Text(
            "Since you have total control of your interpolation process with AnimationController, now you can create custom interpolations for your animation.",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "Imagine that you want to perform an Animation of 5 seconds in a Container with two parameters: Scale and Color. It starts growing to it's maximum size at the same time that it's color is changing from red to blue. Until now is it known as a 'normal' animation. But what if you want to start the color interpolation from the half to the end of the animation period (from 2.5 to 5 seconds?) ",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "You can do this using AnimationController!",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AnimatedBuilder(
                  animation: _firstContainerAnimationController,
                  builder: (context, _) {
                    return ScaleTransition(
                      scale: _scaleTransition,
                      child: Container(
                        color: _colorTransition.value,
                        height: 200,
                        width: 200,
                      ),
                    );
                  })
            ],
          )
        ],
      ),
    );
  }
}
