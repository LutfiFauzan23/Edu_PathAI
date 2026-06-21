import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../data/feature_dummy_data.dart';
import '../../models/feature_models.dart';
import '../../widgets/feature_widgets.dart';

/// 3. Katalog Pendidikan
/// - Database Sekolah & Kampus (PTN/PTS/Kedinasan/SMA/SMK)
/// - Campus Explorer (virtual tour & galeri, placeholder UI)
class SchoolCatalogScreen extends StatefulWidget {
  const SchoolCatalogScreen({super.key});

  @override
  State<SchoolCatalogScreen> createState() => _SchoolCatalogScreenState();
}

class _SchoolCatalogScreenState extends State<SchoolCatalogScreen> {
  String _selectedFilter = 'Semua';

  static const _filters = ['Semua', 'PTN', 'PTS', 'Kedinasan', 'SMA', 'SMK'];

  List<SchoolInfo> get _filteredSchools {
    if (_selectedFilter == 'Semua') return FeatureDummyData.schools;
    return FeatureDummyData.schools
        .where((s) => s.type.toLowerCase().contains(_selectedFilter.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const FeatureAppBar(title: 'Katalog Pendidikan'),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
        children: [
          Container(
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
                Text('Cari sekolah atau kampus...', style: AppTextStyles.caption),
              ],
            ),
          ),
          const SizedBox(height: 14),
          SizedBox(
            height: 36,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: _filters.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (context, index) {
                final filter = _filters[index];
                final isSelected = filter == _selectedFilter;
                return GestureDetector(
                  onTap: () => setState(() => _selectedFilter = filter),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    decoration: BoxDecoration(
                      color: isSelected ? AppColors.primary : AppColors.card,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: isSelected ? AppColors.primary : AppColors.border),
                    ),
                    child: Text(
                      filter,
                      style: AppTextStyles.caption.copyWith(
                        color: isSelected ? Colors.white : AppColors.textPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          ..._filteredSchools.map((s) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: _SchoolCard(school: s),
              )),
          if (_filteredSchools.isEmpty)
            const EmptyState(icon: Icons.search_off, message: 'Tidak ada sekolah/kampus untuk filter ini'),
        ],
      ),
    );
  }
}

class _SchoolCard extends StatelessWidget {
  final SchoolInfo school;
  const _SchoolCard({required this.school});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 110,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.vertical(top: Radius.circular(14)),
            ),
            child: const Center(
              child: Icon(Icons.apartment, size: 36, color: AppColors.textSecondary),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(child: Text(school.name, style: AppTextStyles.subheading.copyWith(fontSize: 14))),
                    AppChip(label: school.type),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Icons.location_on_outlined, size: 14, color: AppColors.textSecondary),
                    const SizedBox(width: 4),
                    Expanded(child: Text(school.location, style: AppTextStyles.caption)),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    _InfoPill(icon: Icons.verified_outlined, label: 'Akreditasi ${school.accreditation}'),
                    const SizedBox(width: 8),
                    _InfoPill(icon: Icons.groups_outlined, label: 'Daya tampung ${school.capacity}'),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.payments_outlined, size: 14, color: AppColors.textSecondary),
                    const SizedBox(width: 4),
                    Expanded(child: Text(school.tuitionInfo, style: AppTextStyles.caption)),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.threed_rotation, size: 14, color: AppColors.primary),
                        label: Text('Virtual Tour', style: AppTextStyles.caption.copyWith(color: AppColors.primary)),
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: AppColors.border),
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                    ),
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

class _InfoPill extends StatelessWidget {
  final IconData icon;
  final String label;
  const _InfoPill({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(icon, size: 12, color: AppColors.textSecondary),
            const SizedBox(width: 4),
            Expanded(
              child: Text(
                label,
                style: AppTextStyles.caption.copyWith(fontSize: 10),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
