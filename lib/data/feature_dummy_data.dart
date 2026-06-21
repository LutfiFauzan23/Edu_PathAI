import '../models/feature_models.dart';

/// Dummy data untuk 14 kategori fitur. Sama seperti dummy_data.dart,
/// nanti tinggal ganti sumbernya ke Firestore tanpa ubah UI.
class FeatureDummyData {
  // ---------- Hub: daftar 14 kategori ----------
  static const List<FeatureCategory> categories = [
    FeatureCategory(
      title: 'Asesmen & Profiling',
      subtitle: 'Tes minat bakat AI',
      iconName: 'psychology',
      routeKey: 'assessment',
    ),
    FeatureCategory(
      title: 'Eksplorasi Karier',
      subtitle: 'Roadmap & database profesi',
      iconName: 'explore',
      routeKey: 'career_explore',
    ),
    FeatureCategory(
      title: 'Katalog Pendidikan',
      subtitle: 'Database sekolah & kampus',
      iconName: 'school',
      routeKey: 'school_catalog',
    ),
    FeatureCategory(
      title: 'SNBP & SNBT',
      subtitle: 'Tracker, kalkulator, tryout',
      iconName: 'fact_check',
      routeKey: 'snbp_snbt',
    ),
    FeatureCategory(
      title: 'Scholarship Matcher',
      subtitle: 'Radar beasiswa & reminder',
      iconName: 'card_giftcard',
      routeKey: 'scholarship',
    ),
    FeatureCategory(
      title: 'Portofolio Digital',
      subtitle: 'Sertifikat, proyek, CV builder',
      iconName: 'folder_special',
      routeKey: 'portfolio',
    ),
    FeatureCategory(
      title: 'Magang & PKL',
      subtitle: 'Job matching & logbook',
      iconName: 'work',
      routeKey: 'internship',
    ),
    FeatureCategory(
      title: 'AI Career Assistant',
      subtitle: 'Chat konselor & simulator',
      iconName: 'smart_toy',
      routeKey: 'ai_assistant',
    ),
    FeatureCategory(
      title: 'Produktivitas',
      subtitle: 'Kalender & to-do list',
      iconName: 'event_note',
      routeKey: 'productivity',
    ),
    FeatureCategory(
      title: 'Forum & Komunitas',
      subtitle: 'Diskusi & mentoring alumni',
      iconName: 'forum',
      routeKey: 'forum',
    ),
    FeatureCategory(
      title: 'Dashboard Ortu/Guru BK',
      subtitle: 'Monitoring & laporan',
      iconName: 'supervisor_account',
      routeKey: 'dashboard_guardian',
    ),
    FeatureCategory(
      title: 'Gamifikasi',
      subtitle: 'Badge, XP, daily mission',
      iconName: 'emoji_events',
      routeKey: 'gamification',
    ),
    FeatureCategory(
      title: 'Analitik & Prediksi',
      subtitle: 'Digital Career Twin',
      iconName: 'insights',
      routeKey: 'analytics',
    ),
    FeatureCategory(
      title: 'Premium',
      subtitle: 'Konsultasi ahli & coaching',
      iconName: 'workspace_premium',
      routeKey: 'premium',
    ),
  ];

  // ---------- 1. Asesmen & Profiling ----------
  static const PersonalityResult personalityResult = PersonalityResult(
    type: 'Investigative - Artistic',
    description:
        'Kamu cenderung suka memecahkan masalah secara logis sekaligus punya sisi kreatif tinggi. Cocok di bidang yang menggabungkan analisis & desain.',
    strengths: ['Problem solving', 'Berpikir kritis', 'Kreativitas visual', 'Detail oriented'],
    recommendedMajors: [
      MajorRecommendation(name: 'Teknik Informatika', matchPercent: 92, reason: 'Cocok dengan logika & problem solving'),
      MajorRecommendation(name: 'Desain Komunikasi Visual', matchPercent: 85, reason: 'Sisi kreatif sangat dominan'),
      MajorRecommendation(name: 'Sistem Informasi', matchPercent: 80, reason: 'Gabungan teknis & analisis bisnis'),
    ],
  );

