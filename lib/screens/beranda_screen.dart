import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/app_top_bar.dart';
import '../data/dummy_data.dart';
import '../models/models.dart';

class BerandaScreen extends StatelessWidget {
  const BerandaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = DummyData.user;

    return Scaffold(
      appBar: const AppTopBar(),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
        children: [
          _greetingCard(user),
          const SizedBox(height: 16),
          _aiInsightSection(),
          const SizedBox(height: 20),
          _sectionHeader('Informasi Baru', 'Lihat postingan baru dari sekolahmu'),
          const SizedBox(height: 10),
          _newsCard(),
          const SizedBox(height: 20),
          _sectionHeader('Upcoming Activity', null),
          const SizedBox(height: 10),
          _upcomingActivityCard(),
          const SizedBox(height: 20),
          _statistikSection(),
        ],
      ),
    );
  }

  Widget _greetingCard(UserProfile user) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.accentGreen,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.school, color: Colors.white),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Hallo, ${user.name}', style: AppTextStyles.subheading),
                Text('Mau mengejar targetmu hari ini?', style: AppTextStyles.caption),
                const SizedBox(height: 6),
                Text('Target Sekolah: ${user.targetSchool}', style: AppTextStyles.caption),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('Progress Keseluruhan', style: AppTextStyles.caption),
              Text(
                '${user.progressPercent}%',
                style: AppTextStyles.subheading.copyWith(color: AppColors.primary),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _aiInsightSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.auto_awesome, size: 16, color: AppColors.primary),
            const SizedBox(width: 6),
            Text('AI Insight', style: AppTextStyles.subheading),
          ],
        ),
        Text(
          'Berdasarkan progress belajarmu minggu ini, kami merekomendasikan',
          style: AppTextStyles.caption,
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 96,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: DummyData.beliefMenu.length,
            separatorBuilder: (_, __) => const SizedBox(width: 10),
            itemBuilder: (context, index) {
              final item = DummyData.beliefMenu[index];
              return _menuMiniCard(item);
            },
          ),
        ),
      ],
    );
  }

  Widget _menuMiniCard(MenuItem item) {
    return Container(
      width: 90,
      padding: const EdgeInsets.all(10),
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
            child: const Icon(Icons.menu_book_outlined, size: 16, color: AppColors.primary),
          ),
          const Spacer(),
          Text(
            item.title,
            style: AppTextStyles.caption.copyWith(color: AppColors.textPrimary, fontSize: 10),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _sectionHeader(String title, String? subtitle) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: AppTextStyles.subheading),
            if (subtitle != null) Text(subtitle, style: AppTextStyles.caption),
          ],
        ),
        Text(
          'Lihat semua >',
          style: AppTextStyles.caption.copyWith(color: AppColors.primary),
        ),
      ],
    );
  }

  Widget _newsCard() {
    final news = DummyData.newsList.first;
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
              Text(news.source, style: AppTextStyles.subheading.copyWith(fontSize: 13)),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            height: 110,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(
              child: Icon(Icons.image_outlined, size: 36, color: AppColors.textSecondary),
            ),
          ),
          const SizedBox(height: 8),
          Text(news.title, style: AppTextStyles.body.copyWith(color: AppColors.textPrimary)),
        ],
      ),
    );
  }

  Widget _upcomingActivityCard() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: DummyData.upcomingActivity
            .map((task) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Row(
                    children: [
                      const Icon(Icons.access_time, size: 16, color: AppColors.primary),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(task.label, style: AppTextStyles.subheading.copyWith(fontSize: 13)),
                            Text(task.value, style: AppTextStyles.caption),
                          ],
                        ),
                      ),
                    ],
                  ),
                ))
            .toList(),
      ),
    );
  }

  Widget _statistikSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Statistik', style: AppTextStyles.subheading),
        const SizedBox(height: 10),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: DummyData.statistik.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 2.4,
          ),
          itemBuilder: (context, index) {
            final stat = DummyData.statistik[index];
            return Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.card,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.border),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(stat.value, style: AppTextStyles.subheading.copyWith(color: AppColors.primary)),
                  Text(stat.label, style: AppTextStyles.caption, maxLines: 1, overflow: TextOverflow.ellipsis),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
