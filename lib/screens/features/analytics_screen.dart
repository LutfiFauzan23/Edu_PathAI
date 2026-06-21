import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../data/feature_dummy_data.dart';
import '../../models/feature_models.dart';
import '../../widgets/feature_widgets.dart';

/// 13. Analitik & Prediksi Masa Depan
/// - Digital Career Twin (simulasi skenario karier)
/// - Success Probability (prediksi keberhasilan)
class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const FeatureAppBar(title: 'Analitik & Prediksi'),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
        children: [
          AppCard(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                const IconBadge(icon: Icons.auto_graph_outlined, size: 40),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Digital Career Twin', style: AppTextStyles.subheading.copyWith(fontSize: 14)),
                      Text(
                        'Simulasikan berbagai skenario jalur kariermu',
                        style: AppTextStyles.caption,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          ...FeatureDummyData.careerTwinScenarios.map((s) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: _ScenarioCard(scenario: s),
              )),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add, size: 16, color: AppColors.primary),
              label: Text('Buat Skenario Baru', style: AppTextStyles.caption.copyWith(color: AppColors.primary)),
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: AppColors.border),
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ),
          const SizedBox(height: 20),
          SectionTitle(title: 'Tren Industri 5-10 Tahun ke Depan'),
          const SizedBox(height: 10),
          AppCard(
            child: Column(
              children: const [
                _TrendRow(label: 'Teknologi & AI', percent: 0.85, trendUp: true),
                SizedBox(height: 12),
                _TrendRow(label: 'Kesehatan Digital', percent: 0.72, trendUp: true),
                SizedBox(height: 12),
                _TrendRow(label: 'Energi Terbarukan', percent: 0.68, trendUp: true),
                SizedBox(height: 12),
                _TrendRow(label: 'Manufaktur Konvensional', percent: 0.32, trendUp: false),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ScenarioCard extends StatelessWidget {
  final CareerTwinScenario scenario;
  const _ScenarioCard({required this.scenario});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(child: Text(scenario.path, style: AppTextStyles.subheading.copyWith(fontSize: 13))),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(child: _MetricBox(icon: Icons.payments_outlined, label: 'Biaya', value: scenario.totalCost)),
              const SizedBox(width: 8),
              Expanded(child: _MetricBox(icon: Icons.schedule_outlined, label: 'Durasi', value: scenario.studyDuration)),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(child: _MetricBox(icon: Icons.trending_up_outlined, label: 'Estimasi Gaji', value: scenario.estimatedSalary)),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Text('Success Probability', style: AppTextStyles.caption),
              const Spacer(),
              Text('${scenario.successProbability}%', style: AppTextStyles.subheading.copyWith(color: AppColors.success, fontSize: 14)),
            ],
          ),
          const SizedBox(height: 6),
          AppProgressBar(value: scenario.successProbability / 100, color: AppColors.success),
        ],
      ),
    );
  }
}

class _MetricBox extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  const _MetricBox({required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(color: AppColors.background, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 12, color: AppColors.textSecondary),
              const SizedBox(width: 4),
              Text(label, style: AppTextStyles.caption.copyWith(fontSize: 10)),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: AppTextStyles.caption.copyWith(fontWeight: FontWeight.w600, color: AppColors.textPrimary, fontSize: 11),
          ),
        ],
      ),
    );
  }
}

class _TrendRow extends StatelessWidget {
  final String label;
  final double percent;
  final bool trendUp;
  const _TrendRow({required this.label, required this.percent, required this.trendUp});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: AppTextStyles.body.copyWith(color: AppColors.textPrimary)),
            Row(
              children: [
                Icon(
                  trendUp ? Icons.trending_up : Icons.trending_down,
                  size: 14,
                  color: trendUp ? AppColors.success : Colors.red,
                ),
                const SizedBox(width: 4),
                Text('${(percent * 100).round()}%', style: AppTextStyles.caption.copyWith(fontWeight: FontWeight.w600)),
              ],
            ),
          ],
        ),
        const SizedBox(height: 6),
        AppProgressBar(value: percent, color: trendUp ? AppColors.success : Colors.red),
      ],
    );
  }
}
