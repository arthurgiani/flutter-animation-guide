import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function onPressed;
  final String text;

  const CustomButton({Key key, this.onPressed, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Theme.of(context).primaryColor,
      child: Row(
        children: <Widget>[
          Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
      onPressed: onPressed,
    );
  }
}
