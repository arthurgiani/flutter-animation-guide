import 'package:flutter/material.dart';
import 'package:flutter_animation_guide/components/custom_scaffold.dart';

class ExampleGalleryIntroPage extends StatefulWidget {
  @override
  _ExampleGalleryIntroPageState createState() =>
      _ExampleGalleryIntroPageState();
}

class _ExampleGalleryIntroPageState extends State<ExampleGalleryIntroPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: Text("Example Gallery"),
      body: Column(
        children: <Widget>[
          Text(
            "The main purpose of this section is to create an exclusive area for contributions where you can create your examples applying animations in flutter and make a pull request for this repository, in order to create a gallery of animation examples for community use and consultation.",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Use the components 'CustomButton' and 'CustomScaffold' to create your own animation example! ",
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}
