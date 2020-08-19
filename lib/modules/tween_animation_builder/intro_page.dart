import 'package:flutter/material.dart';
import 'package:flutter_animation_guide/components/custom_scaffold.dart';

class TweenAnimationBuilderIntroPage extends StatefulWidget {
  @override
  _TweenAnimationBuilderIntroPageState createState() =>
      _TweenAnimationBuilderIntroPageState();
}

class _TweenAnimationBuilderIntroPageState
    extends State<TweenAnimationBuilderIntroPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: Text("Intro"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "As you can see in the first section of this tutorial, Flutter provides us a range of implicit animations for yours widgets. But what if you want to create one that doesn't have a built-in animation in Flutter by default? For this, you can create your own using TweenAnimationBuilder!",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(height: 10),
          Text(
            "But remember, it still an implicit animation so their assumptions and limitations is the same.",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(height: 10),
          Text(
            "To use TweenBuilderExample, you can follow the steps below:",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(height: 10),
          Text(
            "1. Use TweenAnimationBuilder widget to build your animation.",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(height: 10),
          Text(
            "2. Set the duration that you want your animation to have.",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(height: 10),
          Text(
            "3. Create a tween object in order to set the begin and end values of your interpolation process.",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(height: 10),
          Text(
            "4. Define a child widget you want to animate!",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(height: 20),
          Text(
            "Now, check out the examples in this entire section to see the proper use of TweenAnimationBuilder!",
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}
