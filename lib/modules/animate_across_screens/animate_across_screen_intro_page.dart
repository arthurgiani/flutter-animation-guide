import 'package:flutter/material.dart';
import 'package:flutter_animation_guide/components/custom_button.dart';
import 'package:flutter_animation_guide/components/custom_scaffold.dart';
import 'package:flutter_animation_guide/modules/animate_across_screens/fake_list_image_animation_page.dart';
import 'package:flutter_animation_guide/modules/animate_across_screens/hero_first_page.dart';

import '../../navigation.dart';

class AnimateAcrossScreenIntroPage extends StatefulWidget {
  const AnimateAcrossScreenIntroPage({Key? key}) : super(key: key);

  @override
  _AnimateAcrossScreenIntroPageState createState() =>
      _AnimateAcrossScreenIntroPageState();
}

class _AnimateAcrossScreenIntroPageState
    extends State<AnimateAcrossScreenIntroPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: Text('Animate across pages'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'You can use Hero widget to create animation between navigation.',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(height: 10),
            Text(
              '1. Wrap the widget you want to animate in a Hero widget',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(height: 10),
            Text(
              '2. Set a unique tag on a Hero.',
              style: Theme.of(context).textTheme.bodyText1,
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 10),
            Text(
              '3. Create a second page and wraps another widget in a Hero under the same tag that you created on previous page',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(height: 10),
            Text(
              '4. See the animation!',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  text: "1. Flutter Logo Animation",
                  onPressed: () => push(context, HeroFirstPage()),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  text: "2. Fake ListView Image Animation",
                  onPressed: () => push(context, FakeListImageAnimationPage()),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
