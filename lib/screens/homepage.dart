import 'package:flutter/material.dart';
import 'package:instgram_clone/screens/post/views/picker_page.dart';
import 'package:instgram_clone/screens/feed/views/homefeed.dart';
import 'package:instgram_clone/screens/account/views/profilepage.dart';
import 'package:lazy_load_indexed_stack/lazy_load_indexed_stack.dart';

import 'search/views/explore.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key, Key? k});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeFeed(),
    const SearchScreen(),
    const PickerPage(),
    const NotificationsScreen(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: _pages[_currentIndex],
      body: LazyLoadIndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          canvasColor: Colors.white,
          primaryColor: Colors.black,
          textTheme: Theme.of(context).textTheme.copyWith(
                bodySmall: const TextStyle(fontSize: 0),
              ),
          primaryIconTheme: const IconThemeData(
            size: 24,
          ),
          iconTheme: const IconThemeData(
            size: 24,
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_box_outlined),
              activeIcon: Icon(Icons.add_box),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              activeIcon: Icon(Icons.favorite),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined),
              activeIcon: Icon(Icons.person_2),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: const Center(
        child: Text('Notifications Screen'),
      ),
    );
  }
}
