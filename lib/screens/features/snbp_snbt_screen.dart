import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../data/feature_dummy_data.dart';
import '../../data/dummy_data.dart';
import '../../models/feature_models.dart';
import '../../widgets/feature_widgets.dart';

/// 4. Persiapan SNBP & SNBT
/// - Tracker Rapor & Kalkulator SNBP
/// - Simulasi SNBT & Bank Soal (tryout online)
class SnbpSnbtScreen extends StatelessWidget {
  const SnbpSnbtScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: const FeatureAppBar(title: 'SNBP & SNBT'),
        body: Column(
          children: [
            const TabBar(
              labelColor: AppColors.primary,
              unselectedLabelColor: AppColors.textSecondary,
              indicatorColor: AppColors.primary,
              labelStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
              tabs: [
                Tab(text: 'SNBP'),
                Tab(text: 'SNBT'),
              ],
            ),
            Expanded(
              child: TabBarView(children: [_SnbpTab(), _SnbtTab()]),
            ),
          ],
        ),
      ),
    );
  }
}

class _SnbpTab extends StatelessWidget {
  const _SnbpTab();

  @override
  Widget build(BuildContext context) {
    final user = DummyData.user;

    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
      children: [
        SectionTitle(title: 'Tracker Rapor'),
        const SizedBox(height: 10),
        AppCard(
          child: Column(
            children: user.subjectScores.entries
                .map((e) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Row(
                        children: [
                          Expanded(child: Text(e.key, style: AppTextStyles.body.copyWith(color: AppColors.textPrimary))),
                          Text('${e.value}', style: AppTextStyles.subheading.copyWith(fontSize: 13, color: AppColors.primary)),
                        ],
                      ),
                    ))
                .toList(),
          ),
        ),
        const SizedBox(height: 20),
        SectionTitle(title: 'Kalkulator Prediksi Peluang Lolos'),
        const SizedBox(height: 10),
        ...FeatureDummyData.snbpPredictions.map((p) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _SnbpPredictionCard(prediction: p),
            )),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.calculate_outlined, size: 16, color: Colors.white),
            label: Text('Hitung Peluang Jurusan Lain', style: AppTextStyles.button),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
          ),
        ),
      ],
    );
  }
}

class _SnbpPredictionCard extends StatelessWidget {
  final SnbpPrediction prediction;
  const _SnbpPredictionCard({required this.prediction});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(prediction.majorName, style: AppTextStyles.subheading.copyWith(fontSize: 13)),
                Text(prediction.universityName, style: AppTextStyles.caption),
                const SizedBox(height: 6),
                AppProgressBar(value: prediction.chancePercent / 100),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Text(
            '${prediction.chancePercent}%',
            style: AppTextStyles.subheading.copyWith(color: AppColors.success, fontSize: 16),
          ),
        ],
      ),
    );
  }
}

class _SnbtTab extends StatelessWidget {
  const _SnbtTab();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
      children: [
        AppCard(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Prediksi Skor Saat Ini', style: AppTextStyles.caption),
                    Text('685', style: AppTextStyles.heading.copyWith(color: AppColors.primary)),
                    Text('Ranking Nasional #4.520', style: AppTextStyles.caption),
                  ],
                ),
              ),
              const IconBadge(icon: Icons.leaderboard_outlined, size: 44),
            ],
          ),
        ),
        const SizedBox(height: 20),
        SectionTitle(title: 'Bank Soal & Tryout'),
        const SizedBox(height: 10),
        ...FeatureDummyData.tryoutPackages.map((t) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _TryoutCard(tryout: t),
            )),
      ],
    );
  }
}

class _TryoutCard extends StatelessWidget {
  final TryoutPackage tryout;
  const _TryoutCard({required this.tryout});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Row(
        children: [
          IconBadge(
            icon: tryout.isCompleted ? Icons.check_circle_outline : Icons.play_circle_outline,
            background: tryout.isCompleted ? AppColors.success.withValues(alpha: 0.12) : AppColors.primaryLight,
            iconColor: tryout.isCompleted ? AppColors.success : AppColors.primary,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(tryout.title, style: AppTextStyles.subheading.copyWith(fontSize: 13)),
                Text(
                  '${tryout.totalQuestions} soal · ${tryout.durationMinutes} menit',
                  style: AppTextStyles.caption,
                ),
              ],
            ),
          ),
          if (tryout.isCompleted)
            Text(
              '${tryout.lastScore}',
              style: AppTextStyles.subheading.copyWith(color: AppColors.success, fontSize: 14),
            )
          else
            Text('Mulai >', style: AppTextStyles.caption.copyWith(color: AppColors.primary, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
