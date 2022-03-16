import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animation_guide/components/custom_scaffold.dart';

class AnimatedPositionedPage extends StatefulWidget {
  @override
  _AnimatedPositionedPageState createState() => _AnimatedPositionedPageState();
}

class _AnimatedPositionedPageState extends State<AnimatedPositionedPage> {
  double? _containerTopValue;
  double? _containerLeftValue;
  final _randomNumberGenerator = Random();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      needScrollScreen: false,
      title: Text("AnimatedPositioned"),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            height: constraints.maxHeight,
            width: constraints.maxHeight,
            child: Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      "AnimatedPositioned allows us to set animations when we want to change the parameters of a Positioned, which gives you the power to put a widget in any place of the screen using its parameters rigth, left, top and bottom.",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Tap the blue container and you'll see that it can be in any pixel of the screen using a smooth transition animation. To return the container to the initial position, just press the reset button.",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
                _animatedPositionedContainer(constraints, context),
                _resetButton(constraints)
              ],
            ),
          );
        },
      ),
    );
  }

  Align _resetButton(BoxConstraints constraints) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: FloatingActionButton.extended(
        label: Text("Reset"),
        onPressed: () {
          setState(() {
            _containerLeftValue = (constraints.maxWidth / 2) - 50;
            _containerTopValue = (constraints.maxHeight / 2) - 50;
          });
        },
      ),
    );
  }

  AnimatedPositioned _animatedPositionedContainer(
    BoxConstraints constraints,
    BuildContext context,
  ) {
    return AnimatedPositioned(
      top: _containerTopValue ?? (constraints.maxHeight / 2) - 50,
      left: _containerLeftValue ?? (constraints.maxWidth / 2) - 50,
      child: InkWell(
        child: Container(
          color: Theme.of(context).primaryColor,
          height: 100,
          width: 100,
          child: Center(
            child: Text(
              "Tap me!",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        onTap: () {
          setState(() {
            _containerLeftValue =
                _randomNumberGenerator.nextInt(200).toDouble();
            _containerTopValue = _randomNumberGenerator.nextInt(300).toDouble();
          });
        },
      ),
      duration: Duration(milliseconds: 500),
    );
  }
}
