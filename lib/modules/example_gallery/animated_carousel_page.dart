import 'package:flutter/material.dart';

class AnimatedCarouselPage extends StatefulWidget {
  const AnimatedCarouselPage({Key? key}) : super(key: key);

  @override
  _AnimatedCarouselPageState createState() => _AnimatedCarouselPageState();
}

class _AnimatedCarouselPageState extends State<AnimatedCarouselPage> {
  late final List<_CarouselItemModel> items;
  int _currentPage = 0;
  late final PageController _pageController;

  @override
  void initState() {
    items = [
      _CarouselItemModel(
        id: 1,
        imageUrl: 'assets/images/carousel-animal-1.jpeg',
      ),
      _CarouselItemModel(
        id: 2,
        imageUrl: 'assets/images/carousel-animal-2.jpeg',
      ),
      _CarouselItemModel(
        id: 3,
        imageUrl: 'assets/images/carousel-animal-3.jpeg',
      )
    ];
    _pageController = PageController(
      initialPage: _currentPage,
      viewportFraction: 0.75,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Carousel'),
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: items.length,
        onPageChanged: (page) {
          setState(() {
            _currentPage = page;
          });
        },
        itemBuilder: (_, page) {
          final carouselItem = items[page];
          final isActive = page == _currentPage;
          return _CarouselIitemWidget(
            carouselItem: carouselItem,
            isActive: isActive,
          );
        },
      ),
    );
  }
}

class _CarouselIitemWidget extends StatelessWidget {
  const _CarouselIitemWidget({
    Key? key,
    required this.carouselItem,
    required this.isActive,
  }) : super(key: key);

  final _CarouselItemModel carouselItem;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final double horizontalMargin = 16;
    final double verticalMargin = isActive ? 16 : 32;
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(
        horizontal: horizontalMargin,
        vertical: verticalMargin,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        color: Colors.red,
        image: DecorationImage(
          image: AssetImage(
            carouselItem.imageUrl,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _CarouselItemModel {
  final int id;
  final String imageUrl;

  _CarouselItemModel({
    required this.id,
    required this.imageUrl,
  });
}
