import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// Bottom navigation bar dengan 5 item, tombol tengah (EduAI) ditonjolkan
/// sesuai wireframe (lingkaran ungu dengan ikon target/AI).
class AppBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const AppBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  static const _labels = ['Beranda', 'Explore', 'EduAI', 'Progress', 'Profile'];
  static const _icons = [
    Icons.home_outlined,
    Icons.explore_outlined,
    Icons.track_changes,
    Icons.bar_chart_outlined,
    Icons.person_outline,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
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
        child: SizedBox(
          height: 64,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(_labels.length, (index) {
              final isCenter = index == 2;
              final isSelected = currentIndex == index;

              if (isCenter) {
                return GestureDetector(
                  onTap: () => onTap(index),
                  child: Container(
                    width: 48,
                    height: 48,
                    decoration: const BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(_icons[index], color: Colors.white, size: 22),
                  ),
                );
              }

              return GestureDetector(
                onTap: () => onTap(index),
                behavior: HitTestBehavior.opaque,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      _icons[index],
                      size: 22,
                      color: isSelected ? AppColors.primary : AppColors.textSecondary,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      _labels[index],
                      style: AppTextStyles.caption.copyWith(
                        color: isSelected ? AppColors.primary : AppColors.textSecondary,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
