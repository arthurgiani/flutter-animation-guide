import 'package:flutter/material.dart';
import 'package:flutter_animation_guide/components/custom_scaffold.dart';

class AnimatedSizePage extends StatefulWidget {
  @override
  _AnimatedSizePageState createState() => _AnimatedSizePageState();
}

class _AnimatedSizePageState extends State<AnimatedSizePage>
    with TickerProviderStateMixin {
  List _itemsList = List.generate(5, (i) => i);
  bool _isItemsListExpanded = false;
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        title: Text("AnimatedSize"),
        body: Column(
          children: <Widget>[
            Text(
              "AnimatedSize creates a widget that animates its size to match it child's size. It's very useful to show just a few itens of a list and choose when to show them all or not.",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(height: 10),
            Text(
              "Below this text there's an example where the first item of a list is shown. In order to show all items of this list, just press the button and the animation will be done.",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            _animatedList(),
            SizedBox(height: 20),
            _expandListButton(),
          ],
        ));
  }

  ElevatedButton _expandListButton() {
    return ElevatedButton(
      child: Text(
        _isItemsListExpanded ? "Hide" : "Show all",
      ),
      onPressed: () {
        setState(() {
          _isItemsListExpanded = !_isItemsListExpanded;
        });
      },
    );
  }

  AnimatedSize _animatedList() {
    return AnimatedSize(
      duration: Duration(milliseconds: 400),
      child: ListView.builder(
          physics: ScrollPhysics(),
          shrinkWrap: true,
          itemCount: !_isItemsListExpanded ? 1 : _itemsList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text("List item ${_itemsList[index] + 1}"),
            );
          }),
    );
  }
}
