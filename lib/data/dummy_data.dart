import '../models/models.dart';

/// Semua data statis (dummy) dikumpulkan di sini.
/// Pisahkan dari UI supaya gampang nanti diganti dengan API call.
class DummyData {
  static const UserProfile user = UserProfile(
    name: 'Kryesna',
    nisn: '0123456789',
    targetSchool: 'SMKN 1 Jakarta',
    progressPercent: 72,
    school: 'SMK 1 KAJAYTA',
    subjectScores: {
      'Matematika': 80,
      'B.Indonesia': 80,
      'B.Inggris': 80,
    },
  );

  static const List<MenuItem> beliefMenu = [
    MenuItem(
      title: 'Belajar React Js',
      subtitle: 'AI Insight',
      iconName: 'book',
      progress: 0.6,
    ),
    MenuItem(
      title: 'Latihan Informatika',
      subtitle: 'AI Insight',
      iconName: 'quiz',
      progress: 0.4,
    ),
    MenuItem(
      title: 'Tingkatkan Python',
      subtitle: 'AI Insight',
      iconName: 'code',
      progress: 0.3,
    ),
    MenuItem(
      title: 'Beasiswa Dibimbing ID',
      subtitle: 'AI Insight',
      iconName: 'scholarship',
      progress: 0.2,
    ),
  ];

  static const List<NewsItem> newsList = [
    NewsItem(
      title: 'SMKN 1 membuka pendaftaran jalur prestasi tahun ini',
      source: 'SMKN 1',
      timeAgo: '2 jam lalu',
    ),
    NewsItem(
      title: 'Tips lolos SNBT 2026 dari alumni',
      source: 'Komunitas Belajar',
      timeAgo: '5 jam lalu',
    ),
  ];

  static const List<TaskStat> upcomingActivity = [
    TaskStat(label: 'Tryout', value: '08:00 - 9:45', iconName: 'clock'),
    TaskStat(label: 'Matematika', value: 'Materi Turunan Fungsi', iconName: 'subject'),
  ];

  static const List<TaskStat> statistik = [
    TaskStat(label: 'Peluang Kampus', value: '82%', iconName: 'campus'),
    TaskStat(label: 'Peluang SNBT', value: '70%', iconName: 'snbt'),
    TaskStat(label: 'Peluang Bidik Misi', value: '64%', iconName: 'misi'),
    TaskStat(label: 'Rekomendasi Portofolio', value: '78%', iconName: 'folder'),
  ];

  static const List<RecommendationItem> recommendations = [
    RecommendationItem(
      title: 'Tingkatkan Skor Simulasi SNBT',
      description: 'Prediksi skormu masih meningkat 15%',
      ctaLabel: 'Mulai Simulasi',
    ),
    RecommendationItem(
      title: 'Kerjakan TryOut Minggu Ini',
      description: 'Latihan TryOut membantu mengukur kemampuan',
      ctaLabel: 'Kerjakan',
    ),
    RecommendationItem(
      title: 'Fokus pada Mata Pelajaran',
      description: 'Nilai ada di area yang perlu ditingkatkan',
      ctaLabel: 'Lihat Analisis',
    ),
  ];

  static const int sisaWaktuHari = 124;
  static const int soalTuntas = 67;
}