  static const List<SkillCompetency> skillCompetencies = [
    SkillCompetency(name: 'Logika Pemrograman', level: 78, isHardSkill: true),
    SkillCompetency(name: 'Desain UI/UX', level: 65, isHardSkill: true),
    SkillCompetency(name: 'Public Speaking', level: 55, isHardSkill: false),
    SkillCompetency(name: 'Kerja Tim', level: 82, isHardSkill: false),
    SkillCompetency(name: 'Manajemen Waktu', level: 60, isHardSkill: false),
  ];

  // ---------- 2. Eksplorasi Jurusan & Karier ----------
  static const List<CareerRoadmapStage> sampleRoadmap = [
    CareerRoadmapStage(
      stage: 'SMP',
      title: 'Eksplorasi Minat',
      description: 'Ikuti ekskul coding/desain, kenali minat dasar.',
      skills: ['Logika dasar', 'Rasa ingin tahu'],
    ),
    CareerRoadmapStage(
      stage: 'SMA/SMK',
      title: 'SMK Jurusan RPL',
      description: 'Fokus ke Rekayasa Perangkat Lunak, ikut lomba IT.',
      skills: ['HTML/CSS', 'Dasar pemrograman', 'Algoritma'],
    ),
    CareerRoadmapStage(
      stage: 'Kuliah',
      title: 'S1 Informatika',
      description: 'Perdalam software engineering, ikut magang.',
      skills: ['Python/Java', 'Database', 'Git'],
    ),
    CareerRoadmapStage(
      stage: 'Karier',
      title: 'Software Engineer',
      description: 'Estimasi gaji Rp8-25 juta/bulan tergantung level.',
      skills: ['System design', 'Cloud', 'Leadership'],
    ),
  ];

  static const List<MajorInfo> majors = [
    MajorInfo(
      name: 'Teknik Informatika',
      level: 'Kuliah',
      description: 'Mempelajari pengembangan perangkat lunak, algoritma, dan sistem komputer.',
      careerProspects: ['Software Engineer', 'Data Scientist', 'IT Consultant'],
      avgSalary: 'Rp6 - 20 juta/bulan',
    ),
    MajorInfo(
      name: 'Rekayasa Perangkat Lunak (RPL)',
      level: 'SMK',
      description: 'Fokus praktik pemrograman dan pengembangan aplikasi sejak SMK.',
      careerProspects: ['Junior Developer', 'QA Tester'],
      avgSalary: 'Rp3.5 - 8 juta/bulan',
    ),
    MajorInfo(
      name: 'Desain Komunikasi Visual',
      level: 'Kuliah',
      description: 'Belajar branding, ilustrasi, UI/UX, dan komunikasi visual.',
      careerProspects: ['UI/UX Designer', 'Graphic Designer', 'Art Director'],
      avgSalary: 'Rp5 - 15 juta/bulan',
    ),
  ];

  static const List<ProfessionInfo> professions = [
    ProfessionInfo(
      title: 'Data Scientist',
      description: 'Menganalisis data besar untuk insight bisnis dan membangun model prediktif.',
      requiredSkills: ['Python', 'Statistik', 'Machine Learning'],
      salaryRange: 'Rp8 - 30 juta/bulan',
      demandTrend: 'Naik',
    ),
    ProfessionInfo(
      title: 'UI/UX Designer',
      description: 'Merancang pengalaman & antarmuka pengguna produk digital.',
      requiredSkills: ['Figma', 'User Research', 'Prototyping'],
      salaryRange: 'Rp5 - 18 juta/bulan',
      demandTrend: 'Naik',
    ),
    ProfessionInfo(
      title: 'Cyber Security Analyst',
      description: 'Menjaga keamanan sistem & data dari ancaman siber.',
      requiredSkills: ['Network Security', 'Ethical Hacking', 'Risk Analysis'],
      salaryRange: 'Rp7 - 25 juta/bulan',
      demandTrend: 'Naik',
    ),
  ];

