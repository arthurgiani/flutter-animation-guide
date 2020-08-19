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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: CustomButton(
                    text: "1. Intro",
                    onPressed: () =>
                        push(context, ImplicitAnimationsIntroPage()))),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: CustomButton(
                  text: "2. AnimatedContainer",
                  onPressed: () => push(context, AnimatedContainerPage())),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: CustomButton(
                  text: "3. AnimatedPositioned",
                  onPressed: () => push(context, AnimatedPositionedPage())),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: CustomButton(
                  text: "4. AnimatedOpacity",
                  onPressed: () => push(context, AnimatedOpacityPage())),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: CustomButton(
                  text: "5. AnimatedAlign",
                  onPressed: () => push(context, AnimatedAlignPage())),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: CustomButton(
                text: "6. AnimatedSize",
                onPressed: () => push(context, AnimatedSizePage())
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: CustomButton(
                text: "7. AnimatedDefaultTextStyle",
                onPressed: () => push(context, AnimatedDefaultTextStylePage())
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: CustomButton(
                text: "8. Curves",
                onPressed: () => push(context, CurvesPage())
              ),
            ),
          ],
        ),
      ),
    );
  }
}
