import 'dart:math';

import 'package:flutter/material.dart';

class CreditCardRotationPage extends StatefulWidget {
  const CreditCardRotationPage({Key? key}) : super(key: key);

  @override
  _CreditCardRotationPageState createState() => _CreditCardRotationPageState();
}

class _CreditCardRotationPageState extends State<CreditCardRotationPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;

  late final Animation<double> rotationTransition;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    rotationTransition = Tween(begin: 0.0, end: pi).animate(
      animationController,
    );

    animationController.addListener(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Credit Card Rotation'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: AnimatedBuilder(
              animation: animationController,
              builder: (context, _) {
                return Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationX(rotationTransition.value),
                  child: rotationTransition.value < pi / 2
                      ? _CreditCardFrontWidget()
                      : _CreditCardBackWidget(),
                );
              },
            ),
          ),
          SizedBox(height: 100),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  animationController.forward();
                },
                child: Text('Rotate'),
              ),
              SizedBox(width: 24),
              ElevatedButton(
                onPressed: () {
                  animationController.reverse();
                },
                child: Text('Reverse'),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _CreditCardBackWidget extends StatelessWidget {
  const _CreditCardBackWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      height: 200,
      width: 400,
    );
  }
}

class _CreditCardFrontWidget extends StatelessWidget {
  const _CreditCardFrontWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      height: 200,
      width: 400,
    );
  }
}