  static const List<FutureSkill> futureSkills = [
    FutureSkill(name: 'Artificial Intelligence', category: 'AI', growthPercent: 35),
    FutureSkill(name: 'Data Analysis', category: 'Data Science', growthPercent: 28),
    FutureSkill(name: 'Cloud Computing', category: 'Infrastructure', growthPercent: 24),
    FutureSkill(name: 'Cyber Security', category: 'Cyber Security', growthPercent: 22),
    FutureSkill(name: 'UI/UX Design', category: 'UI/UX', growthPercent: 18),
  ];

  // ---------- 3. Katalog Pendidikan ----------
  static const List<SchoolInfo> schools = [
    SchoolInfo(
      name: 'Universitas Indonesia',
      type: 'PTN',
      accreditation: 'Unggul',
      capacity: 8500,
      tuitionInfo: 'UKT Rp0 - 12 juta/semester',
      location: 'Depok, Jawa Barat',
    ),
    SchoolInfo(
      name: 'Institut Teknologi Bandung',
      type: 'PTN',
      accreditation: 'Unggul',
      capacity: 4200,
      tuitionInfo: 'UKT Rp0 - 12.5 juta/semester',
      location: 'Bandung, Jawa Barat',
    ),
    SchoolInfo(
      name: 'SMKN 1 Jakarta',
      type: 'SMK',
      accreditation: 'A',
      capacity: 360,
      tuitionInfo: 'Gratis (Negeri)',
      location: 'Jakarta Pusat',
    ),
    SchoolInfo(
      name: 'Politeknik Negeri Jakarta',
      type: 'Kedinasan/PTN',
      accreditation: 'A',
      capacity: 1200,
      tuitionInfo: 'UKT Rp2 - 6 juta/semester',
      location: 'Depok, Jawa Barat',
    ),
  ];

  // ---------- 4. SNBP & SNBT ----------
  static const List<SnbpPrediction> snbpPredictions = [
    SnbpPrediction(
      majorName: 'Teknik Informatika',
      universityName: 'Universitas Indonesia',
      chancePercent: 68,
      subjectAverages: {'Matematika': 85, 'B.Indonesia': 80, 'B.Inggris': 82},
    ),
    SnbpPrediction(
      majorName: 'Sistem Informasi',
      universityName: 'Universitas Gadjah Mada',
      chancePercent: 74,
      subjectAverages: {'Matematika': 85, 'B.Indonesia': 80, 'B.Inggris': 82},
    ),
  ];

  static const List<TryoutPackage> tryoutPackages = [
    TryoutPackage(
      title: 'TPS - Penalaran Umum',
      totalQuestions: 30,
      durationMinutes: 30,
      subjectCategory: 'TPS',
      isCompleted: true,
      lastScore: 78,
    ),
    TryoutPackage(
      title: 'Literasi Bahasa Indonesia',
      totalQuestions: 25,
      durationMinutes: 25,
      subjectCategory: 'Literasi',
      isCompleted: true,
      lastScore: 82,
    ),
    TryoutPackage(
      title: 'Penalaran Matematika',
      totalQuestions: 20,
      durationMinutes: 30,
      subjectCategory: 'Matematika',
      isCompleted: false,
    ),
    TryoutPackage(
      title: 'Tryout Akbar Nasional #3',
      totalQuestions: 155,
      durationMinutes: 195,
      subjectCategory: 'Gabungan',
      isCompleted: false,
    ),
  ];

