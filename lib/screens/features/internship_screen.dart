import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../data/feature_dummy_data.dart';
import '../../models/feature_models.dart';
import '../../widgets/feature_widgets.dart';
import 'portfolio_screen.dart' show DummyDataDateFormatter;

/// 7. Portal Magang & PKL
/// - Job Matching (rekomendasi tempat magang/PKL)
/// - Tracker & Logbook Otomatis
class InternshipScreen extends StatelessWidget {
  const InternshipScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: const FeatureAppBar(title: 'Magang & PKL'),
        body: Column(
          children: [
            const TabBar(
              labelColor: AppColors.primary,
              unselectedLabelColor: AppColors.textSecondary,
              indicatorColor: AppColors.primary,
              labelStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
              tabs: [
                Tab(text: 'Job Matching'),
                Tab(text: 'Logbook'),
              ],
            ),
            Expanded(
              child: TabBarView(children: [_JobMatchingTab(), _LogbookTab()]),
            ),
          ],
        ),
      ),
    );
  }
}

class _JobMatchingTab extends StatelessWidget {
  const _JobMatchingTab();

  @override
  Widget build(BuildContext context) {
    final listings = [...FeatureDummyData.internships]
      ..sort((a, b) => b.matchPercent.compareTo(a.matchPercent));

    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
      children: [
        SectionTitle(title: 'Rekomendasi Untukmu', subtitle: '${listings.length} tempat magang sesuai profilmu'),
        const SizedBox(height: 10),
        ...listings.map((l) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _InternshipCard(listing: l),
            )),
      ],
    );
  }
}

class _InternshipCard extends StatelessWidget {
  final InternshipListing listing;
  const _InternshipCard({required this.listing});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const IconBadge(icon: Icons.business_outlined),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(listing.position, style: AppTextStyles.subheading.copyWith(fontSize: 13)),
                    Text(listing.company, style: AppTextStyles.caption),
                  ],
                ),
              ),
              Text(
                '${listing.matchPercent}%',
                style: AppTextStyles.subheading.copyWith(color: AppColors.success, fontSize: 14),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              AppChip(label: listing.isRemote ? 'Remote' : listing.location, color: AppColors.accentGreen),
              AppChip(label: listing.duration),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                padding: const EdgeInsets.symmetric(vertical: 10),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: Text('Lamar Sekarang', style: AppTextStyles.button.copyWith(fontSize: 12)),
            ),
          ),
        ],
      ),
    );
  }
}

class _LogbookTab extends StatelessWidget {
  const _LogbookTab();

  @override
  Widget build(BuildContext context) {
    final entries = FeatureDummyData.logbookEntries;

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
                    Text('Rekap Minggu Ini', style: AppTextStyles.caption),
                    Text('${entries.length} hari hadir', style: AppTextStyles.subheading.copyWith(color: AppColors.primary)),
                  ],
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add, size: 16, color: Colors.white),
                label: Text('Absen', style: AppTextStyles.button.copyWith(fontSize: 12)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        SectionTitle(title: 'Jurnal Harian'),
        const SizedBox(height: 10),
        ...entries.map((e) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: AppCard(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Text(
                          DummyDataDateFormatter.format(e.date).split(' ')[0],
                          style: AppTextStyles.subheading.copyWith(color: AppColors.primary, fontSize: 16),
                        ),
                        Text(
                          DummyDataDateFormatter.format(e.date).split(' ')[1],
                          style: AppTextStyles.caption.copyWith(fontSize: 10),
                        ),
                      ],
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(e.activity, style: AppTextStyles.body.copyWith(color: AppColors.textPrimary)),
                          const SizedBox(height: 4),
                          AppChip(label: e.status, color: AppColors.success),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ],
    );
  }
}
