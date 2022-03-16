import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function() onPressed;
  final String text;

  const CustomButton({Key? key, required this.onPressed, required this.text})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.6,
      child: ElevatedButton(
        child: Row(
          children: <Widget>[
            Flexible(
              child: Text(
                text,
              ),
            ),
          ],
        ),
        onPressed: onPressed,
      ),
    );
  }
}
