import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../data/feature_dummy_data.dart';
import '../../models/feature_models.dart';
import '../../widgets/feature_widgets.dart';

/// 1. Asesmen & Profiling Cerdas
/// - Tes Minat Bakat AI (psikometri interaktif)
/// - Profil Kompetensi (hard/soft skill)
/// - Dashboard riwayat tes
class AssessmentScreen extends StatelessWidget {
  const AssessmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: const FeatureAppBar(title: 'Asesmen & Profiling'),
        body: Column(
          children: [
            const TabBar(
              labelColor: AppColors.primary,
              unselectedLabelColor: AppColors.textSecondary,
              indicatorColor: AppColors.primary,
              labelStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
              tabs: [
                Tab(text: 'Hasil Tes Minat Bakat'),
                Tab(text: 'Profil Kompetensi'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _PersonalityResultTab(),
                  _CompetencyTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PersonalityResultTab extends StatelessWidget {
  const _PersonalityResultTab();

  @override
  Widget build(BuildContext context) {
    final result = FeatureDummyData.personalityResult;

    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
      children: [
        AppCard(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.auto_awesome, color: AppColors.primary, size: 18),
                  const SizedBox(width: 6),
                  Text('Tipe Kepribadianmu', style: AppTextStyles.caption),
                ],
              ),
              const SizedBox(height: 6),
              Text(result.type, style: AppTextStyles.heading.copyWith(color: AppColors.primary)),
              const SizedBox(height: 8),
              Text(result.description, style: AppTextStyles.body),
            ],
          ),
        ),
        const SizedBox(height: 16),
        SectionTitle(title: 'Kekuatan Utama'),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: result.strengths.map((s) => AppChip(label: s)).toList(),
        ),
        const SizedBox(height: 20),
        SectionTitle(title: 'Rekomendasi Jurusan (AI Matching)'),
        const SizedBox(height: 10),
        ...result.recommendedMajors.map((m) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: _MajorMatchCard(major: m),
            )),
        const SizedBox(height: 10),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.refresh, size: 16, color: AppColors.primary),
            label: Text('Ulangi Tes Minat Bakat', style: AppTextStyles.caption.copyWith(color: AppColors.primary)),
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: AppColors.border),
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
          ),
        ),
      ],
    );
  }
}

class _MajorMatchCard extends StatelessWidget {
  final MajorRecommendation major;
  const _MajorMatchCard({required this.major});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(major.name, style: AppTextStyles.subheading.copyWith(fontSize: 13)),
                const SizedBox(height: 2),
                Text(major.reason, style: AppTextStyles.caption),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${major.matchPercent}%',
                style: AppTextStyles.subheading.copyWith(color: AppColors.success, fontSize: 16),
              ),
              Text('match', style: AppTextStyles.caption.copyWith(fontSize: 10)),
            ],
          ),
        ],
      ),
    );
  }
}

class _CompetencyTab extends StatelessWidget {
  const _CompetencyTab();

  @override
  Widget build(BuildContext context) {
    final hardSkills = FeatureDummyData.skillCompetencies.where((s) => s.isHardSkill).toList();
    final softSkills = FeatureDummyData.skillCompetencies.where((s) => !s.isHardSkill).toList();

    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
      children: [
        SectionTitle(title: 'Hard Skill'),
        const SizedBox(height: 10),
        AppCard(
          child: Column(
            children: hardSkills.map((s) => _SkillRow(skill: s)).toList(),
          ),
        ),
        const SizedBox(height: 20),
        SectionTitle(title: 'Soft Skill'),
        const SizedBox(height: 10),
        AppCard(
          child: Column(
            children: softSkills.map((s) => _SkillRow(skill: s)).toList(),
          ),
        ),
        const SizedBox(height: 20),
        AppCard(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              const IconBadge(icon: Icons.lightbulb_outline),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Potensi Karier Teridentifikasi', style: AppTextStyles.subheading.copyWith(fontSize: 13)),
                    Text('Software Engineer, Product Designer', style: AppTextStyles.caption),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SkillRow extends StatelessWidget {
  final SkillCompetency skill;
  const _SkillRow({required this.skill});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(skill.name, style: AppTextStyles.body.copyWith(color: AppColors.textPrimary)),
              Text('${skill.level}%', style: AppTextStyles.caption.copyWith(color: AppColors.primary, fontWeight: FontWeight.w600)),
            ],
          ),
          const SizedBox(height: 6),
          AppProgressBar(value: skill.level / 100),
        ],
      ),
    );
  }
}
