import 'package:flutter/material.dart';
import 'package:flutter_animation_guide/components/custom_scaffold.dart';

class HeroSecondPage extends StatefulWidget {
  const HeroSecondPage({Key? key}) : super(key: key);

  @override
  _HeroSecondPageState createState() => _HeroSecondPageState();
}

class _HeroSecondPageState extends State<HeroSecondPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: Text('Hero Second Page'),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 200,
            ),
            Hero(
              tag: 'flutter-logo-asset',
              child: Image.asset(
                'assets/images/flutter_logo.png',
                height: 300,
                width: 300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
