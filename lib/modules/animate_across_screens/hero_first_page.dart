import 'package:flutter/material.dart';
import 'package:flutter_animation_guide/components/custom_scaffold.dart';
import 'package:flutter_animation_guide/modules/animate_across_screens/hero_second_page.dart';
import 'package:flutter_animation_guide/navigation.dart';

class HeroFirstPage extends StatefulWidget {
  const HeroFirstPage({Key? key}) : super(key: key);

  @override
  _HeroFirstPageState createState() => _HeroFirstPageState();
}

class _HeroFirstPageState extends State<HeroFirstPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: Text('Hero First Page'),
      body: Center(
        child: Column(
          children: [
            Hero(
              tag: 'flutter-logo-asset',
              child: Image.asset(
                'assets/images/flutter_logo.png',
                height: 200,
                width: 200,
              ),
            ),
            SizedBox(height: 100),
            ElevatedButton(
              onPressed: () {
                push(context, HeroSecondPage());
              },
              child: Text('Push to initialize animation'),
            )
          ],
        ),
      ),
    );
  }
}
