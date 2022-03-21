import 'package:flutter/material.dart';
import 'package:flutter_animation_guide/components/custom_scaffold.dart';
import 'package:lottie/lottie.dart';

class LottieAnimationsPage extends StatefulWidget {
  const LottieAnimationsPage({Key? key}) : super(key: key);

  @override
  _LottieAnimationsPageState createState() => _LottieAnimationsPageState();
}

class _LottieAnimationsPageState extends State<LottieAnimationsPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: Text('Lottie Example'),
      body: Center(
        child: Lottie.asset(
          'assets/animations/mail-animation.json',
        ),
      ),
    );
  }
}
