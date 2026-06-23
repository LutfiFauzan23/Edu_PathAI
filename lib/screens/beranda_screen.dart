import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../data/dummy_data.dart';
import '../data/feature_dummy_data.dart';
import 'features/snbp_snbt_screen.dart';
import 'features/scholarship_screen.dart';
import 'features/ai_assistant_screen.dart';
import 'features/assessment_screen.dart';
import 'features/portfolio_screen.dart';
import 'features/analytics_screen.dart';

class BerandaScreen extends StatelessWidget {
  const BerandaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = DummyData.user;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            _buildHeader(context, user),
            _buildAIInsight(context),
            _buildUpcomingActivity(context),
            _buildBeasiswaCareer(context),
            _buildStatistikPencapaian(context),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, user) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 12, 16, 0),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Halo, ${user.name} 👋',
                        style: const TextStyle(
                            color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700)),
                    const SizedBox(height: 2),
                    Text('Siap mencapai targetmu hari ini?',
                        style: TextStyle(color: Colors.white.withValues(alpha: 0.8), fontSize: 12)),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: const CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white24,
                    child: Icon(Icons.person, color: Colors.white, size: 20)),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(Icons.school_outlined, color: Colors.white, size: 14),
                    const SizedBox(width: 6),
                    Text('Target Sekolah',
                        style: TextStyle(color: Colors.white.withValues(alpha: 0.8), fontSize: 11)),
                    const Spacer(),
                    Text(user.targetSchool,
                        style: const TextStyle(
                            color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600)),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.trending_up, color: Colors.white, size: 14),
                    const SizedBox(width: 6),
                    Text('Progress Keseluruhan',
                        style: TextStyle(color: Colors.white.withValues(alpha: 0.8), fontSize: 11)),
                    const Spacer(),
                    Text('${user.progressPercent}%',
                        style: const TextStyle(
                            color: Colors.white, fontSize: 11, fontWeight: FontWeight.w700)),
                  ],
                ),
                const SizedBox(height: 6),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: user.progressPercent / 100,
                    minHeight: 5,
                    backgroundColor: Colors.white24,
                    valueColor: const AlwaysStoppedAnimation(Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAIInsight(BuildContext context) {
    final items = DummyData.beliefMenu;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                    color: AppColors.primaryLight, borderRadius: BorderRadius.circular(6)),
                child: const Icon(Icons.auto_awesome, size: 14, color: AppColors.primary),
              ),
              const SizedBox(width: 6),
              const Text('AI Insight',
                  style: TextStyle(
                      fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
              const Spacer(),
              GestureDetector(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const AssessmentScreen())),
                child: Text('Lihat semua >',
                    style: TextStyle(
                        fontSize: 11, color: AppColors.primary, fontWeight: FontWeight.w600)),
              ),
            ],
          ),
          const SizedBox(height: 2),
          Text('Berdasarkan analisis progress belajarmu minggu ini, aku merekomendasikan:',
              style: TextStyle(fontSize: 10, color: AppColors.textSecondary)),
          const SizedBox(height: 10),
          SizedBox(
            height: 76,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (context, i) => _insightCard(context, items[i]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _insightCard(BuildContext context, item) {
    final icons = {
      'book': Icons.menu_book_outlined,
      'quiz': Icons.quiz_outlined,
      'code': Icons.code,
      'scholarship': Icons.card_giftcard_outlined,
    };
    return GestureDetector(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (_) => const AiAssistantScreen())),
      child: Container(
        width: 130,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.border),
        ),
        child: Row(
          children: [
            Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                  color: AppColors.primaryLight, borderRadius: BorderRadius.circular(8)),
              child: Icon(icons[item.iconName] ?? Icons.book, size: 14, color: AppColors.primary),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(item.title,
                      style: const TextStyle(
                          fontSize: 10, fontWeight: FontWeight.w600, color: AppColors.textPrimary),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis),
                  const SizedBox(height: 3),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(3),
                    child: LinearProgressIndicator(
                      value: item.progress,
                      minHeight: 3,
                      backgroundColor: AppColors.border,
                      valueColor: const AlwaysStoppedAnimation(AppColors.primary),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUpcomingActivity(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionHeader('Upcoming Activity', onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (_) => const SnbpSnbtScreen()))),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: _activityCard(
                  context,
                  icon: Icons.assignment_outlined,
                  color: const Color(0xFFE8F5E9),
                  iconColor: AppColors.success,
                  title: 'Tryout SNBT',
                  lines: ['Waktu: 08:00 - 9:45', 'Deadline: Jum, 25 Juni 2026',
                    'Target Skor: 750'],
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const SnbpSnbtScreen())),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _activityCard(
                  context,
                  icon: Icons.book_outlined,
                  color: AppColors.primaryLight,
                  iconColor: AppColors.primary,
                  title: 'Tugas Matematika',
                  lines: ['Deadline: Min, 23 Juni 2026', 'Materi: Turunan Fungsi'],
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const SnbpSnbtScreen())),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _activityCard(BuildContext context,
      {required IconData icon,
      required Color color,
      required Color iconColor,
      required String title,
      required List<String> lines,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
              child: Icon(icon, size: 14, color: iconColor),
            ),
            const SizedBox(height: 8),
            Text(title,
                style: const TextStyle(
                    fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
            const SizedBox(height: 4),
            ...lines.map((l) => Padding(
                  padding: const EdgeInsets.only(bottom: 2),
                  child: Text(l,
                      style: const TextStyle(fontSize: 10, color: AppColors.textSecondary)),
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildBeasiswaCareer(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Row(
        children: [
          Expanded(
            child: _bigActionCard(
              context,
              icon: Icons.card_giftcard_outlined,
              gradient: const LinearGradient(
                  colors: [Color(0xFF1B5E3A), Color(0xFF2BB673)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight),
              title: 'Beasiswa\nDibimbing ID',
              subtitle: '25 Juni 2026\nInfo Lengkap',
              chips: ['Dalam Negeri', '2 Proyek', '0 Protokol', '2t Rekap Nilai Rapor'],
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (_) => const ScholarshipScreen())),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: _bigActionCard(
              context,
              icon: Icons.work_outline,
              gradient: const LinearGradient(
                  colors: [Color(0xFF6C2BD9), Color(0xFF9B6DFF)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight),
              title: 'Career\nCoaching AI',
              subtitle: 'Persiapan Jurusan\nInformatika',
              chips: ['Topik', 'Dosen', 'Target Jurusan Informatika', 'Target Masuk 70%'],
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (_) => const AiAssistantScreen())),
            ),
          ),
        ],
      ),
    );
  }

  Widget _bigActionCard(BuildContext context,
      {required IconData icon,
      required Gradient gradient,
      required String title,
      required String subtitle,
      required List<String> chips,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(gradient: gradient, borderRadius: BorderRadius.circular(14)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: Colors.white, size: 20),
            const SizedBox(height: 8),
            Text(title,
                style: const TextStyle(
                    color: Colors.white, fontSize: 13, fontWeight: FontWeight.w700)),
            const SizedBox(height: 4),
            Text(subtitle,
                style: TextStyle(color: Colors.white.withValues(alpha: 0.8), fontSize: 10)),
            const SizedBox(height: 8),
            Wrap(
              spacing: 4,
              runSpacing: 4,
              children: chips
                  .map((c) => Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(c,
                            style: const TextStyle(color: Colors.white, fontSize: 9)),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatistikPencapaian(BuildContext context) {
    final stats = DummyData.statistik;
    final pencapaian = DummyData.upcomingActivity;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _sectionHeader('Statistik',
                        onTap: () => Navigator.push(context,
                            MaterialPageRoute(builder: (_) => const AnalyticsScreen()))),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.card,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppColors.border),
                      ),
                      child: Column(
                        children: stats
                            .map((s) => Padding(
                                  padding: const EdgeInsets.only(bottom: 6),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.circle,
                                          size: 6, color: AppColors.primary),
                                      const SizedBox(width: 6),
                                      Expanded(
                                          child: Text(s.label,
                                              style: const TextStyle(
                                                  fontSize: 10,
                                                  color: AppColors.textPrimary))),
                                      Text(s.value,
                                          style: const TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w700,
                                              color: AppColors.primary)),
                                    ],
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _sectionHeader('Pencapaian',
                        onTap: () => Navigator.push(context,
                            MaterialPageRoute(builder: (_) => const PortfolioScreen()))),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.card,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppColors.border),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _pencapaianRow(Icons.folder_outlined, '3 Sertifikat'),
                          _pencapaianRow(Icons.code, '2 Proyek'),
                          _pencapaianRow(Icons.groups_outlined, '3 Organisasi'),
                          const Divider(height: 10),
                          Text('Top Skills: Web Development',
                              style: const TextStyle(
                                  fontSize: 9, color: AppColors.textSecondary)),
                          Text('Target Jurusan Informatika',
                              style: const TextStyle(
                                  fontSize: 9, color: AppColors.textSecondary)),
                          Text('Target Masuk 70%',
                              style: const TextStyle(
                                  fontSize: 9, color: AppColors.primary,
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _pencapaianRow(IconData icon, String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        children: [
          Icon(icon, size: 12, color: AppColors.primary),
          const SizedBox(width: 5),
          Text(label,
              style: const TextStyle(fontSize: 10, color: AppColors.textPrimary)),
        ],
      ),
    );
  }

  Widget _sectionHeader(String title, {required VoidCallback onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: const TextStyle(
                fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
        GestureDetector(
          onTap: onTap,
          child: Text('lihat semua >',
              style: const TextStyle(fontSize: 10, color: AppColors.primary)),
        ),
      ],
    );
  }
}
