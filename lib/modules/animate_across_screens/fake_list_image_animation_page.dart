import 'package:flutter/material.dart';
import 'package:flutter_animation_guide/components/custom_scaffold.dart';
import 'package:flutter_animation_guide/modules/animate_across_screens/fake_list_item_page.dart';
import 'package:flutter_animation_guide/navigation.dart';

class FakeListImageAnimationPage extends StatefulWidget {
  const FakeListImageAnimationPage({Key? key}) : super(key: key);

  @override
  _FakeListImageAnimationPageState createState() =>
      _FakeListImageAnimationPageState();
}

class _FakeListImageAnimationPageState
    extends State<FakeListImageAnimationPage> {
  late final List<String> names;

  @override
  void initState() {
    names = List<String>.generate(100, (index) => 'User $index');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      needScrollScreen: false,
      title: Text('Fake List'),
      body: ListView.builder(
        itemCount: names.length,
        itemBuilder: (_, index) {
          final name = names[index];
          return ListTile(
            title: Text(name),
            leading: Hero(
              tag: 'item_$index',
              child: Image.asset(
                setImageUrl(index),
              ),
            ),
            onTap: () => push(
              context,
              FakeListItemPage(
                imageUrl: setImageUrl(index),
                heroTag: 'item_$index',
              ),
            ),
          );
        },
      ),
    );
  }

  String setImageUrl(int index) {
    if (index % 2 == 0) {
      return 'assets/images/smart-black-logo.jpeg';
    } else {
      return 'assets/images/smart-white-logo.png';
    }
  }
}
