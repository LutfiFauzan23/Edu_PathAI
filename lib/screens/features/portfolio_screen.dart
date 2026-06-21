import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../data/feature_dummy_data.dart';
import '../../models/feature_models.dart';
import '../../widgets/feature_widgets.dart';

/// 6. Portofolio Digital Siswa
/// - Penyimpanan Prestasi & Proyek
/// - Rekam Organisasi & CV Builder (Personal Growth Score)
class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = FeatureDummyData.portfolioItems;
    final growthScore = 78; // dummy Personal Growth Score

    return Scaffold(
      appBar: FeatureAppBar(
        title: 'Portofolio Digital',
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: AppColors.textPrimary),
            onPressed: () {},
            tooltip: 'Tambah item portofolio',
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(18),
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
                      Text('Personal Growth Score', style: AppTextStyles.subheading.copyWith(color: Colors.white)),
                      const SizedBox(height: 4),
                      Text('Berdasarkan prestasi, proyek & organisasi', style: AppTextStyles.caption.copyWith(color: Colors.white70)),
                    ],
                  ),
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: CircularProgressIndicator(
                        value: growthScore / 100,
                        strokeWidth: 5,
                        backgroundColor: Colors.white24,
                        valueColor: const AlwaysStoppedAnimation(Colors.white),
                      ),
                    ),
                    Text('$growthScore', style: AppTextStyles.subheading.copyWith(color: Colors.white, fontSize: 15)),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.picture_as_pdf_outlined, size: 16, color: Colors.white),
              label: Text('Generate CV Otomatis', style: AppTextStyles.button),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.accentGreen,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ),
          const SizedBox(height: 20),
          SectionTitle(title: 'Item Portofolio', subtitle: '${items.length} item tersimpan'),
          const SizedBox(height: 10),
          ...items.map((item) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: _PortfolioCard(item: item),
              )),
          if (items.isEmpty)
            const EmptyState(icon: Icons.folder_open_outlined, message: 'Belum ada item portofolio.\nMulai upload sertifikat atau proyekmu!'),
        ],
      ),
    );
  }
}

class _PortfolioCard extends StatelessWidget {
  final PortfolioItem item;
  const _PortfolioCard({required this.item});

  IconData get _categoryIcon {
    switch (item.category) {
      case 'Sertifikat':
        return Icons.workspace_premium_outlined;
      case 'Proyek':
        return Icons.code;
      case 'Organisasi':
        return Icons.groups_outlined;
      default:
        return Icons.description_outlined;
    }
  }

  @override
  Widget build(BuildContext context) {
    final formattedDate = DummyDataDateFormatter.format(item.date);

    return AppCard(
      child: Row(
        children: [
          IconBadge(icon: _categoryIcon),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.title, style: AppTextStyles.subheading.copyWith(fontSize: 13)),
                Text(item.description, style: AppTextStyles.caption, maxLines: 2, overflow: TextOverflow.ellipsis),
                const SizedBox(height: 6),
                Row(
                  children: [
                    AppChip(label: item.category),
                    const SizedBox(width: 8),
                    Text(formattedDate, style: AppTextStyles.caption.copyWith(fontSize: 10)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Helper format tanggal tanpa bergantung locale ID dari intl package,
/// supaya tetap aman walau locale data belum sempat di-load di awal.
class DummyDataDateFormatter {
  static const _months = [
    'Jan', 'Feb', 'Mar', 'Apr', 'Mei', 'Jun',
    'Jul', 'Agu', 'Sep', 'Okt', 'Nov', 'Des',
  ];

  static String format(DateTime date) {
    return '${date.day} ${_months[date.month - 1]} ${date.year}';
  }
}
