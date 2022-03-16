import 'package:flutter/material.dart';
import 'package:flutter_animation_guide/components/custom_button.dart';
import 'package:flutter_animation_guide/components/custom_scaffold.dart';
import 'package:flutter_animation_guide/modules/implicit_animations/animated_align_page.dart';
import 'package:flutter_animation_guide/modules/implicit_animations/animated_container_page.dart';
import 'package:flutter_animation_guide/modules/implicit_animations/animated_default_text_style_page.dart';
import 'package:flutter_animation_guide/modules/implicit_animations/animated_opacity_page.dart';
import 'package:flutter_animation_guide/modules/implicit_animations/animated_positioned_page.dart';
import 'package:flutter_animation_guide/modules/implicit_animations/animated_size_page.dart';
import 'package:flutter_animation_guide/modules/implicit_animations/curves_page.dart';
import 'package:flutter_animation_guide/modules/implicit_animations/intro_page.dart';
import 'package:flutter_animation_guide/navigation.dart';

class ImplicitAnimationsOptionsPage extends StatefulWidget {
  @override
  _ImplicitAnimationsOptionsPageState createState() =>
      _ImplicitAnimationsOptionsPageState();
}

class _ImplicitAnimationsOptionsPageState
    extends State<ImplicitAnimationsOptionsPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: Text("Implicit Animations"),
      body: Center(
        child: Column(
          children: <Widget>[
            CustomButton(
                text: "1. Intro",
                onPressed: () => push(context, ImplicitAnimationsIntroPage())),
            CustomButton(
                text: "2. AnimatedContainer",
                onPressed: () => push(context, AnimatedContainerPage())),
            CustomButton(
                text: "3. AnimatedPositioned",
                onPressed: () => push(context, AnimatedPositionedPage())),
            CustomButton(
                text: "4. AnimatedOpacity",
                onPressed: () => push(context, AnimatedOpacityPage())),
            CustomButton(
                text: "5. AnimatedAlign",
                onPressed: () => push(context, AnimatedAlignPage())),
            CustomButton(
                text: "6. AnimatedSize",
                onPressed: () => push(context, AnimatedSizePage())),
            CustomButton(
                text: "7. AnimatedDefaultTextStyle",
                onPressed: () => push(context, AnimatedDefaultTextStylePage())),
            CustomButton(
                text: "8. Curves",
                onPressed: () => push(context, CurvesPage())),
          ],
        ),
      ),
    );
  }
}
