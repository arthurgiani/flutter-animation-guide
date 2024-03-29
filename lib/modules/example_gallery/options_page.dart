import 'package:flutter/material.dart';
import 'package:flutter_animation_guide/components/custom_button.dart';
import 'package:flutter_animation_guide/components/custom_scaffold.dart';
import 'package:flutter_animation_guide/modules/example_gallery/animated_carousel_page.dart';
import 'package:flutter_animation_guide/modules/example_gallery/checklist_scale_animation.dart';
import 'package:flutter_animation_guide/modules/example_gallery/credit_card_rotation_page.dart';
import 'package:flutter_animation_guide/modules/example_gallery/page_view_button_animation_page.dart';
import 'package:flutter_animation_guide/navigation.dart';

import 'expansion_tile_hand_made_page.dart';

class ExampleGaleryOptionsPage extends StatefulWidget {
  @override
  _ExampleGaleryOptionsPageState createState() =>
      _ExampleGaleryOptionsPageState();
}

class _ExampleGaleryOptionsPageState extends State<ExampleGaleryOptionsPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: Text("Examples"),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "The main purpose of this section is to create an exclusive area for contributions where you can create your examples applying animations in flutter and make a pull request for this repository, in order to create a gallery of animation examples for community use and consultation.",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(height: 10),
            Text(
              "Use the components 'CustomButton' and 'CustomScaffold' to create your own animation example! ",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(height: 10),
            Center(
              child: Column(
                children: [
                  CustomButton(
                    text: "1. Handmade ExpansionTile",
                    onPressed: () => push(context, ExpansionTileHandMadePage()),
                  ),
                  CustomButton(
                    text: "2. PageView Button Animation",
                    onPressed: () => push(
                      context,
                      PagewViewButtonAnimationPage(),
                    ),
                  ),
                  CustomButton(
                    text: "3. Checklist Scale",
                    onPressed: () => push(
                      context,
                      ChecklistScaleAnimation(),
                    ),
                  ),
                  CustomButton(
                    text: "4. Animated Carousel",
                    onPressed: () => push(
                      context,
                      AnimatedCarouselPage(),
                    ),
                  ),
                  CustomButton(
                    text: "5. Credit Card Rotation",
                    onPressed: () => push(
                      context,
                      CreditCardRotationPage(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
