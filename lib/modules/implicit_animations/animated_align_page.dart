import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animation_guide/components/custom_scaffold.dart';

class AnimatedAlignPage extends StatefulWidget {
  @override
  _AnimatedAlignPageState createState() => _AnimatedAlignPageState();
}

class _AnimatedAlignPageState extends State<AnimatedAlignPage> {
  Alignment _alignmentOption;

  void _changeContainerAlignment() {
    setState(() {
      var _alignmentOptionIndex =
          _randomNumberGenerator.nextInt(_alignmentOptionsList.length);
      _alignmentOption = _alignmentOptionsList[_alignmentOptionIndex];
    });
  }

  final _randomNumberGenerator = Random();

  List<Alignment> _alignmentOptionsList = [
    Alignment.bottomCenter,
    Alignment.bottomLeft,
    Alignment.bottomRight,
    Alignment.center,
    Alignment.centerLeft,
    Alignment.centerRight,
    Alignment.topCenter,
    Alignment.topLeft,
    Alignment.topRight
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        needScrollScreen: false,
        title: Text("AnimatedAlign"),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    "AnimatedAlign provides you an animation to the position of it's child when the given alignment parameter changes.",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "You can choose between all types of aligment and place your container at the bottom, center or top of the screen (all options switching between left side, rigth side and center).",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Tap the container and it's alignment will change randomnly.",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
              _alignContainer()
            ],
          ),
        ));
  }

  AnimatedAlign _alignContainer() {
    return AnimatedAlign(
      duration: Duration(milliseconds: 500),
      alignment: _alignmentOption ?? Alignment.center,
      child: InkWell(
        child: Container(
          color: Colors.blue,
          height: 100,
          width: 100,
          child: Center(
            child: Text(
              "Tap me!",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        onTap: () => _changeContainerAlignment(),
      ),
    );
  }
}
