import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animation_guide/components/custom_scaffold.dart';

class AnimatedContainerPage extends StatefulWidget {
  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  bool _isFirstContainerExpanded = false;
  double _secondContainerHeightAndWidth = 100;
  final _randomNumberGenerator = Random();
  Color _thirdContainerColor = Colors.blue;
  double _thirdContainerWidth = 100;
  double _thirdContainerBorderRadius = 0;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: Text("Animated Container"),
      body: Column(
        children: <Widget>[
          Text(
            "AnimatedContainer is a widget that allows us to set animations when we want to change the parameters of a Container, such as: height, width, color, align and many more.",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(height: 10),
          Text(
            "Imagine that you can increase the heigth and width of a container from 100px to 200px. Have a try.",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(height: 10),
          _firstContainerWidget(),
          SizedBox(height: 10),
          Text(
            "You can also set heigth and width dinamycally using a slider, for example",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(height: 10),
          _secondContainerSlider(),
          SizedBox(height: 10),
          _secondContainerWidget(),
          SizedBox(height: 10),
          Text(
            "Or you just wanna have fun with your AnimatedContainer. Press the buttons below and see the magic happen.",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(height: 10),
          _thirdContainerButtonsRow(),
          SizedBox(height: 10),
          _thirdContainer(),
        ],
      ),
    );
  }

  AnimatedContainer _thirdContainer() {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      decoration: BoxDecoration(
        color: _thirdContainerColor,
        borderRadius: BorderRadius.circular(
          _thirdContainerBorderRadius,
        ),
      ),
      height: 100,
      width: _thirdContainerWidth,
      child: Center(
        child: Text(
          "Have fun!",
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Row _thirdContainerButtonsRow() {
    return Row(
      children: <Widget>[
        Expanded(
            child: ElevatedButton(
          onPressed: () {
            setState(() {
              _thirdContainerColor = Color.fromRGBO(
                  _randomNumberGenerator.nextInt(256),
                  _randomNumberGenerator.nextInt(256),
                  _randomNumberGenerator.nextInt(256),
                  1);
            });
          },
          child: Text("Color"),
        )),
        SizedBox(width: 20),
        Expanded(
            child: ElevatedButton(
          onPressed: () {
            setState(() {
              _thirdContainerBorderRadius =
                  _randomNumberGenerator.nextInt(40).toDouble();
            });
          },
          child: Text("Radius Border"),
        )),
        SizedBox(width: 20),
        Expanded(
            child: ElevatedButton(
          onPressed: () {
            setState(() {
              _thirdContainerWidth =
                  _randomNumberGenerator.nextInt(200).toDouble();
            });
          },
          child: Text("Width"),
        )),
      ],
    );
  }

  Slider _secondContainerSlider() {
    return Slider(
        label: "${_secondContainerHeightAndWidth.round().toString()} px",
        min: 100,
        max: 200,
        divisions: 10,
        value: _secondContainerHeightAndWidth,
        onChanged: (value) {
          setState(() {
            _secondContainerHeightAndWidth = value;
          });
        });
  }

  InkWell _secondContainerWidget() {
    return InkWell(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        height: _secondContainerHeightAndWidth,
        width: _secondContainerHeightAndWidth,
        color: Colors.blue,
        child: Center(
          child: Text(
            "Use the slider to see my transformation!",
            textAlign: TextAlign.center,
          ),
        ),
      ),
      onTap: () {
        setState(() {
          _isFirstContainerExpanded = !_isFirstContainerExpanded;
        });
      },
    );
  }

  InkWell _firstContainerWidget() {
    return InkWell(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        height: _isFirstContainerExpanded ? 200 : 100,
        width: _isFirstContainerExpanded ? 200 : 100,
        color: Colors.blue,
        child: Center(
          child: Text("Press me!"),
        ),
      ),
      onTap: () {
        setState(() {
          _isFirstContainerExpanded = !_isFirstContainerExpanded;
        });
      },
    );
  }
}
