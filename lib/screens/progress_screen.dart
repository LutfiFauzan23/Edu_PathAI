import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/app_top_bar.dart';
import '../data/dummy_data.dart';
import '../models/models.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = DummyData.user;

    return Scaffold(
      appBar: const AppTopBar(),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
        children: [
          Text('Progress', style: AppTextStyles.heading),
          Text('Pantau persiapanmu, raih masa depanmu', style: AppTextStyles.caption),
          const SizedBox(height: 16),
          _progressHeroCard(user),
          const SizedBox(height: 20),
          _sectionHeader('Preparation', 'Lihat semua'),
          const SizedBox(height: 10),
          _preparationGrid(),
          const SizedBox(height: 20),
          _sectionHeader('Produktivitas hari ini', 'Lihat semua'),
          const SizedBox(height: 10),
          _produktivitasGrid(),
          const SizedBox(height: 20),
          _sectionHeader('Rekomendasi Untukmu', 'Lihat semua'),
          const SizedBox(height: 10),
          ...DummyData.recommendations.map((r) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: _recommendationCard(r),
              )),
        ],
      ),
    );
  }

  Widget _progressHeroCard(UserProfile user) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Progress Persiapanmu',
                  style: AppTextStyles.subheading.copyWith(color: Colors.white),
                ),
                const SizedBox(height: 4),
                Text(
                  'Target\nSNBP 2025 dan SNBT 2026',
                  style: AppTextStyles.caption.copyWith(color: Colors.white70),
                ),
                const SizedBox(height: 10),
                Text('Lulus Matematika', style: AppTextStyles.caption.copyWith(color: Colors.white70)),
                Text('Status: On track', style: AppTextStyles.caption.copyWith(color: Colors.white70)),
              ],
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 70,
                height: 70,
                child: CircularProgressIndicator(
                  value: user.progressPercent / 100,
                  strokeWidth: 6,
                  backgroundColor: Colors.white24,
                  valueColor: const AlwaysStoppedAnimation(Colors.white),
                ),
              ),
              Text(
                '${user.progressPercent}%',
                style: AppTextStyles.subheading.copyWith(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _sectionHeader(String title, String action) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: AppTextStyles.subheading),
        Text('$action >', style: AppTextStyles.caption.copyWith(color: AppColors.primary)),
      ],
    );
  }

  Widget _preparationGrid() {
    final items = [
      ('SNBP', 'Persiapan masuk PTN melalui jalur SNBP', '1 Tahun'),
      ('SNBT', 'Persiapan masuk PTN melalui jalur SNBT', '5 Bulan'),
      ('Bank Soal', 'Kumpulan bank soal berstandar', '4 Tahun'),
      ('Kalender Akademik', 'Penting jadwal akademikmu', '2 Tahun'),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1.5,
      ),
      itemBuilder: (context, index) {
        final item = items[index];
        return Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.border),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: AppColors.primaryLight,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.menu_book, size: 14, color: AppColors.primary),
              ),
              const Spacer(),
              Text(item.$1, style: AppTextStyles.subheading.copyWith(fontSize: 13)),
              Text(item.$2, style: AppTextStyles.caption, maxLines: 2, overflow: TextOverflow.ellipsis),
            ],
          ),
        );
      },
    );
  }

  Widget _produktivitasGrid() {
    final items = [
      ('Belajar', '3h 45m', 'Total belajar', Icons.menu_book_outlined),
      ('Tugas', '7/8', 'Selesai', Icons.check_circle_outline),
      ('Skor', '80%', 'Skor latihan', Icons.bar_chart),
    ];

    return Row(
      children: items
          .map(
            (item) => Expanded(
              child: Container(
                margin: const EdgeInsets.only(right: 8),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.card,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.border),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(item.$4, size: 18, color: AppColors.primary),
                    const SizedBox(height: 6),
                    Text(item.$2, style: AppTextStyles.subheading.copyWith(fontSize: 14)),
                    Text(item.$3, style: AppTextStyles.caption.copyWith(fontSize: 10)),
                  ],
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _recommendationCard(RecommendationItem item) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.title, style: AppTextStyles.subheading.copyWith(fontSize: 13)),
                Text(item.description, style: AppTextStyles.caption),
                const SizedBox(height: 6),
                Text(
                  item.ctaLabel,
                  style: AppTextStyles.caption.copyWith(color: AppColors.primary, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
