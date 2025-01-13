import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:toggleview/wallpapers.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isToggled = false;

  void toggleDisplayStyle() {
    setState(() {
      isToggled = !isToggled;
    });
  }

  List<Map<String, String>> wallpaperList = [
    {
      'image': 'assets/images/backpacker-7628303.jpg',
      'title': 'Walking Forest',
      'subtitle': 'Japan'
    },
    {
      'image': 'assets/images/ai-generated-8886225.jpg',
      'title': 'AI Forest',
      'subtitle': 'Future World'
    },
    {
      'image': 'assets/images/ninja-7701126.jpg',
      'title': 'Ninja Trails',
      'subtitle': 'Japan'
    },
    {
      'image': 'assets/images/backpacker-7628303.jpg',
      'title': 'Walking Forest',
      'subtitle': 'Japan'
    },
    {
      'image': 'assets/images/ai-generated-8886225.jpg',
      'title': 'AI Forest',
      'subtitle': 'Future World'
    },
    {
      'image': 'assets/images/ninja-7701126.jpg',
      'title': 'Ninja Trails',
      'subtitle': 'Japan'
    },
    {
      'image': 'assets/images/backpacker-7628303.jpg',
      'title': 'Walking Forest',
      'subtitle': 'Japan'
    },
    {
      'image': 'assets/images/ai-generated-8886225.jpg',
      'title': 'AI Forest',
      'subtitle': 'Future World'
    },
    {
      'image': 'assets/images/ninja-7701126.jpg',
      'title': 'Ninja Trails',
      'subtitle': 'Japan'
    },
    {
      'image': 'assets/images/backpacker-7628303.jpg',
      'title': 'Walking Forest',
      'subtitle': 'Japan'
    },
    {
      'image': 'assets/images/ai-generated-8886225.jpg',
      'title': 'AI Forest',
      'subtitle': 'Future World'
    },
    {
      'image': 'assets/images/ninja-7701126.jpg',
      'title': 'Ninja Trails',
      'subtitle': 'Japan'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 25, 35, 48),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 25, 35, 48),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),

            // animated switcher responsible for the animation
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 400),
              switchInCurve: Curves.easeInOut,
              switchOutCurve: Curves.easeInOut,
              child: IconButton(
                style: IconButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 93, 123, 163),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                color: Colors.white,
                // check function above for the toggling between the gridview and list view widgets
                onPressed: toggleDisplayStyle,

                //changes the icon when istoggled and vice versa
                icon: Icon(isToggled ? Icons.apps : Icons.layers),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          switchInCurve: Curves.easeInOut,
          switchOutCurve: Curves.easeInOut,
          transitionBuilder: (child, animation) => FadeTransition(
            opacity: animation,
            child: child,
          ),
          child: isToggled
              // then gridview
              ? GridView.builder(
                  key: const ValueKey("GridView"),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemCount: wallpaperList.length,
                  itemBuilder: (context, index) {
                    final wallpaper = wallpaperList[index];
                    return AnimationConfiguration.staggeredGrid(
                      position: index,
                      columnCount: 2,
                      duration: const Duration(milliseconds: 500),
                      child: ScaleAnimation(
                        scale: .1,
                        child: FadeInAnimation(
                          child: WallpapersWidget(
                            image: wallpaper['image']!,
                            title: wallpaper['title']!,
                            subtitle: wallpaper['subtitle']!,
                          ),
                        ),
                      ),
                    );
                  },
                )

              // otherwise the listview
              : ListView.builder(
                  key: const ValueKey("ListView"),
                  itemCount: wallpaperList.length,
                  itemBuilder: (context, index) {
                    final wallpaper = wallpaperList[index];
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 500),
                      child: ScaleAnimation(
                        scale: .1,
                        child: FadeInAnimation(
                          child: WallpapersWidget(
                            image: wallpaper['image']!,
                            title: wallpaper['title']!,
                            subtitle: wallpaper['subtitle']!,
                          ),
                        ),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
