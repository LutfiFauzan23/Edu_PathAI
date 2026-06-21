import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../data/feature_dummy_data.dart';
import '../../models/feature_models.dart';
import '../../widgets/feature_widgets.dart';

/// 14. Fitur Premium
/// - Konsultasi Ahli (Guru BK pro, dosen, praktisi)
/// - Review & Coaching (CV/LinkedIn, mentoring karier)
class PremiumScreen extends StatelessWidget {
  const PremiumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const FeatureAppBar(title: 'EduPath Premium'),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFFFB347), Color(0xFFFF8C42)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.workspace_premium, color: Colors.white, size: 32),
                const SizedBox(height: 10),
                Text('Upgrade ke Premium', style: AppTextStyles.heading.copyWith(color: Colors.white, fontSize: 18)),
                const SizedBox(height: 6),
                Text(
                  'Akses konsultasi ahli & coaching karier personal',
                  style: AppTextStyles.caption.copyWith(color: Colors.white70),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          SectionTitle(title: 'Layanan Premium'),
          const SizedBox(height: 10),
          ...FeatureDummyData.premiumServices.map((s) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: _PremiumServiceCard(service: s),
              )),
        ],
      ),
    );
  }
}

class _PremiumServiceCard extends StatelessWidget {
  final PremiumService service;
  const _PremiumServiceCard({required this.service});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Row(
        children: [
          IconBadge(icon: mapIconName(service.iconName)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(service.title, style: AppTextStyles.subheading.copyWith(fontSize: 13)),
                Text(service.description, style: AppTextStyles.caption),
                const SizedBox(height: 6),
                Text(service.priceLabel, style: AppTextStyles.caption.copyWith(color: AppColors.primary, fontWeight: FontWeight.w600)),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            child: Text('Pesan', style: AppTextStyles.button.copyWith(fontSize: 11)),
          ),
        ],
      ),
    );
  }
}
