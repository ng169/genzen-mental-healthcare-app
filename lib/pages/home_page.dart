import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mental_health/components/bottom_nav_bar.dart';
import 'package:mental_health/pages/activities_page.dart';
import 'package:mental_health/pages/chat_page.dart';
import 'package:mental_health/pages/hero_page.dart';
import 'package:mental_health/pages/profile_page.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser;

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  int _selectedIndex = 0;
  void navigateBottomBar(int newindex) {
    setState(() {
      _selectedIndex = newindex;
    });
  }

  void onCallPress() {
    final Uri url = Uri.parse("tel:1800-599-0019");
    launchUrl(url);
  }

  final List<Widget> _pages = [
    const HeroPage(),
    const ChatScreen(),
    const ActivitiesScreen(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('GenZen'), actions: [
        IconButton(
          onPressed: onCallPress,
          icon: const Icon(Icons.call),
        ),
        IconButton(
          onPressed: signUserOut,
          icon: const Icon(Icons.logout),
        ),
      ]),
      backgroundColor: Colors.grey[100],
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
