import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animation_guide/components/custom_scaffold.dart';

class RotationAnimationPage extends StatefulWidget {
  @override
  _RotationAnimationPageState createState() => _RotationAnimationPageState();
}

class _RotationAnimationPageState extends State<RotationAnimationPage> {
  double _finalAngleInRadians = 0;
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: Text("Rotation Animation"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Flutter doesn't have 'AnimatedRotation' as a built-in implicit animation, but you can create one using TweenAnimationBuilder! Go ahead and press the container!",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(height: 20),
          TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: _finalAngleInRadians),
              duration: Duration(seconds: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _containerExample(),
                ],
              ),
              builder: (context, double rotationAngleInRadians, child) {
                return Transform.rotate(
                  angle: rotationAngleInRadians,
                  child: InkWell(
                    child: child,
                    onTap: () {
                      setState(() {
                        _finalAngleInRadians = 2 * pi;
                      });
                    },
                  ),
                );
              }),
          SizedBox(height: 20),
          Text(
            "Making your animation performance better",
            style: Theme.of(context).textTheme.headline2,
          ),
          SizedBox(height: 20),
          Text(
            "Take a look at the code bellow and see how this container example can be made in Flutter:",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(height: 10),
          Image.asset('images/wrong_tween_builder_example.png'),
          SizedBox(height: 10),
          Text(
            "Note that the container is being built inside the 'build' method so its been rebuilt over and over again during animation process, but in this specific case it is not been modified, isn't it? The container it's just rotating and none of the properties are changing (heigth, width, color etc).",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(height: 10),
          Text(
            "Then, when you want to create an animation process that doesn't modify your widget you can set the child parameter outside the build method.",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(height: 10),
          Image.asset('images/correct_tween_builder_example.png'),
          SizedBox(height: 10),
          Text(
            "Now, your container will be build only once saving device memory and increasing your app performance.",
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    );
  }

  Container _containerExample() {
    return Container(
      height: 100,
      width: 100,
      color: Theme.of(context).primaryColor,
      child: Center(
        child: Text(
          "Rotate!",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
