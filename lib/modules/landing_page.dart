import 'package:flutter/material.dart';
import 'package:flutter_animation_guide/components/custom_button.dart';
import 'package:flutter_animation_guide/modules/animate_across_screens/animate_across_screen_intro_page.dart';
import 'package:flutter_animation_guide/modules/explicit_animations/options_page.dart';
import 'package:flutter_animation_guide/modules/lottie/lottie_animations_page.dart';
import 'package:flutter_animation_guide/modules/tween_animation_builder/options_page.dart';
import 'package:flutter_animation_guide/navigation.dart';

import 'example_gallery/options_page.dart';
import 'implicit_animations/options_page.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/images/flutter_logo.png', width: 200),
              SizedBox(height: 30),
              Text(
                "Animation Tutorial Guide",
                style: Theme.of(context).textTheme.headline1,
              ),
              SizedBox(height: 30),
              CustomButton(
                text: "1. Implicit Animations",
                onPressed: () => push(context, ImplicitAnimationsOptionsPage()),
              ),
              CustomButton(
                text: "2. TweenAnimation Builder",
                onPressed: () => push(
                  context,
                  TweenAnimationBuilderOptionsPage(),
                ),
              ),
              CustomButton(
                text: "3. Explicit Animations",
                onPressed: () => push(
                  context,
                  ExplicitAnimationsOptionsoPage(),
                ),
              ),
              CustomButton(
                text: "4. Animate across screens",
                onPressed: () => push(
                  context,
                  AnimateAcrossScreenIntroPage(),
                ),
              ),
              CustomButton(
                text: "5. Lottie Animations",
                onPressed: () => push(
                  context,
                  LottieAnimationsPage(),
                ),
              ),
              CustomButton(
                text: "5. Example Gallery",
                onPressed: () => push(
                  context,
                  ExampleGaleryOptionsPage(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
