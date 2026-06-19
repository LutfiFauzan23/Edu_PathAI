import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/app_top_bar.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppTopBar(),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
        children: [
          Text('Explore', style: AppTextStyles.heading),
          const SizedBox(height: 4),
          Text('Cari kabar baru dari sekolah impianmu', style: AppTextStyles.caption),
          const SizedBox(height: 16),
          _searchBar(),
          const SizedBox(height: 20),
          _quickAccessCard(),
          const SizedBox(height: 20),
          _sectionHeader('Informasi Baru', 'Lihat postingan baru dari sekolahmu'),
          const SizedBox(height: 10),
          _schoolPostCard(),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppColors.card,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.border),
            ),
            child: Text(
              'SMKN 1 menempelkan postingan baru',
              style: AppTextStyles.caption,
            ),
          ),
          const SizedBox(height: 8),
          Center(
            child: Text(
              'selengkapnya >',
              style: AppTextStyles.caption.copyWith(color: AppColors.primary),
            ),
          ),
        ],
      ),
    );
  }

  Widget _searchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          const Icon(Icons.search, size: 18, color: AppColors.textSecondary),
          const SizedBox(width: 10),
          Text('Cari sekolah, jurusan, atau berita...', style: AppTextStyles.caption),
        ],
      ),
    );
  }

  Widget _quickAccessCard() {
    final items = [
      (Icons.image_outlined, 'Galeri'),
      (Icons.apps, 'Kategori'),
      (Icons.menu_book_outlined, 'Materi'),
      (Icons.bar_chart, 'Statistik'),
    ];

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 90,
                  decoration: BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Icon(Icons.landscape_outlined, size: 32, color: AppColors.textSecondary),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  children: [
                    Text('Quick Access', style: AppTextStyles.subheading.copyWith(fontSize: 13)),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: items
                          .map((e) => Container(
                                width: 36,
                                height: 36,
                                decoration: BoxDecoration(
                                  color: AppColors.primaryLight,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Icon(e.$1, size: 18, color: AppColors.primary),
                              ))
                          .toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                4,
                (i) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: i == 0 ? AppColors.primary : AppColors.border,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionHeader(String title, String subtitle) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: AppTextStyles.subheading),
            Text(subtitle, style: AppTextStyles.caption),
          ],
        ),
        Text('Lihat semua >', style: AppTextStyles.caption.copyWith(color: AppColors.primary)),
      ],
    );
  }

  Widget _schoolPostCard() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(radius: 14, backgroundColor: AppColors.primaryLight),
              const SizedBox(width: 8),
              Text('SMKN 1', style: AppTextStyles.subheading.copyWith(fontSize: 13)),
              const SizedBox(width: 8),
              Text('Latihan', style: AppTextStyles.caption),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            height: 140,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(
              child: Icon(Icons.image_outlined, size: 36, color: AppColors.textSecondary),
            ),
          ),
        ],
      ),
    );
  }
}
