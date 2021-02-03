import 'package:flutter/material.dart';
import 'package:flutter_animation_guide/components/custom_scaffold.dart';

class ExpansionTileHandMadePage extends StatefulWidget {
  @override
  _ExpansionTileHandMadePageState createState() => _ExpansionTileHandMadePageState();
}

class _ExpansionTileHandMadePageState extends State<ExpansionTileHandMadePage> with TickerProviderStateMixin {
  List _itemsList = List.generate(5, (i) => i);

  bool _isExpanded = false;

  AnimationController _listAnimationController;
  Animation<double> _listHeightFactorAnimation;

  @override
  void initState() {
    super.initState();
    _listAnimationController = AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    _listHeightFactorAnimation = Tween<double>(begin: 0.2, end: 1).animate(_listAnimationController);
  }

  @override
  void dispose() {
    _listAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        title: Text("Handmade ExpansionTile"),
        body: Column(
          children: <Widget>[
            Text(
              "Example of implementation of an ExpansionTile widget to understand what happens under the hood.",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(
              height: 10,
            ),
            _animatedList(),
            SizedBox(
              height: 20,
            ),
            _expandListButton(),
            SizedBox(
              height: 20,
            ),
          ],
        ));
  }

  RaisedButton _expandListButton() {
    return RaisedButton(
      color: Colors.blue,
      child: Text(
        _isExpanded ? 'Hide all' : 'Show all',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
        if ([AnimationStatus.forward, AnimationStatus.completed].contains(_listAnimationController.status)) {
          _listAnimationController.reverse();
        } else {
          _listAnimationController.forward();
        }
      },
    );
  }

  Widget _animatedList() {
    return AnimatedBuilder(
      animation: _listHeightFactorAnimation,
      builder: (context, child) {
        return Container(
          color: Colors.grey[350],
          child: ClipRect(
            child: Align(
              heightFactor: _listHeightFactorAnimation.value,
              alignment: Alignment.topLeft,
              child: child,
            ),
          ),
        );
      },
      child: ListView.builder(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        itemCount: _itemsList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("List item ${_itemsList[index] + 1}"),
          );
        },
      ),
    );
  }
}
