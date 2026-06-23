import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../theme/app_theme.dart';
import '../data/dummy_data.dart';
import 'features/snbp_snbt_screen.dart';
import 'features/productivity_screen.dart';
import 'features/analytics_screen.dart';
import 'features/ai_assistant_screen.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            _buildTopBar(context),
            _buildProgressHero(context),
            _buildPreparationSection(context),
            _buildAkademikSection(context),
            _buildProduktivitas(context),
            _buildRekomendasi(context),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Progress',
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
          Text('Pantau persiapanmu, raih masa depanmu',
              style: TextStyle(fontSize: 10, color: AppColors.textSecondary)),
        ],
      ),
    );
  }

  Widget _buildProgressHero(BuildContext context) {
    final user = DummyData.user;
    return GestureDetector(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (_) => const SnbpSnbtScreen())),
      child: Container(
        margin: const EdgeInsets.fromLTRB(16, 12, 16, 0),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF6C2BD9), Color(0xFF9B6DFF)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Progress Persiapanmu',
                style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.9),
                    fontSize: 13,
                    fontWeight: FontWeight.w600)),
            const SizedBox(height: 12),
            Row(
              children: [
                SizedBox(
                  width: 80,
                  height: 80,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      PieChart(
                        PieChartData(
                          startDegreeOffset: -90,
                          sectionsSpace: 0,
                          centerSpaceRadius: 28,
                          sections: [
                            PieChartSectionData(
                              value: user.progressPercent.toDouble(),
                              color: Colors.white,
                              radius: 10,
                              showTitle: false,
                            ),
                            PieChartSectionData(
                              value: (100 - user.progressPercent).toDouble(),
                              color: Colors.white24,
                              radius: 10,
                              showTitle: false,
                            ),
                          ],
                        ),
                      ),
                      Text('${user.progressPercent}%',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w800)),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _heroStat('Target', 'Siap SNBP 5 dan SNBT 2026'),
                      const SizedBox(height: 6),
                      _heroStat('Sisa Waktu', '${DummyData.sisaWaktuHari} hari lagi'),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: AppColors.success,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text('On Track',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w700)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _heroStat(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: TextStyle(
                color: Colors.white.withValues(alpha: 0.7), fontSize: 10)),
        Text(value,
            style: const TextStyle(
                color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600)),
      ],
    );
  }

  Widget _buildPreparationSection(BuildContext context) {
    final items = [
      {'icon': Icons.fact_check_outlined, 'label': 'SNBP', 'sub': 'Persiapan masuk PTN via SNBP', 'hour': '4 fiur', 'color': const Color(0xFFE8F5E9), 'ic': AppColors.success},
      {'icon': Icons.assignment_outlined, 'label': 'SNBT', 'sub': 'Persiapan masuk PTN via SNBT', 'hour': '5 fiur', 'color': AppColors.primaryLight, 'ic': AppColors.primary},
      {'icon': Icons.quiz_outlined, 'label': 'Bank Soal', 'sub': 'Kumpulan soal latihan SNBT', 'hour': '4 fiur', 'color': const Color(0xFFFFF3E0), 'ic': AppColors.warning},
    ];
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Preparation',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary)),
              GestureDetector(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const SnbpSnbtScreen())),
                child: const Text('lihat semua >',
                    style: TextStyle(fontSize: 10, color: AppColors.primary)),
              ),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 110,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              separatorBuilder: (_, __) => const SizedBox(width: 10),
              itemBuilder: (context, i) {
                final item = items[i];
                return GestureDetector(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const SnbpSnbtScreen())),
                  child: Container(
                    width: 130,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.card,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: AppColors.border),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                              color: item['color'] as Color,
                              borderRadius: BorderRadius.circular(8)),
                          child: Icon(item['icon'] as IconData,
                              size: 16, color: item['ic'] as Color),
                        ),
                        const SizedBox(height: 8),
                        Text(item['label'] as String,
                            style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: AppColors.textPrimary)),
                        const SizedBox(height: 2),
                        Text(item['sub'] as String,
                            style: const TextStyle(
                                fontSize: 9, color: AppColors.textSecondary),
                            maxLines: 2),
                        const Spacer(),
                        Text(item['hour'] as String,
                            style: TextStyle(
                                fontSize: 9,
                                color: item['ic'] as Color,
                                fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAkademikSection(BuildContext context) {
    final tools = [
      {'icon': Icons.calendar_month_outlined, 'label': 'Kalender Akademik', 'sub': 'Informasi penting & jadwal akademik', 'route': 'kalender'},
      {'icon': Icons.checklist_outlined, 'label': 'To-do-List', 'sub': 'Mulai atur dan selesaikan tugasmu', 'route': 'todo'},
      {'icon': Icons.auto_awesome_outlined, 'label': 'Jadwal Belajar', 'sub': 'Jadwal belajar personalisasi', 'route': 'jadwal'},
    ];
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Persiapan Akademik',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary)),
              GestureDetector(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const ProductivityScreen())),
                child: const Text('lihat semua >',
                    style: TextStyle(fontSize: 10, color: AppColors.primary)),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: tools.map((t) {
              return Expanded(
                child: GestureDetector(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const ProductivityScreen())),
                  child: Container(
                    margin: EdgeInsets.only(
                        right: tools.indexOf(t) < tools.length - 1 ? 8 : 0),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.card,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.border),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(t['icon'] as IconData, size: 18, color: AppColors.primary),
                        const SizedBox(height: 6),
                        Text(t['label'] as String,
                            style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: AppColors.textPrimary),
                            maxLines: 2),
                        const SizedBox(height: 2),
                        Text(t['sub'] as String,
                            style: const TextStyle(
                                fontSize: 9, color: AppColors.textSecondary),
                            maxLines: 3),
                        const SizedBox(height: 4),
                        const Text('4 fiur',
                            style: TextStyle(
                                fontSize: 9,
                                color: AppColors.primary,
                                fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildProduktivitas(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (_) => const ProductivityScreen())),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Produktivitas hari ini',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary)),
                GestureDetector(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const ProductivityScreen())),
                  child: const Text('lihat semua >',
                      style: TextStyle(fontSize: 10, color: AppColors.primary)),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(child: _prodCard('Belajar', '3h 45m', 'Total Waktu', Icons.access_time_outlined, AppColors.primary)),
                const SizedBox(width: 8),
                Expanded(child: _prodCard('Soal', '7/8', 'Soal', Icons.task_alt_outlined, AppColors.success)),
                const SizedBox(width: 8),
                Expanded(child: _prodCard('Fokus', '80%', 'Skor Fokus', Icons.psychology_outlined, AppColors.warning)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _prodCard(String title, String value, String sub, IconData icon, Color color) {
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
          Icon(icon, size: 16, color: color),
          const SizedBox(height: 6),
          Text(value,
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w800, color: color)),
          Text(sub,
              style: const TextStyle(fontSize: 9, color: AppColors.textSecondary)),
        ],
      ),
    );
  }

  Widget _buildRekomendasi(BuildContext context) {
    final recs = DummyData.recommendations;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Rekomendasi Untukmu',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary)),
              GestureDetector(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const AnalyticsScreen())),
                child: const Text('lihat semua >',
                    style: TextStyle(fontSize: 10, color: AppColors.primary)),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: recs.asMap().entries.map((e) {
              final destinations = [
                const SnbpSnbtScreen(),
                const SnbpSnbtScreen(),
                const AnalyticsScreen(),
              ];
              return Expanded(
                child: GestureDetector(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (_) => destinations[e.key])),
                  child: Container(
                    margin: EdgeInsets.only(right: e.key < recs.length - 1 ? 8 : 0),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.card,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.border),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(e.value.title,
                            style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                                color: AppColors.textPrimary),
                            maxLines: 2),
                        const SizedBox(height: 4),
                        Text(e.value.description,
                            style: const TextStyle(
                                fontSize: 9, color: AppColors.textSecondary),
                            maxLines: 2),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: AppColors.primaryLight,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(e.value.ctaLabel,
                              style: const TextStyle(
                                  fontSize: 9,
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.w700)),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
