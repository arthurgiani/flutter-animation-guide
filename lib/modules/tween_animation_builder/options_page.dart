import 'package:flutter/material.dart';
import 'package:flutter_animation_guide/components/custom_button.dart';
import 'package:flutter_animation_guide/components/custom_scaffold.dart';
import 'package:flutter_animation_guide/modules/tween_animation_builder/color_tween_page.dart';
import 'package:flutter_animation_guide/modules/tween_animation_builder/rotation_animation_page.dart';

import '../../navigation.dart';
import 'intro_page.dart';

class TweenAnimationBuilderOptionsPage extends StatefulWidget {
  @override
  _TweenAnimationBuilderOptionsPageState createState() =>
      _TweenAnimationBuilderOptionsPageState();
}

class _TweenAnimationBuilderOptionsPageState
    extends State<TweenAnimationBuilderOptionsPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: Text("Tween Animation Builder"),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CustomButton(
              text: "1. Intro",
              onPressed: () => push(
                context,
                TweenAnimationBuilderIntroPage(),
              ),
            ),
            CustomButton(
              text: "2. Rotation Animation",
              onPressed: () => push(
                context,
                RotationAnimationPage(),
              ),
            ),
            CustomButton(
              text: "3. ColorTween",
              onPressed: () => push(
                context,
                ColorTweenPage(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
