import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// Kumpulan widget kecil yang dipakai berulang kali di layar-layar fitur
/// supaya gaya visual tetap konsisten dengan desain awal (card putih,
/// border tipis, rounded corner, warna ungu sebagai aksen).

/// Top bar sederhana dengan judul & tombol kembali, dipakai oleh
/// semua screen fitur (bukan AppTopBar yang dipakai di tab utama).
class FeatureAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;

  const FeatureAppBar({super.key, required this.title, this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.background,
      elevation: 0,
      scrolledUnderElevation: 0,
      iconTheme: const IconThemeData(color: AppColors.textPrimary),
      title: Text(title, style: AppTextStyles.subheading),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}

/// Card dasar putih dengan border tipis -- dipakai di hampir semua tempat.
class AppCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onTap;

  const AppCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(14),
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final card = Container(
      padding: padding,
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border),
      ),
      child: child,
    );

    if (onTap == null) return card;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: card,
    );
  }
}

/// Header section dengan judul + subjudul opsional + tautan "Lihat semua".
class SectionTitle extends StatelessWidget {
  final String title;
  final String? subtitle;
  final VoidCallback? onSeeAll;

  const SectionTitle({super.key, required this.title, this.subtitle, this.onSeeAll});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppTextStyles.subheading),
              if (subtitle != null) Text(subtitle!, style: AppTextStyles.caption),
            ],
          ),
        ),
        if (onSeeAll != null)
          GestureDetector(
            onTap: onSeeAll,
            child: Text(
              'Lihat semua >',
              style: AppTextStyles.caption.copyWith(color: AppColors.primary),
            ),
          ),
      ],
    );
  }
}

/// Badge kecil berwarna untuk status/kategori/persentase match.
class AppChip extends StatelessWidget {
  final String label;
  final Color color;

  const AppChip({super.key, required this.label, this.color = AppColors.primary});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: AppTextStyles.caption.copyWith(color: color, fontWeight: FontWeight.w600, fontSize: 10),
      ),
    );
  }
}

/// Progress bar tipis horizontal, dipakai untuk skill level, XP, dsb.
class AppProgressBar extends StatelessWidget {
  final double value; // 0..1
  final Color color;

  const AppProgressBar({super.key, required this.value, this.color = AppColors.primary});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: LinearProgressIndicator(
        value: value.clamp(0, 1),
        minHeight: 6,
        backgroundColor: AppColors.border,
        valueColor: AlwaysStoppedAnimation(color),
      ),
    );
  }
}

/// Kartu ikon bulat kecil berwarna primaryLight, dipakai di banyak list item.
class IconBadge extends StatelessWidget {
  final IconData icon;
  final double size;
  final Color background;
  final Color iconColor;

  const IconBadge({
    super.key,
    required this.icon,
    this.size = 36,
    this.background = AppColors.primaryLight,
    this.iconColor = AppColors.primary,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(color: background, borderRadius: BorderRadius.circular(size * 0.3)),
      child: Icon(icon, size: size * 0.5, color: iconColor),
    );
  }
}

/// Empty state sederhana untuk list kosong / fitur belum ada data.
class EmptyState extends StatelessWidget {
  final IconData icon;
  final String message;

  const EmptyState({super.key, required this.icon, required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: Column(
        children: [
          Icon(icon, size: 40, color: AppColors.textSecondary),
          const SizedBox(height: 10),
          Text(message, style: AppTextStyles.caption, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}

/// Memetakan iconName (String) dari model/dummy data ke IconData Material.
/// Dipusatkan di sini supaya konsisten dan gampang ditambah.
IconData mapIconName(String name) {
  switch (name) {
    case 'psychology':
      return Icons.psychology_outlined;
    case 'explore':
      return Icons.explore_outlined;
    case 'school':
      return Icons.school_outlined;
    case 'fact_check':
      return Icons.fact_check_outlined;
    case 'card_giftcard':
      return Icons.card_giftcard_outlined;
    case 'folder_special':
      return Icons.folder_special_outlined;
    case 'work':
      return Icons.work_outline;
    case 'smart_toy':
      return Icons.smart_toy_outlined;
    case 'event_note':
      return Icons.event_note_outlined;
    case 'forum':
      return Icons.forum_outlined;
    case 'supervisor_account':
      return Icons.supervisor_account_outlined;
    case 'emoji_events':
      return Icons.emoji_events_outlined;
    case 'insights':
      return Icons.insights_outlined;
    case 'workspace_premium':
      return Icons.workspace_premium_outlined;
    case 'star':
      return Icons.star_outline;
    case 'local_fire_department':
      return Icons.local_fire_department_outlined;
    case 'military_tech':
      return Icons.military_tech_outlined;
    case 'volunteer_activism':
      return Icons.volunteer_activism_outlined;
    case 'support_agent':
      return Icons.support_agent_outlined;
    case 'description':
      return Icons.description_outlined;
    default:
      return Icons.circle_outlined;
  }
}
