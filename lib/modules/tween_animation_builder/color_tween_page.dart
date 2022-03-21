import 'package:flutter/material.dart';
import 'package:flutter_animation_guide/components/custom_scaffold.dart';

class ColorTweenPage extends StatefulWidget {
  @override
  _ColorTweenPageState createState() => _ColorTweenPageState();
}

class _ColorTweenPageState extends State<ColorTweenPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: Text("ColorTween"),
      body: Column(
        children: <Widget>[
          Text(
            "Flutter offers an specific type of TweenBuilder which allows us to animate between color palletes.",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(height: 10),
          Text(
            "Here you can see the Flutter logo image wrapped in a ColorFiltered widget. Using ColorTween, you can see the smooth change that takes 7 seconds to happen.",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(height: 20),

          //After dart migration to null safety, ColorTween begin and end
          //paramers can be null, so we need to type TweenAnimationBuilder<Color?>
          //and also set Color property in builder paramer as nullable as well.

          TweenAnimationBuilder<Color?>(
            tween: ColorTween(begin: Colors.red, end: Colors.green),
            duration: Duration(seconds: 10),
            child: Image.asset('assets/images/flutter_logo.png'),
            builder: (_, Color? color, child) {
              return ColorFiltered(
                child: child,
                colorFilter: ColorFilter.mode(
                  color ?? Colors.transparent,
                  BlendMode.modulate,
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
