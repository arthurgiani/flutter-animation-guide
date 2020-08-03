import 'package:flutter/material.dart';
import 'package:flutter_animation_guide/components/custom_scaffold.dart';

class AnimatedDefaultTextStylePage extends StatefulWidget {
  @override
  _AnimatedDefaultTextStylePageState createState() =>
      _AnimatedDefaultTextStylePageState();
}

class _AnimatedDefaultTextStylePageState
    extends State<AnimatedDefaultTextStylePage> {
  var _defaultTextStyle = TextStyle(
      fontSize: 14, fontWeight: FontWeight.normal, color: Colors.black);

  var _alternativeTextStyle = TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.underline,
      color: Colors.blue);

  bool _isAlternativeTextStyleSelected = false;
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: Text("AnimatedDefaultTextStyle"),
      body: Column(
        children: <Widget>[
          Text(
            "If flutter offers animated effects for containers, alignments, opacity and many more, why can't texts have their own built-in implicit animation?",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Using AnimatedDefaultTextStyle, you can set smooth transition for all parametes of a TextStyle. Tap the button and see how powerful this widget could be.",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(
            height: 30,
          ),
          AnimatedDefaultTextStyle(
            duration: Duration(milliseconds: 500),
            child: _isAlternativeTextStyleSelected
                ? Text("Alternative text")
                : Text("Default text"),
            style: _isAlternativeTextStyleSelected
                ? _alternativeTextStyle
                : _defaultTextStyle,
          ),
          SizedBox(
            height: 20,
          ),
          RaisedButton(
            color: Theme.of(context).primaryColor,
            child: Text(
              "Change style",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              setState(() {
                _isAlternativeTextStyleSelected =
                    !_isAlternativeTextStyleSelected;
              });
            },
          )
        ],
      ),
    );
  }
}
