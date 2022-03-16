import 'package:flutter/material.dart';

class CustomScaffold extends StatefulWidget {
  final Text title;
  final Widget body;
  final bool scaffoldEnabled;
  final FloatingActionButton? floatingActionButton;
  final bool needScrollScreen;

  const CustomScaffold(
      {Key? key,
      required this.title,
      required this.body,
      this.scaffoldEnabled = true,
      this.floatingActionButton,
      this.needScrollScreen = true})
      : super(key: key);

  @override
  _CustomScaffoldState createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: widget.scaffoldEnabled
            ? AppBar(
                title: widget.title,
              )
            : null,
        body: widget.needScrollScreen
            ? SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: widget.body,
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(16),
                child: widget.body,
              ),
        floatingActionButton: widget.floatingActionButton,
      ),
    );
  }
}
