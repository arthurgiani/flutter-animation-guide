import 'package:flutter/material.dart';
import 'package:flutter_animation_guide/components/custom_scaffold.dart';

class ExpansionTileHandMadePage extends StatefulWidget {
  @override
  _ExpansionTileHandMadePageState createState() => _ExpansionTileHandMadePageState();
}

class _ExpansionTileHandMadePageState extends State<ExpansionTileHandMadePage> with TickerProviderStateMixin {
  List _itemsList = List.generate(5, (i) => i);

  AnimationController controller;
  Animation<double> heightFactorAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    heightFactorAnimation = Tween<double>(begin: 0.2, end: 1).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        title: Text("Expansion Tile Hand Made"),
        body: Column(
          children: <Widget>[
            Text(
              "AnimatedSize creates a widget that animates its size to match it child's size. It's very useful to show just a few itens of a list and choose when to show them all or not.",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Below this text there's an example where the first item of a list is shown. In order to show all items of this list, just press the button and the animation will be done.",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            _animatedList(),
            SizedBox(
              height: 20,
            ),
            _expandListButton(),
          ],
        ));
  }

  RaisedButton _expandListButton() {
    return RaisedButton(
      color: Colors.blue,
      child: Text(
        "Show all",
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        if ([AnimationStatus.forward, AnimationStatus.completed].contains(controller.status)) {
          controller.reverse();
        } else {
          controller.forward();
        }
      },
    );
  }

  Widget _animatedList() {
    return AnimatedBuilder(
      animation: heightFactorAnimation,
      builder: (context, child) {
        return Container(
          color: Colors.grey[350],
          child: ClipRRect(
            child: Align(
              heightFactor: heightFactorAnimation.value,
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
