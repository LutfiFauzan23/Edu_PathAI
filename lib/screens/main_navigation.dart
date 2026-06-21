import 'package:flutter/material.dart';
import '../widgets/app_bottom_nav.dart';
import 'beranda_screen.dart';
import 'explore_screen.dart';
import 'progress_screen.dart';
import 'profile_screen.dart';
import 'feature_hub_screen.dart';

/// Menyatukan Beranda, Explore, EduAI Hub, Progress, Profile dalam satu
/// shell dengan bottom navigation.
class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  static const _screens = [
    BerandaScreen(),
    ExploreScreen(),
    FeatureHubScreen(),
    ProgressScreen(),
    ProfileScreen(),
  ];

  void _onTabTapped(int index) {
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: AppBottomNav(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),
    );
  }
}
