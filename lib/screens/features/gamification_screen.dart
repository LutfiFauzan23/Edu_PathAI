import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../data/feature_dummy_data.dart';
import '../../models/feature_models.dart';
import '../../widgets/feature_widgets.dart';

/// 12. Gamifikasi
/// - Badge & XP (lencana, level pengguna, poin aktivitas)
/// - Daily Mission
class GamificationScreen extends StatelessWidget {
  const GamificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final xp = FeatureDummyData.currentXp;
    final xpNext = FeatureDummyData.xpToNextLevel;
    final level = FeatureDummyData.currentLevel;
    final progress = xp / xpNext;

    return Scaffold(
      appBar: const FeatureAppBar(title: 'Gamifikasi'),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppColors.primary, Color(0xFF8B5CF6)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(color: Colors.white24, shape: BoxShape.circle),
                      child: Center(
                        child: Text('$level', style: AppTextStyles.heading.copyWith(color: Colors.white)),
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Level $level', style: AppTextStyles.subheading.copyWith(color: Colors.white)),
                          Text('$xp / $xpNext XP', style: AppTextStyles.caption.copyWith(color: Colors.white70)),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: LinearProgressIndicator(
                    value: progress.clamp(0, 1),
                    minHeight: 8,
                    backgroundColor: Colors.white24,
                    valueColor: const AlwaysStoppedAnimation(Colors.white),
                  ),
                ),
                const SizedBox(height: 6),
                Text('${xpNext - xp} XP lagi menuju Level ${level + 1}', style: AppTextStyles.caption.copyWith(color: Colors.white70)),
              ],
            ),
          ),
          const SizedBox(height: 20),
          SectionTitle(title: 'Daily Mission'),
          const SizedBox(height: 10),
          ...FeatureDummyData.dailyMissions.map((m) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: _MissionCard(mission: m),
              )),
          const SizedBox(height: 10),
          SectionTitle(title: 'Koleksi Badge'),
          const SizedBox(height: 10),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: FeatureDummyData.badges.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.85,
            ),
            itemBuilder: (context, index) => _BadgeTile(badge: FeatureDummyData.badges[index]),
          ),
        ],
      ),
    );
  }
}

class _MissionCard extends StatelessWidget {
  final DailyMission mission;
  const _MissionCard({required this.mission});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Row(
        children: [
          Icon(
            mission.isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
            color: mission.isCompleted ? AppColors.success : AppColors.textSecondary,
            size: 22,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              mission.title,
              style: AppTextStyles.body.copyWith(
                color: AppColors.textPrimary,
                decoration: mission.isCompleted ? TextDecoration.lineThrough : null,
              ),
            ),
          ),
          AppChip(label: '+${mission.xpReward} XP', color: AppColors.warning),
        ],
      ),
    );
  }
}

class _BadgeTile extends StatelessWidget {
  final AchievementBadge badge;
  const _BadgeTile({required this.badge});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 6),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconBadge(
            icon: mapIconName(badge.iconName),
            size: 40,
            background: badge.isUnlocked ? AppColors.primaryLight : AppColors.background,
            iconColor: badge.isUnlocked ? AppColors.primary : AppColors.textSecondary,
          ),
          const SizedBox(height: 8),
          Text(
            badge.name,
            style: AppTextStyles.caption.copyWith(
              fontSize: 10,
              color: badge.isUnlocked ? AppColors.textPrimary : AppColors.textSecondary,
              fontWeight: badge.isUnlocked ? FontWeight.w600 : FontWeight.normal,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
