import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../data/feature_dummy_data.dart';
import '../../models/feature_models.dart';
import '../../widgets/feature_widgets.dart';
import 'portfolio_screen.dart' show DummyDataDateFormatter;

/// 5. Scholarship Matcher
/// - Radar Beasiswa (dalam/luar negeri, pemerintah/swasta)
/// - AI Matching & Reminder deadline
class ScholarshipScreen extends StatelessWidget {
  const ScholarshipScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sorted = [...FeatureDummyData.scholarships]
      ..sort((a, b) => b.matchPercent.compareTo(a.matchPercent));

    return Scaffold(
      appBar: const FeatureAppBar(title: 'Scholarship Matcher'),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
        children: [
          AppCard(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                const IconBadge(icon: Icons.auto_awesome, size: 40),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('AI Matching aktif', style: AppTextStyles.subheading.copyWith(fontSize: 13)),
                      Text(
                        'Beasiswa diurutkan sesuai nilai & prestasimu',
                        style: AppTextStyles.caption,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          SectionTitle(title: 'Radar Beasiswa', subtitle: '${sorted.length} beasiswa tersedia'),
          const SizedBox(height: 10),
          ...sorted.map((s) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: _ScholarshipCard(scholarship: s),
              )),
        ],
      ),
    );
  }
}

class _ScholarshipCard extends StatelessWidget {
  final ScholarshipInfo scholarship;
  const _ScholarshipCard({required this.scholarship});

  @override
  Widget build(BuildContext context) {
    final daysLeft = scholarship.deadline.difference(DateTime(2026, 6, 20)).inDays;
    final formattedDeadline = DummyDataDateFormatter.format(scholarship.deadline);

    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(child: Text(scholarship.name, style: AppTextStyles.subheading.copyWith(fontSize: 14))),
              Text(
                '${scholarship.matchPercent}%',
                style: AppTextStyles.subheading.copyWith(color: AppColors.success, fontSize: 15),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(scholarship.provider, style: AppTextStyles.caption),
          const SizedBox(height: 8),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: [
              AppChip(label: scholarship.origin, color: AppColors.accentGreen),
              AppChip(label: scholarship.type),
            ],
          ),
          const SizedBox(height: 10),
          Text('Syarat utama:', style: AppTextStyles.caption.copyWith(fontWeight: FontWeight.w600)),
          const SizedBox(height: 4),
          ...scholarship.requirements.map((r) => Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('• ', style: AppTextStyles.caption),
                    Expanded(child: Text(r, style: AppTextStyles.caption)),
                  ],
                ),
              )),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              color: daysLeft <= 30 ? AppColors.warning.withValues(alpha: 0.12) : AppColors.background,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.notifications_active_outlined,
                  size: 14,
                  color: daysLeft <= 30 ? AppColors.warning : AppColors.textSecondary,
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    'Deadline $formattedDeadline ($daysLeft hari lagi)',
                    style: AppTextStyles.caption.copyWith(
                      color: daysLeft <= 30 ? AppColors.warning : AppColors.textSecondary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
