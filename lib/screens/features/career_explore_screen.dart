import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../data/feature_dummy_data.dart';
import '../../models/feature_models.dart';
import '../../widgets/feature_widgets.dart';

/// 2. Eksplorasi Jurusan & Karier
/// - Roadmap interaktif SMP -> SMA/SMK -> Kuliah -> Karier
/// - Katalog jurusan & database profesi
/// - Future Skill Radar
class CareerExploreScreen extends StatelessWidget {
  const CareerExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: const FeatureAppBar(title: 'Eksplorasi Jurusan & Karier'),
        body: Column(
          children: [
            const TabBar(
              isScrollable: true,
              labelColor: AppColors.primary,
              unselectedLabelColor: AppColors.textSecondary,
              indicatorColor: AppColors.primary,
              labelStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
              tabs: [
                Tab(text: 'Roadmap'),
                Tab(text: 'Jurusan'),
                Tab(text: 'Profesi'),
                Tab(text: 'Future Skill'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _RoadmapTab(),
                  _MajorCatalogTab(),
                  _ProfessionTab(),
                  _FutureSkillTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RoadmapTab extends StatelessWidget {
  const _RoadmapTab();

  @override
  Widget build(BuildContext context) {
    final stages = FeatureDummyData.sampleRoadmap;

    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
      children: [
        Text('Roadmap: SIJA → Informatika → Software Engineer', style: AppTextStyles.subheading),
        const SizedBox(height: 4),
        Text('Visualisasi jalur dari sekarang sampai karier impianmu', style: AppTextStyles.caption),
        const SizedBox(height: 16),
        for (int i = 0; i < stages.length; i++) ...[
          _RoadmapNode(stage: stages[i], isLast: i == stages.length - 1),
        ],
      ],
    );
  }
}

class _RoadmapNode extends StatelessWidget {
  final CareerRoadmapStage stage;
  final bool isLast;
  const _RoadmapNode({required this.stage, required this.isLast});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle),
                child: const Icon(Icons.flag, color: Colors.white, size: 16),
              ),
              if (!isLast)
                Expanded(
                  child: Container(width: 2, color: AppColors.border),
                ),
            ],
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: AppCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppChip(label: stage.stage),
                    const SizedBox(height: 8),
                    Text(stage.title, style: AppTextStyles.subheading.copyWith(fontSize: 14)),
                    const SizedBox(height: 4),
                    Text(stage.description, style: AppTextStyles.caption),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: stage.skills
                          .map((s) => Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: AppColors.background,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: AppColors.border),
                                ),
                                child: Text(s, style: AppTextStyles.caption.copyWith(fontSize: 10)),
                              ))
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MajorCatalogTab extends StatelessWidget {
  const _MajorCatalogTab();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
      itemCount: FeatureDummyData.majors.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final m = FeatureDummyData.majors[index];
        return AppCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(child: Text(m.name, style: AppTextStyles.subheading.copyWith(fontSize: 14))),
                  AppChip(label: m.level, color: AppColors.accentGreen),
                ],
              ),
              const SizedBox(height: 6),
              Text(m.description, style: AppTextStyles.caption),
              const SizedBox(height: 10),
              Text('Prospek karier:', style: AppTextStyles.caption.copyWith(fontWeight: FontWeight.w600)),
              const SizedBox(height: 4),
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: m.careerProspects.map((c) => AppChip(label: c)).toList(),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(Icons.payments_outlined, size: 14, color: AppColors.textSecondary),
                  const SizedBox(width: 6),
                  Text(m.avgSalary, style: AppTextStyles.caption),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ProfessionTab extends StatelessWidget {
  const _ProfessionTab();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
      itemCount: FeatureDummyData.professions.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final p = FeatureDummyData.professions[index];
        return AppCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(child: Text(p.title, style: AppTextStyles.subheading.copyWith(fontSize: 14))),
                  Row(
                    children: [
                      Icon(
                        p.demandTrend == 'Naik' ? Icons.trending_up : Icons.trending_flat,
                        size: 14,
                        color: AppColors.success,
                      ),
                      const SizedBox(width: 4),
                      Text(p.demandTrend, style: AppTextStyles.caption.copyWith(color: AppColors.success)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Text(p.description, style: AppTextStyles.caption),
              const SizedBox(height: 10),
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: p.requiredSkills.map((s) => AppChip(label: s)).toList(),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(Icons.payments_outlined, size: 14, color: AppColors.textSecondary),
                  const SizedBox(width: 6),
                  Text(p.salaryRange, style: AppTextStyles.caption),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class _FutureSkillTab extends StatelessWidget {
  const _FutureSkillTab();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
      children: [
        Text('Future Skill Radar', style: AppTextStyles.subheading),
        const SizedBox(height: 4),
        Text('Skill dengan permintaan industri tertinggi 5 tahun ke depan', style: AppTextStyles.caption),
        const SizedBox(height: 16),
        ...FeatureDummyData.futureSkills.map((s) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: AppCard(
                child: Row(
                  children: [
                    const IconBadge(icon: Icons.radar),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(s.name, style: AppTextStyles.subheading.copyWith(fontSize: 13)),
                          Text(s.category, style: AppTextStyles.caption),
                          const SizedBox(height: 6),
                          AppProgressBar(value: s.growthPercent / 40, color: AppColors.accentGreen),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text('+${s.growthPercent}%', style: AppTextStyles.subheading.copyWith(color: AppColors.success, fontSize: 13)),
                  ],
                ),
              ),
            )),
      ],
    );
  }
}
