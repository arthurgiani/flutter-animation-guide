import 'package:flutter/material.dart';

class FakeListItemPage extends StatefulWidget {
  final String imageUrl;
  final Object heroTag;
  const FakeListItemPage(
      {Key? key, required this.imageUrl, required this.heroTag})
      : super(key: key);

  @override
  _FakeListItemPageState createState() => _FakeListItemPageState();
}

class _FakeListItemPageState extends State<FakeListItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Hero(
          tag: widget.heroTag,
          child: Image.asset(widget.imageUrl),
        ),
      ),
    );
  }
}
