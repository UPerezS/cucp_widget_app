import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);
}

final slides = <SlideInfo>[
  SlideInfo(
      'Comida',
      'Minim quis commodo proident sit qui eiusmod. Fugiat elit voluptate deserunt sit aliquip sunt ut et ullamco reprehenderit dolor ea minim. Veniam ut mollit amet sint nostrud. Reprehenderit ipsum laborum velit proident non labore velit incididunt nulla nulla quis laborum. Consequat nulla voluptate elit reprehenderit ea et nulla adipisicing laborum sit reprehenderit occaecat.',
      'assets/images/1.png'),
  SlideInfo(
      'Entrega',
      'Sunt ea adipisicing esse sint laborum nulla dolor excepteur amet do dolore incididunt. Non labore ad non deserunt ad adipisicing ut fugiat sit dolore commodo id occaecat. Ea ullamco culpa deserunt Lorem labore magna deserunt ex officia incididunt magna occaecat. Voluptate velit id excepteur incididunt consectetur ipsum consequat excepteur excepteur esse. Incididunt sint in in velit ea enim voluptate ex non do sunt et aliquip. Cillum irure amet proident consequat tempor. Aliquip ad sint irure occaecat excepteur velit aute qui exercitation eiusmod minim cillum.',
      'assets/images/2.png'),
  SlideInfo(
      'Entrega',
      'Cupidatat in commodo eu occaecat eu commodo est laboris excepteur qui. Dolore sit cillum fugiat velit commodo. Quis qui dolor anim in. Tempor qui tempor dolor Lorem voluptate dolore laboris ut anim.',
      'assets/images/3.png')
];

class AppTutorialScreen extends StatefulWidget {
  static const String name = "app_tutorial_screen";

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageViewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();

    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;
      if (!endReached && page >= (slides.length - 1.5)) {
        setState(() {
          endReached = true;
        });
      }
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
              controller: pageViewController,
              physics: const BouncingScrollPhysics(),
              children: slides
                  .map((slideData) => _Slide(
                      title: slideData.title,
                      caption: slideData.caption,
                      imageUrl: slideData.imageUrl))
                  .toList()),
          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              onPressed: () => context.pop(),
              child: const Text('Salir'),
            ),
          ),
          endReached
              ? Positioned(
                  bottom: 30,
                  right: 30,
                  child: FadeInRight(
                    from: 15,
                    duration: const Duration(seconds: 1),
                    child: FilledButton(
                      onPressed: () => context.pop(),
                      child: const Text('Comenzar'),
                    ),
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide(
      {required this.title, required this.caption, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(imageUrl)),
            const SizedBox(
              height: 20,
            ),
            Text(
              title,
              style: titleStyle,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              caption,
              style: captionStyle,
            ),
          ],
        ),
      ),
    );
  }
}