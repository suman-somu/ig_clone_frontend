import 'package:flutter/material.dart';
import 'package:instgram_clone/screens/picker_page.dart';
import 'package:instgram_clone/screens/home/homefeed.dart';
import 'package:instgram_clone/screens/profilepage.dart';
import 'package:instgram_clone/screens/search/searchscreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, Key? k});

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
      body: _pages[_currentIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          // Set the desired height of the bottom navigation bar
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
              icon: Icon(Icons.notifications_outlined),
              activeIcon: Icon(Icons.notifications),
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
