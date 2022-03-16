import 'package:flutter/material.dart';
import 'package:flutter_animation_guide/components/custom_scaffold.dart';
import 'package:url_launcher/url_launcher.dart';

class CurvesPage extends StatefulWidget {
  @override
  _CurvesPageState createState() => _CurvesPageState();
}

class _CurvesPageState extends State<CurvesPage> {
  bool _isFirstContainersSelected = false;
  bool _isSecondContainersSelected = false;

  bool _isThirdContainersSelected = false;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: Text("Curves"),
      body: Column(
        children: <Widget>[
          Text(
            "For every animation inside your app you can set the curve parameter, which will determine how the interpolation process will happen.",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: <Widget>[
              Flexible(
                child: RichText(
                    text: TextSpan(
                        style: Theme.of(context).textTheme.bodyText1,
                        children: <InlineSpan>[
                      TextSpan(
                          text:
                              "In other words, two animation widgets with different curves will achieve the same final state, but they will differentiate themselves in "),
                      TextSpan(
                          text:
                              "how each one of the widgets got to that final state.",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.bold))
                    ])),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Check the example below where we can see three containers animating their height and width to the same value, but their one second animation process looks completelly different.",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(
            height: 10,
          ),
          _containersRow(context),
          SizedBox(
            height: 20,
          ),
          _buttonsRow(context),
          SizedBox(
            height: 10,
          ),
          Row(
            children: <Widget>[
              Flexible(
                child: RichText(
                    text: TextSpan(
                        style: Theme.of(context).textTheme.bodyText1,
                        children: <InlineSpan>[
                      TextSpan(
                          text:
                              "For other informations about all types of curves that flutter offers for you, just check the "),
                      WidgetSpan(
                          child: InkWell(
                        child: Text("official documentation.",
                            style: TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.bold)),
                        onTap: () {
                          _launchDocumentationWebView();
                        },
                      ))
                    ])),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Row _buttonsRow(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: ElevatedButton(
            child: Text(
              _isFirstContainersSelected ? "Shrink back" : "Expand",
            ),
            onPressed: () {
              setState(() {
                _isFirstContainersSelected = !_isFirstContainersSelected;
              });
            },
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: ElevatedButton(
            child: Text(
              _isSecondContainersSelected ? "Shrink back" : "Expand",
            ),
            onPressed: () {
              setState(() {
                _isSecondContainersSelected = !_isSecondContainersSelected;
              });
            },
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: ElevatedButton(
            child: Text(
              _isThirdContainersSelected ? "Shrink back" : "Expand",
            ),
            onPressed: () {
              setState(() {
                _isThirdContainersSelected = !_isThirdContainersSelected;
              });
            },
          ),
        ),
      ],
    );
  }

  Row _containersRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        AnimatedContainer(
          duration: Duration(seconds: 1),
          curve: Curves.bounceIn,
          color: Theme.of(context).primaryColor,
          height: _isFirstContainersSelected ? 80 : 50,
          width: _isFirstContainersSelected ? 100 : 50,
        ),
        SizedBox(
          width: 10,
        ),
        AnimatedContainer(
          duration: Duration(seconds: 1),
          curve: Curves.easeInCubic,
          color: Theme.of(context).primaryColor,
          height: _isSecondContainersSelected ? 80 : 50,
          width: _isSecondContainersSelected ? 100 : 50,
        ),
        SizedBox(
          width: 10,
        ),
        AnimatedContainer(
          duration: Duration(seconds: 1),
          curve: Curves.easeInOutExpo,
          color: Theme.of(context).primaryColor,
          height: _isThirdContainersSelected ? 80 : 50,
          width: _isThirdContainersSelected ? 100 : 50,
        ),
      ],
    );
  }

  void _launchDocumentationWebView() async {
    const url = 'https://api.flutter.dev/flutter/animation/Curves-class.html';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
