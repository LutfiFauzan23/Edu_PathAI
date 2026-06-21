/// Model-model data untuk 14 kategori fitur EduPath AI.
/// Semuanya didesain agar mudah dihubungkan ke Firestore nanti --
/// untuk sekarang sumber datanya dummy (lihat data/feature_dummy_data.dart).

// ---------- 1. Asesmen & Profiling ----------

class PersonalityResult {
  final String type; // misal: "Investigative-Artistic"
  final String description;
  final List<String> strengths;
  final List<MajorRecommendation> recommendedMajors;

  const PersonalityResult({
    required this.type,
    required this.description,
    required this.strengths,
    required this.recommendedMajors,
  });
}

class MajorRecommendation {
  final String name;
  final int matchPercent;
  final String reason;

  const MajorRecommendation({
    required this.name,
    required this.matchPercent,
    required this.reason,
  });
}

class SkillCompetency {
  final String name;
  final int level; // 0-100
  final bool isHardSkill;

  const SkillCompetency({
    required this.name,
    required this.level,
    required this.isHardSkill,
  });
}

// ---------- 2. Eksplorasi Jurusan & Karier ----------

class CareerRoadmapStage {
  final String stage; // SMP, SMA/SMK, Kuliah, Karier
  final String title;
  final String description;
  final List<String> skills;

  const CareerRoadmapStage({
    required this.stage,
    required this.title,
    required this.description,
    required this.skills,
  });
}

class MajorInfo {
  final String name;
  final String level; // SMA, SMK, Kuliah
  final String description;
  final List<String> careerProspects;
  final String avgSalary;

  const MajorInfo({
    required this.name,
    required this.level,
    required this.description,
    required this.careerProspects,
    required this.avgSalary,
  });
}

class ProfessionInfo {
  final String title;
  final String description;
  final List<String> requiredSkills;
  final String salaryRange;
  final String demandTrend; // Naik / Stabil / Turun

  const ProfessionInfo({
    required this.title,
    required this.description,
    required this.requiredSkills,
    required this.salaryRange,
    required this.demandTrend,
  });
}

class FutureSkill {
  final String name;
  final String category; // AI, Data Science, Cyber Security, UI/UX
  final int growthPercent;

  const FutureSkill({
    required this.name,
    required this.category,
    required this.growthPercent,
  });
}

// ---------- 3. Katalog Pendidikan ----------

class SchoolInfo {
  final String name;
  final String type; // SMA, SMK, PTN, PTS, Kedinasan
  final String accreditation;
  final int capacity;
  final String tuitionInfo; // UKT/SPP
  final String location;

  const SchoolInfo({
    required this.name,
    required this.type,
    required this.accreditation,
    required this.capacity,
    required this.tuitionInfo,
    required this.location,
  });
}

// ---------- 4. Persiapan SNBP & SNBT ----------

class SnbpPrediction {
  final String majorName;
  final String universityName;
  final int chancePercent;
  final Map<String, int> subjectAverages;

  const SnbpPrediction({
    required this.majorName,
    required this.universityName,
    required this.chancePercent,
    required this.subjectAverages,
  });
}

class TryoutPackage {
  final String title;
  final int totalQuestions;
  final int durationMinutes;
  final String subjectCategory; // TPS, Literasi, dll
  final bool isCompleted;
  final int? lastScore;

  const TryoutPackage({
    required this.title,
    required this.totalQuestions,
    required this.durationMinutes,
    required this.subjectCategory,
    this.isCompleted = false,
    this.lastScore,
  });
}

// ---------- 5. Scholarship Matcher ----------

class ScholarshipInfo {
  final String name;
  final String provider;
  final String origin; // Dalam Negeri / Luar Negeri
  final String type; // Pemerintah / Swasta
  final DateTime deadline;
  final int matchPercent;
  final List<String> requirements;

  const ScholarshipInfo({
    required this.name,
    required this.provider,
    required this.origin,
    required this.type,
    required this.deadline,
    required this.matchPercent,
    required this.requirements,
  });
}

// ---------- 6. Portofolio Digital ----------

class PortfolioItem {
  final String id;
  final String title;
  final String category; // Sertifikat, Proyek, Organisasi
  final String description;
  final DateTime date;

  const PortfolioItem({
    required this.id,
    required this.title,
    required this.category,
    required this.description,
    required this.date,
  });
}

// ---------- 7. Portal Magang & PKL ----------

class InternshipListing {
  final String company;
  final String position;
  final String location;
  final String duration;
  final int matchPercent;
  final bool isRemote;

  const InternshipListing({
    required this.company,
    required this.position,
    required this.location,
    required this.duration,
    required this.matchPercent,
    required this.isRemote,
  });
}

class LogbookEntry {
  final DateTime date;
  final String activity;
  final String status; // Hadir, Izin, Sakit

  const LogbookEntry({
    required this.date,
    required this.activity,
    required this.status,
  });
}

// ---------- 9. Produktivitas ----------

class TodoTask {
  final String id;
  final String title;
  final DateTime dueDate;
  final String category; // Ujian, Deadline, Target Harian
  final bool isDone;

  const TodoTask({
    required this.id,
    required this.title,
    required this.dueDate,
    required this.category,
    this.isDone = false,
  });
}

// ---------- 10. Forum & Komunitas ----------

class ForumPost {
  final String author;
  final String authorRole; // Siswa, Mahasiswa, Alumni
  final String title;
  final String preview;
  final int replyCount;
  final String timeAgo;

  const ForumPost({
    required this.author,
    required this.authorRole,
    required this.title,
    required this.preview,
    required this.replyCount,
    required this.timeAgo,
  });
}

class MentorProfile {
  final String name;
  final String role; // Mahasiswa ITB, Software Engineer di X
  final String expertise;
  final double rating;

  const MentorProfile({
    required this.name,
    required this.role,
    required this.expertise,
    required this.rating,
  });
}

// ---------- 12. Gamifikasi ----------

class AchievementBadge {
  final String name;
  final String iconName;
  final bool isUnlocked;

  const AchievementBadge({
    required this.name,
    required this.iconName,
    required this.isUnlocked,
  });
}

class DailyMission {
  final String title;
  final int xpReward;
  final bool isCompleted;

  const DailyMission({
    required this.title,
    required this.xpReward,
    required this.isCompleted,
  });
}

// ---------- 13. Analitik & Prediksi ----------

class CareerTwinScenario {
  final String path; // "SIJA -> Informatika -> Software Engineer"
  final String totalCost;
  final String studyDuration;
  final String estimatedSalary;
  final int successProbability;

  const CareerTwinScenario({
    required this.path,
    required this.totalCost,
    required this.studyDuration,
    required this.estimatedSalary,
    required this.successProbability,
  });
}

// ---------- 14. Premium ----------

class PremiumService {
  final String title;
  final String description;
  final String priceLabel;
  final String iconName;

  const PremiumService({
    required this.title,
    required this.description,
    required this.priceLabel,
    required this.iconName,
  });
}

// ---------- Hub fitur (dipakai untuk grid 14 kategori) ----------

class FeatureCategory {
  final String title;
  final String subtitle;
  final String iconName;
  final String routeKey;

  const FeatureCategory({
    required this.title,
    required this.subtitle,
    required this.iconName,
    required this.routeKey,
  });
}
