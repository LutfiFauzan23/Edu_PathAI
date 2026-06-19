import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/app_top_bar.dart';
import '../data/dummy_data.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = DummyData.user;

    return Scaffold(
      appBar: const AppTopBar(),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Profil', style: AppTextStyles.heading),
              Row(
                children: const [
                  Icon(Icons.ios_share, size: 18, color: AppColors.textSecondary),
                  SizedBox(width: 12),
                  Icon(Icons.settings_outlined, size: 18, color: AppColors.textSecondary),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          _profileHeaderCard(),
          const SizedBox(height: 20),
          Text('Ringkasan', style: AppTextStyles.subheading),
          const SizedBox(height: 10),
          _ringkasanGrid(),
          const SizedBox(height: 16),
          _selesaikanProfilCard(),
          const SizedBox(height: 16),
          _sekolahTujuanCard(user.targetSchool, user.subjectScores),
        ],
      ),
    );
  }

  Widget _profileHeaderCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 28),
      decoration: BoxDecoration(
        color: AppColors.border,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.person_outline, size: 34, color: AppColors.textSecondary),
          ),
          const SizedBox(height: 10),
          Text('Nama | NISN', style: AppTextStyles.caption),
        ],
      ),
    );
  }

  Widget _ringkasanGrid() {
    final user = DummyData.user;
    final items = [
      ('${user.progressPercent}%', 'Progress'),
      ('${DummyData.sisaWaktuHari} hari lagi', 'Sisa Waktu'),
      ('${DummyData.soalTuntas} Soal', 'Soal Tuntas'),
    ];

    return Row(
      children: items
          .map(
            (item) => Expanded(
              child: Container(
                margin: const EdgeInsets.only(right: 8),
                padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
                decoration: BoxDecoration(
                  color: AppColors.card,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.border),
                ),
                child: Column(
                  children: [
                    Text(
                      item.$1,
                      style: AppTextStyles.subheading.copyWith(color: AppColors.primary, fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 4),
                    Text(item.$2, style: AppTextStyles.caption, textAlign: TextAlign.center),
                  ],
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _selesaikanProfilCard() {
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
          Text('Selesaikan Profil', style: AppTextStyles.subheading),
          const SizedBox(height: 4),
          Text('Masukkan nilai dan sekolah tujuan', style: AppTextStyles.caption),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              child: Text('Lanjutkan', style: AppTextStyles.button),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sekolahTujuanCard(String school, Map<String, int> scores) {
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
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: AppColors.primaryLight,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.school_outlined, size: 16, color: AppColors.primary),
              ),
              const SizedBox(width: 10),
              Text(school, style: AppTextStyles.subheading.copyWith(fontSize: 13)),
            ],
          ),
          const SizedBox(height: 14),
          Text('Nilai', style: AppTextStyles.caption),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: scores.entries
                .map((e) => Column(
                      children: [
                        Text('${e.value}%', style: AppTextStyles.subheading.copyWith(fontSize: 13)),
                        Text(e.key, style: AppTextStyles.caption.copyWith(fontSize: 10)),
                      ],
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
