import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'beranda_screen.dart';
import 'explore_screen.dart';
import 'features/ai_assistant_screen.dart';
import 'progress_screen.dart';
import 'profile_screen.dart';

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
    AiAssistantScreen(),
    ProgressScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _screens),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppColors.card,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 12,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: SafeArea(
          top: false,
          child: SizedBox(
            height: 60,
            child: Row(
              children: [
                _navItem(0, Icons.home_outlined, Icons.home_rounded, 'Beranda'),
                _navItem(1, Icons.explore_outlined, Icons.explore, 'Explore'),
                _navItemCenter(),
                _navItem(3, Icons.bar_chart_outlined, Icons.bar_chart_rounded, 'Progress'),
                _navItem(4, Icons.person_outline, Icons.person_rounded, 'Profil'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _navItem(int index, IconData icon, IconData activeIcon, String label) {
    final isActive = _currentIndex == index;
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => setState(() => _currentIndex = index),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isActive ? activeIcon : icon,
              size: 22,
              color: isActive ? AppColors.primary : AppColors.textSecondary,
            ),
            const SizedBox(height: 3),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
                color: isActive ? AppColors.primary : AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _navItemCenter() {
    final isActive = _currentIndex == 2;
    return GestureDetector(
      onTap: () => setState(() => _currentIndex = 2),
      child: Container(
        width: 56,
        height: 56,
        margin: const EdgeInsets.only(bottom: 4),
        decoration: BoxDecoration(
          color: isActive ? AppColors.primary : AppColors.primary,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withValues(alpha: 0.4),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isActive ? Icons.auto_awesome : Icons.auto_awesome_outlined,
              size: 22,
              color: Colors.white,
            ),
            const Text('EduAI',
                style: TextStyle(
                    color: Colors.white, fontSize: 8, fontWeight: FontWeight.w700)),
          ],
        ),
      ),
    );
  }
}
