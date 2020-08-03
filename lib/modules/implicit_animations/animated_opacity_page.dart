import 'package:flutter/material.dart';
import 'package:flutter_animation_guide/components/custom_scaffold.dart';

class AnimatedOpacityPage extends StatefulWidget {
  @override
  _AnimatedOpacityPageState createState() => _AnimatedOpacityPageState();
}

class _AnimatedOpacityPageState extends State<AnimatedOpacityPage> {
  bool _isFirstContainerVisible = true;
  double _secondContainerOpacityLevel = 1;
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: Text("AnimatedOpacity"),
      body: Column(
        children: <Widget>[
          Text(
            "Opacity is a widget that controlls how much your child will appear on the screen, where 0 is completelly transparent and 1 is not transparent.",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "The first container represents an transition from visible -> transparent with no animation. Press the button to see how it works.",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(
            height: 10,
          ),
          _noAnimationContainer(),
          _noAnimationInteractiveButton(),
          SizedBox(
            height: 30,
          ),
          Text(
            "Now, look how nice is the effect when you apply the AnimatedOpacity widget changing the opacity level in the Slider.",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(
            height: 10,
          ),
          _animatedOpacityContainer(),
          SizedBox(
            height: 10,
          ),
          _opacitySlider()
        ],
      ),
    );
  }

  Slider _opacitySlider() {
    return Slider(
        label: "Opacity level: $_secondContainerOpacityLevel",
        min: 0,
        max: 1,
        divisions: 10,
        value: _secondContainerOpacityLevel,
        onChanged: (value) {
          setState(() {
            _secondContainerOpacityLevel = value;
          });
        });
  }

  AnimatedOpacity _animatedOpacityContainer() {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 500),
      opacity: _secondContainerOpacityLevel,
      child: Container(
        color: Theme.of(context).primaryColor,
        height: 100,
        width: 100,
      ),
    );
  }

  RaisedButton _noAnimationInteractiveButton() {
    return RaisedButton(
      onPressed: () {
        setState(() {
          _isFirstContainerVisible = !_isFirstContainerVisible;
        });
      },
      child: _isFirstContainerVisible
          ? Text("Make me invisible")
          : Text("Show me again!"),
    );
  }

  Opacity _noAnimationContainer() {
    return Opacity(
      opacity: _isFirstContainerVisible ? 1 : 0,
      child: Container(
        color: Theme.of(context).primaryColor,
        height: 100,
        width: 100,
      ),
    );
  }
}
