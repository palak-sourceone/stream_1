import 'package:flutter/material.dart';

import 'package:stream_1/notifiers/tabs_notifier.dart';
import 'package:stream_1/screens/home_page.dart';
import 'package:stream_1/screens/second.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  SelectedTabNotifier selectedTabNotifier = SelectedTabNotifier(0);
  List<Widget> pages = <Widget>[
    MyHomePage(),
    const Second(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: selectedTabNotifier,
      builder: (context, value, child) {
        return Scaffold(
          body: pages[value],
          appBar: AppBar(
            title: const Text("Meals"),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: value,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.set_meal),
                label: "Meals",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.star),
                label: "Favorite",
              ),
            ],
            onTap: (index) {
              selectedTabNotifier.setSelectedTabIndex(index);
            },
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    selectedTabNotifier.dispose();
    super.dispose();
  }
}
