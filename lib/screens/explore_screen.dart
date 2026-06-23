import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../data/dummy_data.dart';
import 'features/school_catalog_screen.dart';
import 'features/snbp_snbt_screen.dart';
import 'features/scholarship_screen.dart';
import 'features/forum_screen.dart';
import 'features/ai_assistant_screen.dart';
import 'features/career_explore_screen.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final _searchCtrl = TextEditingController();

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  static const _quickAccess = [
    {'icon': Icons.calculate_outlined, 'label': 'SNBT', 'route': 'snbt'},
    {'icon': Icons.library_books_outlined, 'label': 'Bank Soal', 'route': 'banksoal'},
    {'icon': Icons.bookmark_outline, 'label': 'Tersimpan', 'route': 'saved'},
    {'icon': Icons.school_outlined, 'label': 'Kampus', 'route': 'kampus'},
    {'icon': Icons.card_giftcard_outlined, 'label': 'Beasiswa', 'route': 'beasiswa'},
    {'icon': Icons.work_outline, 'label': 'Karier', 'route': 'karier'},
    {'icon': Icons.forum_outlined, 'label': 'Forum', 'route': 'forum'},
    {'icon': Icons.person_outline, 'label': 'Mentor', 'route': 'mentor'},
  ];

  void _handleQuickAccess(String route) {
    final Widget dest = switch (route) {
      'snbt' => const SnbpSnbtScreen(),
      'banksoal' => const SnbpSnbtScreen(),
      'kampus' => const SchoolCatalogScreen(),
      'beasiswa' => const ScholarshipScreen(),
      'karier' => const CareerExploreScreen(),
      'forum' => const ForumScreen(),
      'mentor' => const ForumScreen(),
      _ => const SchoolCatalogScreen(),
    };
    Navigator.push(context, MaterialPageRoute(builder: (_) => dest));
  }

  @override
  Widget build(BuildContext context) {
    final news = DummyData.newsList;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            _buildTopBar(),
            _buildSearchBar(),
            _buildQuickAccess(),
            _buildInformasiBaru(news),
            _buildPostinganSekolah(),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Explore',
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications_outlined, color: AppColors.textPrimary),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.search, color: AppColors.textPrimary),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.border),
          ),
          child: Row(
            children: [
              const Icon(Icons.search, size: 18, color: AppColors.textSecondary),
              const SizedBox(width: 10),
              Text('Cari kabar baru dari sekolah impianmu!',
                  style: TextStyle(fontSize: 13, color: AppColors.textSecondary)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuickAccess() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Quick Access',
              style: TextStyle(
                  fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
          const SizedBox(height: 12),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _quickAccess.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 0.85,
            ),
            itemBuilder: (context, i) {
              final item = _quickAccess[i];
              return GestureDetector(
                onTap: () => _handleQuickAccess(item['route'] as String),
                child: Column(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: AppColors.card,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: AppColors.border),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.04),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Icon(item['icon'] as IconData,
                          size: 22, color: AppColors.primary),
                    ),
                    const SizedBox(height: 5),
                    Text(item['label'] as String,
                        style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textPrimary)),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildInformasiBaru(List news) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Informasi Baru',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary)),
              GestureDetector(
                onTap: () {},
                child: Text('lihat semua >',
                    style: const TextStyle(fontSize: 10, color: AppColors.primary)),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ...news.map((n) => _newsCard(n)),
        ],
      ),
    );
  }

  Widget _newsCard(n) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.border),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.article_outlined, size: 20, color: AppColors.primary),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(n.source,
                      style: const TextStyle(
                          fontSize: 10,
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600)),
                  const SizedBox(height: 2),
                  Text(n.title,
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textPrimary),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis),
                  const SizedBox(height: 2),
                  Text(n.timeAgo,
                      style: const TextStyle(
                          fontSize: 10, color: AppColors.textSecondary)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPostinganSekolah() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Postingan Sekolah',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary)),
              GestureDetector(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const SchoolCatalogScreen())),
                child: Text('selengkapnya >',
                    style: const TextStyle(fontSize: 10, color: AppColors.primary)),
              ),
            ],
          ),
          const SizedBox(height: 10),
          _schoolPostCard(
              school: 'SMKN 1', action: 'Latihan', subtitle: 'SMKN 1 Telah memposting'),
          _schoolPostCard(
              school: 'SMKN 1', action: 'Pertemuan', subtitle: 'SMKN 1 mengadakan pertemuan'),
        ],
      ),
    );
  }

  Widget _schoolPostCard({required String school, required String action, required String subtitle}) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (_) => const SchoolCatalogScreen())),
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 90,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              ),
              child: const Center(
                child: Icon(Icons.image_outlined, size: 32, color: AppColors.textSecondary),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(subtitle,
                      style: const TextStyle(
                          fontSize: 11,
                          color: AppColors.textSecondary)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
