/// Model-model data dummy yang dipakai di seluruh layar.
/// Nantinya kalau sudah pakai backend, cukup ganti sumber data di
/// `lib/data/dummy_data.dart` tanpa mengubah UI.

class UserProfile {
  final String name;
  final String nisn;
  final String targetSchool;
  final int progressPercent;
  final String school;
  final Map<String, int> subjectScores; // misal: {'Matematika': 80}

  const UserProfile({
    required this.name,
    required this.nisn,
    required this.targetSchool,
    required this.progressPercent,
    required this.school,
    required this.subjectScores,
  });
}

class MenuItem {
  final String title;
  final String subtitle;
  final String iconName; // dipetakan ke IconData di widget
  final double progress; // 0..1, null-safe pakai default 0

  const MenuItem({
    required this.title,
    required this.subtitle,
    required this.iconName,
    this.progress = 0,
  });
}

class NewsItem {
  final String title;
  final String source;
  final String timeAgo;

  const NewsItem({
    required this.title,
    required this.source,
    required this.timeAgo,
  });
}

class TaskStat {
  final String label;
  final String value;
  final String iconName;

  const TaskStat({
    required this.label,
    required this.value,
    required this.iconName,
  });
}

class RecommendationItem {
  final String title;
  final String description;
  final String ctaLabel;

  const RecommendationItem({
    required this.title,
    required this.description,
    required this.ctaLabel,
  });
}

class StatistikItem {
  final String label;
  final String value;
  const StatistikItem({required this.label, required this.value});
}

class ActivityItem {
  final String title;
  final String subtitle;
  const ActivityItem({required this.title, required this.subtitle});
}