  // ---------- 5. Scholarship Matcher ----------
  static final List<ScholarshipInfo> scholarships = [
    ScholarshipInfo(
      name: 'Beasiswa Indonesia Maju (BIM)',
      provider: 'Kemendikbudristek',
      origin: 'Dalam Negeri',
      type: 'Pemerintah',
      deadline: DateTime(2026, 8, 15),
      matchPercent: 88,
      requirements: ['Nilai rata-rata min 85', 'Aktif organisasi', 'Surat rekomendasi'],
    ),
    ScholarshipInfo(
      name: 'LPDP Afirmasi',
      provider: 'LPDP',
      origin: 'Dalam Negeri',
      type: 'Pemerintah',
      deadline: DateTime(2026, 9, 1),
      matchPercent: 70,
      requirements: ['Lulus S1', 'TOEFL min 500', 'Asal daerah afirmasi'],
    ),
    ScholarshipInfo(
      name: 'Dibimbing.id Scholarship',
      provider: 'Dibimbing ID',
      origin: 'Dalam Negeri',
      type: 'Swasta',
      deadline: DateTime(2026, 7, 20),
      matchPercent: 92,
      requirements: ['Portofolio coding', 'Komitmen belajar intensif'],
    ),
    ScholarshipInfo(
      name: 'Chevening Scholarship',
      provider: 'UK Government',
      origin: 'Luar Negeri',
      type: 'Pemerintah',
      deadline: DateTime(2026, 11, 5),
      matchPercent: 55,
      requirements: ['Pengalaman kerja 2 tahun', 'IELTS min 6.5'],
    ),
  ];

  // ---------- 6. Portofolio Digital ----------
  static final List<PortfolioItem> portfolioItems = [
    PortfolioItem(
      id: '1',
      title: 'Juara 2 Lomba Coding Tingkat Provinsi',
      category: 'Sertifikat',
      description: 'Kompetisi web development antar SMK se-Jawa Barat',
      date: DateTime(2026, 3, 12),
    ),
    PortfolioItem(
      id: '2',
      title: 'Aplikasi Manajemen Tugas (Flutter)',
      category: 'Proyek',
      description: 'Aplikasi mobile to-do list dengan Firebase backend',
      date: DateTime(2026, 5, 2),
    ),
    PortfolioItem(
      id: '3',
      title: 'Ketua OSIS 2025/2026',
      category: 'Organisasi',
      description: 'Memimpin 12 divisi dengan total 45 anggota',
      date: DateTime(2025, 7, 1),
    ),
  ];

  // ---------- 7. Magang & PKL ----------
  static const List<InternshipListing> internships = [
    InternshipListing(
      company: 'Telkom Indonesia',
      position: 'Magang Software Developer',
      location: 'Bandung',
      duration: '3 bulan',
      matchPercent: 85,
      isRemote: false,
    ),
    InternshipListing(
      company: 'Dibimbing ID',
      position: 'PKL UI/UX Design',
      location: 'Remote',
      duration: '6 bulan',
      matchPercent: 78,
      isRemote: true,
    ),
    InternshipListing(
      company: 'Bank Mandiri',
      position: 'Magang IT Support',
      location: 'Jakarta',
      duration: '2 bulan',
      matchPercent: 64,
      isRemote: false,
    ),
  ];

  static final List<LogbookEntry> logbookEntries = [
    LogbookEntry(date: DateTime(2026, 6, 18), activity: 'Setup environment & onboarding tim dev', status: 'Hadir'),
    LogbookEntry(date: DateTime(2026, 6, 19), activity: 'Implementasi fitur login aplikasi internal', status: 'Hadir'),
    LogbookEntry(date: DateTime(2026, 6, 20), activity: 'Code review & perbaikan bug API', status: 'Hadir'),
  ];

  // ---------- 9. Produktivitas ----------
  static final List<TodoTask> todoTasks = [
    TodoTask(id: '1', title: 'Tryout SNBT Paket 3', dueDate: DateTime(2026, 6, 22), category: 'Ujian'),
    TodoTask(id: '2', title: 'Upload sertifikat lomba ke portofolio', dueDate: DateTime(2026, 6, 23), category: 'Target Harian'),
    TodoTask(id: '3', title: 'Deadline pendaftaran Beasiswa Dibimbing', dueDate: DateTime(2026, 7, 20), category: 'Deadline'),
    TodoTask(id: '4', title: 'Latihan soal Matematika - Turunan', dueDate: DateTime(2026, 6, 21), category: 'Target Harian', isDone: true),
  ];

