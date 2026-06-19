import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// Top bar sederhana berisi 2 ikon kiri (menu/bookmark, notifikasi)
/// dan status bar mock (wifi/baterai) di kanan, meniru wireframe.
class AppTopBar extends StatelessWidget implements PreferredSizeWidget {
  const AppTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: const [
                Icon(Icons.bookmark_border, size: 20, color: AppColors.textPrimary),
                SizedBox(width: 14),
                Icon(Icons.notifications_none, size: 20, color: AppColors.textPrimary),
              ],
            ),
            Row(
              children: const [
                Icon(Icons.wifi, size: 16, color: AppColors.textSecondary),
                SizedBox(width: 6),
                Icon(Icons.bluetooth, size: 16, color: AppColors.textSecondary),
                SizedBox(width: 6),
                Icon(Icons.battery_full, size: 16, color: AppColors.textSecondary),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(44);
}
