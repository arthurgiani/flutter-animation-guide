import 'package:flutter/material.dart';
import 'package:flutter_animation_guide/components/custom_scaffold.dart';

class AnimatedBuilderPage extends StatefulWidget {
  @override
  _AnimatedBuilderPageState createState() => _AnimatedBuilderPageState();
}

class _AnimatedBuilderPageState extends State<AnimatedBuilderPage>
    with SingleTickerProviderStateMixin {
  AnimationController _firstContainerAnimationController;

  @override
  void initState() {
    _firstContainerAnimationController = AnimationController(
      lowerBound: 150,
      upperBound: 250,
      vsync: this,
      duration: Duration(seconds: 5),
    );
    super.initState();
  }

  @override
  void dispose() {
    _firstContainerAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: Text('Animated Builder'),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Flexible(
                child: Text(
                  "When you should use AnimatedBuilder?",
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "In the intro section we saw that there's some built-in widgets for your explicit animations. But what if you want to create your own explicit animation? We already discussed this need in Implicit Animation section, where we saw that TweenAnimationBuilder solves the problem. But if you want to keep your animation's control, you should use AnimatedBuilder!",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "In AnimatedBuilder, you can set the duration of your animation and the builder function that will build your interpolation process. If your child doesn't change during animation process you can set it outside the builder function for performance optimizations (same logic that we saw in TweenAnimationBuilder!)",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "Different from RotationTransition container in the Intro section, flutter doesn't have an built-in widget to interpolate the value of heigth/width, for example. In this case, AnimatedBuilder is the perfect solution.",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "In the example below, you can see the traditional red container using AnimatedBuilder to execute it's width animation where you can start and reverse the interpolation whenever you want.",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(
            height: 40,
          ),
          AnimatedBuilder(
              animation: _firstContainerAnimationController,
              builder: (context, _) {
                return Container(
                  color: Colors.red,
                  width: _firstContainerAnimationController.value,
                  height: 150,
                );
              }),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: FlatButton(
                    child: Text(
                      "Start",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () =>
                        _firstContainerAnimationController.repeat(),
                    color: Colors.blue,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: FlatButton(
                    child: Text(
                      "Stop",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () =>
                        _firstContainerAnimationController.stop(),
                    color: Colors.blue,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