  // ---------- 10. Forum & Komunitas ----------
  static const List<ForumPost> forumPosts = [
    ForumPost(
      author: 'Raka P.',
      authorRole: 'Siswa SMK',
      title: 'Tips lolos SNBP jalur prestasi, ada yang punya pengalaman?',
      preview: 'Aku punya beberapa sertifikat lomba, apa cukup buat naikin peluang SNBP?',
      replyCount: 24,
      timeAgo: '1 jam lalu',
    ),
    ForumPost(
      author: 'Citra A.',
      authorRole: 'Mahasiswa UI',
      title: 'Sharing pengalaman kuliah Informatika UI tahun pertama',
      preview: 'Banyak yang nanya soal mata kuliah dasar, aku rangkum di sini ya...',
      replyCount: 41,
      timeAgo: '3 jam lalu',
    ),
    ForumPost(
      author: 'Dimas S.',
      authorRole: 'Alumni',
      title: 'Cara dapat magang di startup tanpa pengalaman',
      preview: 'Kunci utamanya portofolio, bukan IPK semata...',
      replyCount: 18,
      timeAgo: '6 jam lalu',
    ),
  ];

  static const List<MentorProfile> mentors = [
    MentorProfile(name: 'Aditya Pratama', role: 'Software Engineer di Gojek', expertise: 'Backend & System Design', rating: 4.9),
    MentorProfile(name: 'Sarah Wijaya', role: 'Mahasiswa S1 ITB', expertise: 'Tips SNBT & SNBP', rating: 4.8),
    MentorProfile(name: 'Budi Santoso', role: 'UI/UX Lead di Tokopedia', expertise: 'Portofolio Desain', rating: 4.9),
  ];

  // ---------- 12. Gamifikasi ----------
  static const List<AchievementBadge> badges = [
    AchievementBadge(name: 'Top Learner', iconName: 'star', isUnlocked: true),
    AchievementBadge(name: '7 Hari Beruntun', iconName: 'local_fire_department', isUnlocked: true),
    AchievementBadge(name: 'Tryout Master', iconName: 'military_tech', isUnlocked: false),
    AchievementBadge(name: 'Portofolio Builder', iconName: 'folder_special', isUnlocked: true),
    AchievementBadge(name: 'Forum Helper', iconName: 'volunteer_activism', isUnlocked: false),
  ];

  static const List<DailyMission> dailyMissions = [
    DailyMission(title: 'Kerjakan 10 soal latihan', xpReward: 50, isCompleted: true),
    DailyMission(title: 'Baca 1 artikel Future Skill', xpReward: 20, isCompleted: false),
    DailyMission(title: 'Update progress portofolio', xpReward: 30, isCompleted: false),
  ];

  static const int currentXp = 1240;
  static const int xpToNextLevel = 1500;
  static const int currentLevel = 7;

  // ---------- 13. Analitik & Prediksi ----------
  static const List<CareerTwinScenario> careerTwinScenarios = [
    CareerTwinScenario(
      path: 'SMK RPL -> S1 Informatika -> Software Engineer',
      totalCost: 'Rp45 - 90 juta (4 tahun)',
      studyDuration: '4 tahun',
      estimatedSalary: 'Rp8 - 20 juta/bulan (entry level)',
      successProbability: 78,
    ),
    CareerTwinScenario(
      path: 'SMA IPA -> S1 Desain Komunikasi Visual -> UI/UX Designer',
      totalCost: 'Rp60 - 120 juta (4 tahun)',
      studyDuration: '4 tahun',
      estimatedSalary: 'Rp6 - 15 juta/bulan (entry level)',
      successProbability: 71,
    ),
  ];

  // ---------- 14. Premium ----------
  static const List<PremiumService> premiumServices = [
    PremiumService(
      title: 'Konsultasi 1-on-1 Guru BK Pro',
      description: 'Sesi 60 menit membahas rencana studi & kariermu',
      priceLabel: 'Rp75.000 / sesi',
      iconName: 'support_agent',
    ),
    PremiumService(
      title: 'Review CV & LinkedIn',
      description: 'Dapat masukan langsung dari praktisi industri',
      priceLabel: 'Rp50.000 / review',
      iconName: 'description',
    ),
    PremiumService(
      title: 'Coaching Persiapan Karier',
      description: 'Pendampingan personal 4 sesi sebulan',
      priceLabel: 'Rp250.000 / bulan',
      iconName: 'school',
    ),
  ];
}
