import '../models/models.dart';

class DummyData {
  static const UserProfile user = UserProfile(
    name: 'Krysnaa',
    nisn: '0012345678',
    targetSchool: 'SMKN 1 Jakarta',
    progressPercent: 72,
    school: 'SMKN 1 Jakarta',
    subjectScores: {
      'Matematika': 80,
      'B.Indonesia': 80,
      'B.Inggris': 80,
    },
  );

  static const int sisaWaktuHari = 124;
  static const int soalTuntas = 67;

  static const List<MenuItem> beliefMenu = [
    MenuItem(title: 'Belajar React JS', subtitle: 'Web Dev', iconName: 'code', progress: 0.65),
    MenuItem(title: 'Jurusan Informatika', subtitle: 'Eksplorasi', iconName: 'book', progress: 0.45),
    MenuItem(title: 'Tingkatkan Python', subtitle: 'Programming', iconName: 'code', progress: 0.80),
    MenuItem(title: 'Beasiswa Luar', subtitle: 'Scholarship', iconName: 'scholarship', progress: 0.30),
  ];

  static const List<NewsItem> newsList = [
    NewsItem(
      title: 'SMKN 1 Membuka Pendaftaran Siswa Baru Tahun Ajaran 2026/2027',
      source: 'SMKN 1',
      timeAgo: '2 jam lalu',
    ),
    NewsItem(
      title: 'Pengumuman Jadwal Tryout SNBT Nasional Juni 2026',
      source: 'Kemdikbud',
      timeAgo: '5 jam lalu',
    ),
    NewsItem(
      title: 'Beasiswa Dibimbing.id Dibuka Kembali, Daftar Sekarang!',
      source: 'Dibimbing ID',
      timeAgo: '1 hari lalu',
    ),
  ];

  static const List<StatistikItem> statistik = [
    StatistikItem(label: 'Peluang Kampus', value: '75%'),
    StatistikItem(label: 'Kesiapan SNBT', value: '68%'),
    StatistikItem(label: 'Potensi Karier', value: '82%'),
    StatistikItem(label: 'Kekuatan Portofolio', value: '71%'),
  ];

  static const List<ActivityItem> upcomingActivity = [
    ActivityItem(title: 'Tryout SNBT', subtitle: 'Jum, 25 Juni 2026'),
    ActivityItem(title: 'Tugas Matematika', subtitle: 'Min, 23 Juni 2026'),
  ];

  static const List<RecommendationItem> recommendations = [
    RecommendationItem(
      title: 'Tingkatkan Skor Simulasi SNBT',
      description: 'Prediksi skor kamu bisa meningkat 10%',
      ctaLabel: 'Mulai Simulasi',
    ),
    RecommendationItem(
      title: 'Kerjakan TryOut Matematika',
      description: 'TryOut membantumu mengukur kemampuan',
      ctaLabel: 'Kerjakan',
    ),
    RecommendationItem(
      title: 'Fokus pada materi Penting',
      description: 'Masih ada 9 materi yang perlu ditingkatkan',
      ctaLabel: 'Lihat Analitik',
    ),
  ];
}
