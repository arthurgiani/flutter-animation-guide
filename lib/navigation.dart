import 'package:flutter/material.dart';

Future push(BuildContext context, Widget page,
    {bool replace = false, bool pushRemove = false}) {
  if (replace) {
    return Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return page;
        },
      ),
    );
  }

  if (pushRemove) {
    return Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => page),
        (Route<dynamic> route) => false);
  }

  return Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) {
        return page;
      },
    ),
  );
}
