import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../data/dummy_data.dart';
import '../../widgets/feature_widgets.dart';

/// 11. Dashboard Ortu & Guru BK
/// - Dashboard Ortu: monitor progres akademik & target anak
/// - Dashboard Guru BK: statistik siswa, distribusi minat, laporan asesmen
class DashboardGuardianScreen extends StatelessWidget {
  const DashboardGuardianScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: const FeatureAppBar(title: 'Dashboard Ortu & Guru BK'),
        body: Column(
          children: [
            const TabBar(
              labelColor: AppColors.primary,
              unselectedLabelColor: AppColors.textSecondary,
              indicatorColor: AppColors.primary,
              labelStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
              tabs: [
                Tab(text: 'Dashboard Ortu'),
                Tab(text: 'Dashboard Guru BK'),
              ],
            ),
            Expanded(
              child: TabBarView(children: [_ParentTab(), _CounselorTab()]),
            ),
          ],
        ),
      ),
    );
  }
}

class _ParentTab extends StatelessWidget {
  const _ParentTab();

  @override
  Widget build(BuildContext context) {
    final user = DummyData.user;

    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
      children: [
        AppCard(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              const CircleAvatar(radius: 26, backgroundColor: AppColors.primaryLight, child: Icon(Icons.person, color: AppColors.primary)),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(user.name, style: AppTextStyles.subheading),
                    Text(user.school, style: AppTextStyles.caption),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        SectionTitle(title: 'Progres Akademik Anak'),
        const SizedBox(height: 10),
        AppCard(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Progress Keseluruhan', style: AppTextStyles.body.copyWith(color: AppColors.textPrimary)),
                  Text('${user.progressPercent}%', style: AppTextStyles.subheading.copyWith(color: AppColors.primary)),
                ],
              ),
              const SizedBox(height: 8),
              AppProgressBar(value: user.progressPercent / 100),
            ],
          ),
        ),
        const SizedBox(height: 16),
        SectionTitle(title: 'Target Sekolah'),
        const SizedBox(height: 10),
        AppCard(
          child: Row(
            children: [
              const IconBadge(icon: Icons.school_outlined),
              const SizedBox(width: 12),
              Expanded(child: Text(user.targetSchool, style: AppTextStyles.body.copyWith(color: AppColors.textPrimary))),
            ],
          ),
        ),
        const SizedBox(height: 16),
        SectionTitle(title: 'Nilai Mata Pelajaran'),
        const SizedBox(height: 10),
        AppCard(
          child: Column(
            children: user.subjectScores.entries
                .map((e) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(e.key, style: AppTextStyles.body.copyWith(color: AppColors.textPrimary)),
                          Text('${e.value}', style: AppTextStyles.subheading.copyWith(fontSize: 13)),
                        ],
                      ),
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}

class _CounselorTab extends StatelessWidget {
  const _CounselorTab();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
      children: [
        SectionTitle(title: 'Statistik Siswa'),
        const SizedBox(height: 10),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1.7,
          children: const [
            _StatTile(label: 'Total Siswa', value: '328'),
            _StatTile(label: 'Sudah Tes Minat', value: '274'),
            _StatTile(label: 'Sudah Daftar SNBP', value: '156'),
            _StatTile(label: 'Rata-rata Progress', value: '68%'),
          ],
        ),
        const SizedBox(height: 20),
        SectionTitle(title: 'Distribusi Minat Siswa'),
        const SizedBox(height: 10),
        AppCard(
          child: Column(
            children: const [
              _DistributionRow(label: 'Teknik & IT', percent: 0.38),
              SizedBox(height: 10),
              _DistributionRow(label: 'Kesehatan', percent: 0.22),
              SizedBox(height: 10),
              _DistributionRow(label: 'Bisnis & Ekonomi', percent: 0.18),
              SizedBox(height: 10),
              _DistributionRow(label: 'Seni & Desain', percent: 0.12),
              SizedBox(height: 10),
              _DistributionRow(label: 'Lainnya', percent: 0.10),
            ],
          ),
        ),
        const SizedBox(height: 20),
        SectionTitle(title: 'Laporan Hasil Asesmen'),
        const SizedBox(height: 10),
        AppCard(
          child: Row(
            children: [
              const IconBadge(icon: Icons.summarize_outlined),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Laporan Semester Genap 2025/2026', style: AppTextStyles.subheading.copyWith(fontSize: 13)),
                    Text('Siap diunduh dalam format PDF', style: AppTextStyles.caption),
                  ],
                ),
              ),
              const Icon(Icons.download_outlined, size: 18, color: AppColors.primary),
            ],
          ),
        ),
      ],
    );
  }
}

class _StatTile extends StatelessWidget {
  final String label;
  final String value;
  const _StatTile({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(value, style: AppTextStyles.subheading.copyWith(color: AppColors.primary, fontSize: 18)),
          Text(label, style: AppTextStyles.caption, maxLines: 1, overflow: TextOverflow.ellipsis),
        ],
      ),
    );
  }
}

class _DistributionRow extends StatelessWidget {
  final String label;
  final double percent;
  const _DistributionRow({required this.label, required this.percent});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: AppTextStyles.body.copyWith(color: AppColors.textPrimary)),
            Text('${(percent * 100).round()}%', style: AppTextStyles.caption.copyWith(fontWeight: FontWeight.w600)),
          ],
        ),
        const SizedBox(height: 6),
        AppProgressBar(value: percent),
      ],
    );
  }
}
