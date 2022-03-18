import 'package:flutter/material.dart';
import 'package:flutter_animation_guide/components/custom_scaffold.dart';

class ExplicitAnimationsIntroPage extends StatefulWidget {
  @override
  _ExplicitAnimationsIntroPageState createState() =>
      _ExplicitAnimationsIntroPageState();
}

class _ExplicitAnimationsIntroPageState
    extends State<ExplicitAnimationsIntroPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _firstContainerAnimationController;

  @override
  void initState() {
    _firstContainerAnimationController = AnimationController(
        vsync: this,
        duration: Duration(seconds: 2),
        lowerBound: 0,
        upperBound: 1);
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
      title: Text('Intro & Examples'),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                "INTRO",
                style: Theme.of(context).textTheme.headline1,
              ),
            ],
          ),
          SizedBox(height: 20),
          Text(
            "As we said in the beginning of this tutorial, you should to use explicit animations when you want to have total control of your animation process. Now, you can start, stop and repeat them whenever you want, and many other features that you can use.",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(height: 15),
          Text(
            "In the example below you can see a red container wrapped in a widget called RotationTranstion. Just like that, you have many other built-in widgets that is very similiar to those you used in Implicit Animation section, such as Align, Positioned, Scale and many more.",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(height: 40),
          _firstContainer(),
          SizedBox(height: 40),
          _firstContainerButtonsRow1(),
          SizedBox(height: 20),
          _firstContainerButtonsRow2()
        ],
      ),
    );
  }

  RotationTransition _firstContainer() {
    return RotationTransition(
      turns: _firstContainerAnimationController,
      child: Container(
        color: Colors.red,
        height: 150,
        width: 150,
      ),
    );
  }

  Padding _firstContainerButtonsRow2() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: ElevatedButton(
              child: Text(
                "Repeat",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () => _firstContainerAnimationController.repeat(),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: ElevatedButton(
              child: Text(
                "Reset",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () => _firstContainerAnimationController.reset(),
            ),
          ),
        ],
      ),
    );
  }

  Padding _firstContainerButtonsRow1() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: ElevatedButton(
              child: Text(
                "Start",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () => _firstContainerAnimationController.forward(),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: ElevatedButton(
              child: Text(
                "Reverse",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () => _firstContainerAnimationController.reverse(),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: ElevatedButton(
              child: Text(
                "Stop",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () => _firstContainerAnimationController.stop(),
            ),
          ),
        ],
      ),
    );
  }
}
