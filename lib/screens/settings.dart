import 'package:flutter/material.dart';
import 'package:instgram_clone/screens/loginscreen.dart';
import 'package:instgram_clone/screens/search/searchscreen.dart';

import '../services/login_service.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        children: [
          ListTile(
            leading: const SizedBox(
              height: 30,
              width: 30,
              child: Icon(Icons.search),
            ),
            title: const Text('Search'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const SearchScreen()));
            },
          ),
          ListTile(
            leading: SizedBox(
                height: 30,
                width: 30,
                child: Image.asset('assets/images/notification.png')),
            title: const Text('Notifications'),
            onTap: () {},
          ),
          ListTile(
            leading: SizedBox(
                height: 30,
                width: 30,
                child: Image.asset('assets/images/privacy.png')),
            title: const Text('Privacy'),
            onTap: () {},
          ),
          ListTile(
            leading: SizedBox(
                height: 30,
                width: 30,
                child: Image.asset('assets/images/ads.png')),
            title: const Text('Ads'),
            onTap: () {},
          ),
          ListTile(
            leading: SizedBox(
                height: 30,
                width: 30,
                child: Image.asset('assets/images/help.png')),
            title: const Text('Help'),
            onTap: () {},
          ),
          ListTile(
            leading: SizedBox(
                height: 30,
                width: 30,
                child: Image.asset('assets/images/about.png')),
            title: const Text('About'),
            onTap: () {},
          ),
          ListTile(
            leading: SizedBox(
                height: 30,
                width: 30,
                child: Image.asset('assets/images/logout.png')),
            title: const Text('Log Out'),
            onTap: () async {
              await logout();
              Navigator.popUntil(context, (route) => route.isFirst);
                  Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: ( context) =>
                                  const LoginScreen()));
            },
          ),
        ],
      ),
    );
  }
}
