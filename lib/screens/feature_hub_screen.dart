import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../data/feature_dummy_data.dart';
import '../models/feature_models.dart';
import '../widgets/feature_widgets.dart';

import 'features/assessment_screen.dart';
import 'features/career_explore_screen.dart';
import 'features/school_catalog_screen.dart';
import 'features/snbp_snbt_screen.dart';
import 'features/scholarship_screen.dart';
import 'features/portfolio_screen.dart';
import 'features/internship_screen.dart';
import 'features/ai_assistant_screen.dart';
import 'features/productivity_screen.dart';
import 'features/forum_screen.dart';
import 'features/dashboard_guardian_screen.dart';
import 'features/gamification_screen.dart';
import 'features/analytics_screen.dart';
import 'features/premium_screen.dart';

/// Halaman tengah (tab "EduAI") yang berfungsi sebagai hub/menu utama
/// menuju 14 kategori fitur EduPath AI.
class FeatureHubScreen extends StatelessWidget {
  const FeatureHubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const FeatureAppBar(title: 'EduPath AI Hub'),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
        children: [
          Text(
            'Semua fitur EduPath AI ada di sini 🚀',
            style: AppTextStyles.subheading,
          ),
          const SizedBox(height: 4),
          Text(
            'Pilih kategori untuk mulai merencanakan pendidikan & kariermu',
            style: AppTextStyles.caption,
          ),
          const SizedBox(height: 16),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: FeatureDummyData.categories.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.05,
            ),
            itemBuilder: (context, index) {
              final category = FeatureDummyData.categories[index];
              return _CategoryCard(category: category);
            },
          ),
        ],
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  final FeatureCategory category;

  const _CategoryCard({required this.category});

  void _navigate(BuildContext context) {
    final Widget destination = switch (category.routeKey) {
      'assessment' => const AssessmentScreen(),
      'career_explore' => const CareerExploreScreen(),
      'school_catalog' => const SchoolCatalogScreen(),
      'snbp_snbt' => const SnbpSnbtScreen(),
      'scholarship' => const ScholarshipScreen(),
      'portfolio' => const PortfolioScreen(),
      'internship' => const InternshipScreen(),
      'ai_assistant' => const AiAssistantScreen(),
      'productivity' => const ProductivityScreen(),
      'forum' => const ForumScreen(),
      'dashboard_guardian' => const DashboardGuardianScreen(),
      'gamification' => const GamificationScreen(),
      'analytics' => const AnalyticsScreen(),
      'premium' => const PremiumScreen(),
      _ => const SizedBox.shrink(),
    };

    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => destination),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onTap: () => _navigate(context),
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconBadge(icon: mapIconName(category.iconName)),
          const Spacer(),
          Text(
            category.title,
            style: AppTextStyles.subheading.copyWith(fontSize: 13),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 2),
          Text(
            category.subtitle,
            style: AppTextStyles.caption.copyWith(fontSize: 10),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
