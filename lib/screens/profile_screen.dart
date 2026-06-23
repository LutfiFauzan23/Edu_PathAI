import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../data/dummy_data.dart';
import 'features/analytics_screen.dart';
import 'features/snbp_snbt_screen.dart';
import 'features/portfolio_screen.dart';
import '../screens/login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = DummyData.user;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            _buildTopBar(context),
            _buildProfileCard(context, user),
            _buildRingkasan(context, user),
            _buildSelesaikanProfil(context),
            _buildSekolahTujuan(context, user),
            _buildNilai(context, user),
            _buildMenuSettings(context),
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
          const Text('Profil',
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
          Row(
            children: [
              IconButton(
                  icon: const Icon(Icons.upload_outlined, color: AppColors.textPrimary),
                  onPressed: () {}),
              IconButton(
                  icon: const Icon(Icons.settings_outlined, color: AppColors.textPrimary),
                  onPressed: () {}),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProfileCard(BuildContext context, user) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 12, 16, 0),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              const CircleAvatar(
                radius: 40,
                backgroundColor: AppColors.background,
                child: Icon(Icons.person, size: 44, color: AppColors.textSecondary),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                      color: AppColors.primary, shape: BoxShape.circle),
                  child: const Icon(Icons.edit, size: 12, color: Colors.white),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(user.name,
              style: const TextStyle(
                  fontSize: 18, fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
          const SizedBox(height: 2),
          Text('Nama | NISN',
              style: TextStyle(fontSize: 12, color: AppColors.textSecondary)),
          const SizedBox(height: 2),
          Text(user.nisn,
              style: const TextStyle(
                  fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
        ],
      ),
    );
  }

  Widget _buildRingkasan(BuildContext context, user) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 12, 16, 0),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Ringkasan',
              style: TextStyle(
                  fontSize: 14, fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
          const SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const SnbpSnbtScreen())),
                child: _ringkasanStat('${user.progressPercent}%', 'Progress',
                    Icons.donut_large_outlined),
              ),
              _divider(),
              GestureDetector(
                onTap: () {},
                child: _ringkasanStat('${DummyData.sisaWaktuHari}h', 'Sisa Waktu',
                    Icons.access_time_outlined),
              ),
              _divider(),
              GestureDetector(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const SnbpSnbtScreen())),
                child: _ringkasanStat('${DummyData.soalTuntas}', 'Soal Tuntas',
                    Icons.task_alt_outlined),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _ringkasanStat(String value, String label, IconData icon) {
    return Column(
      children: [
        Icon(icon, size: 18, color: AppColors.primary),
        const SizedBox(height: 4),
        Text(value,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.w800, color: AppColors.primary)),
        Text(label,
            style: const TextStyle(fontSize: 10, color: AppColors.textSecondary)),
      ],
    );
  }

  Widget _divider() {
    return Container(width: 1, height: 40, color: AppColors.border);
  }

  Widget _buildSelesaikanProfil(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 12, 16, 0),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Selesaikan Profil',
              style: TextStyle(
                  fontSize: 14, fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
          const SizedBox(height: 4),
          const Text('Masukkan nilai dan sekolah tujuanmu',
              style: TextStyle(fontSize: 11, color: AppColors.textSecondary)),
          const SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const SnbpSnbtScreen())),
                child: _profilShortcut(Icons.school_outlined, 'SNBP'),
              ),
              GestureDetector(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const SnbpSnbtScreen())),
                child: _profilShortcut(Icons.assignment_outlined, 'SNBT'),
              ),
              GestureDetector(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const AnalyticsScreen())),
                child: _profilShortcut(Icons.bar_chart_outlined, 'Analitik'),
              ),
              GestureDetector(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const PortfolioScreen())),
                child: _profilShortcut(Icons.folder_outlined, 'Portofolio'),
              ),
            ],
          ),
          const SizedBox(height: 14),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              child: const Text('Lanjutkan',
                  style: TextStyle(
                      color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _profilShortcut(IconData icon, String label) {
    return Column(
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: AppColors.primaryLight,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, size: 20, color: AppColors.primary),
        ),
        const SizedBox(height: 4),
        Text(label,
            style: const TextStyle(fontSize: 10, color: AppColors.textPrimary)),
      ],
    );
  }

  Widget _buildSekolahTujuan(BuildContext context, user) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.fromLTRB(16, 12, 16, 0),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.border),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.primaryLight,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.school_outlined,
                  size: 20, color: AppColors.primary),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Sekolah Tujuan',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary)),
                  Text(user.targetSchool,
                      style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primary)),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: AppColors.textSecondary),
          ],
        ),
      ),
    );
  }

  Widget _buildNilai(BuildContext context, user) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 12, 16, 0),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Nilai',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary)),
              GestureDetector(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const SnbpSnbtScreen())),
                child: const Text('Edit >',
                    style: TextStyle(
                        fontSize: 11, color: AppColors.primary, fontWeight: FontWeight.w600)),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: user.subjectScores.entries.map((e) {
              return _nilaiItem(e.key, '${e.value}');
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _nilaiItem(String label, String value) {
    return Column(
      children: [
        Container(
          width: 52,
          height: 52,
          decoration: BoxDecoration(
            color: AppColors.primaryLight,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Center(
            child: Text(value,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: AppColors.primary)),
          ),
        ),
        const SizedBox(height: 4),
        Text(label,
            style: const TextStyle(
                fontSize: 10, color: AppColors.textSecondary)),
      ],
    );
  }

  Widget _buildMenuSettings(BuildContext context) {
    final menus = [
      {'icon': Icons.person_outline, 'label': 'Edit Profil', 'color': AppColors.primary},
      {'icon': Icons.notifications_outlined, 'label': 'Notifikasi', 'color': AppColors.primary},
      {'icon': Icons.lock_outline, 'label': 'Keamanan', 'color': AppColors.primary},
      {'icon': Icons.help_outline, 'label': 'Bantuan & FAQ', 'color': AppColors.primary},
      {'icon': Icons.logout, 'label': 'Keluar', 'color': Colors.red},
    ];
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 12, 16, 0),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: menus.asMap().entries.map((e) {
          final item = e.value;
          final isLast = e.key == menus.length - 1;
          return InkWell(
            onTap: () {
              if (item['label'] == 'Keluar') {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => const LoginScreen()),
                  (route) => false,
                );
              }
            },
            borderRadius: BorderRadius.circular(16),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                border: isLast
                    ? null
                    : Border(bottom: BorderSide(color: AppColors.border)),
              ),
              child: Row(
                children: [
                  Icon(item['icon'] as IconData,
                      size: 20, color: item['color'] as Color),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(item['label'] as String,
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: item['color'] as Color)),
                  ),
                  if (item['label'] != 'Keluar')
                    const Icon(Icons.chevron_right,
                        size: 18, color: AppColors.textSecondary),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
