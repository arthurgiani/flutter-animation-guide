import 'package:flutter/material.dart';
import 'package:flutter_animation_guide/components/custom_button.dart';
import 'package:flutter_animation_guide/components/custom_scaffold.dart';
import 'package:flutter_animation_guide/modules/explicit_animations/animated_builder.dart';
import 'package:flutter_animation_guide/modules/explicit_animations/intro_page.dart';
import '../../navigation.dart';

class ExplicitAnimationsOptionsoPage extends StatefulWidget {
  @override
  _ExplicitAnimationsOptionsoPageState createState() =>
      _ExplicitAnimationsOptionsoPageState();
}

class _ExplicitAnimationsOptionsoPageState
    extends State<ExplicitAnimationsOptionsoPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: Text('Explicit Animations'),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: CustomButton(
                    text: "1. Intro & Basic Examples",
                    onPressed: () =>
                        push(context, ExplicitAnimationsIntroPage()))),
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: CustomButton(
                    text: "2. AnimatedBuilder",
                    onPressed: () =>
                        push(context, AnimatedBuilderPage()))), 
          ],
        ),
      ),
    );
  }
}
