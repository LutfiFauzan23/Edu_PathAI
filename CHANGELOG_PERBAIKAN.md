# Ringkasan Perbaikan & Fitur Baru — EduPath AI

## 🔧 Error yang diperbaiki

1. **`lib/firebase_options.dart` kosong (0 byte)**
   File ini diimpor & dipakai langsung di `main.dart` (`Firebase.initializeApp`),
   tapi isinya kosong total — pasti gagal compile. Sudah diisi dengan
   konfigurasi valid untuk Android (diambil dari `google-services.json`
   yang sudah ada), dan placeholder jelas untuk Web/iOS (lihat `SETUP_LOGIN.md`).

2. **Package `cloud_firestore` tidak terdaftar di `pubspec.yaml`**
   `lib/services/firestore_service.dart` mengimpor `cloud_firestore` padahal
   package-nya tidak ada di dependencies sama sekali → error "target of URI
   doesn't exist". Sudah ditambahkan `cloud_firestore: ^6.0.0`.

3. **`auth_service.dart` pakai API lama `google_sign_in`**
   Package `google_sign_in` versi terpasang adalah **7.2.0**, yang punya
   breaking changes besar dari versi sebelumnya (constructor `GoogleSignIn()`
   dan method `.signIn()` sudah dihapus). Kode lama akan gagal compile
   total. Sudah ditulis ulang pakai API baru: `GoogleSignIn.instance`,
   `.initialize()`, `.authenticate()`.

4. **`test/widget_test.dart` masih boilerplate default Flutter**
   Mereferensikan class `MyApp` yang tidak ada di project ini (app sebenarnya
   bernama `SnbpApp`), dan masih test counter button bawaan template.
   Sudah ditulis ulang jadi smoke test untuk `LoginScreen`.

5. **Fitur login sepenuhnya dummy**
   `LoginScreen` mengimpor `AuthService` & `FirestoreService` tapi tidak
   pernah memanggilnya — tombol login langsung lompat ke halaman utama
   tanpa autentikasi apapun. Sudah dihubungkan penuh ke Firebase Auth
   (email/password, Google, Facebook), lengkap dengan validasi form,
   loading state, dan error handling dalam Bahasa Indonesia.

6. **Konfigurasi Android untuk Facebook Login belum ada**
   `AndroidManifest.xml` belum punya meta-data & activity yang dibutuhkan
   `flutter_facebook_auth`. Sudah ditambahkan, plus file
   `strings.xml` baru untuk App ID Facebook (perlu diisi sendiri,
   lihat `SETUP_LOGIN.md`).

7. **Halaman Register belum ada**
   `LoginScreen` punya tautan "Sign Up" tapi tidak ada halaman tujuannya.
   Sudah dibuat `RegisterScreen` baru dengan gaya visual yang sama.

> ⚠️ Login Google & Facebook butuh beberapa langkah setup manual di luar kode
> (SHA-1 fingerprint, App ID Facebook, dll). Panduan lengkapnya ada di
> **`SETUP_LOGIN.md`**.

---

## 🚀 Fitur baru: 14 kategori EduPath AI

Semua 14 kategori dari permintaan sudah dibuat versi dasar/skeleton-nya,
bisa diakses dari tab tengah bottom navigation ("EduAI") yang sekarang
membuka **EduAI Hub** — grid menu menuju semua fitur:

| # | Fitur | Lokasi file |
|---|-------|-------------|
| 1 | Asesmen & Profiling Cerdas | `lib/screens/features/assessment_screen.dart` |
| 2 | Eksplorasi Jurusan & Karier | `lib/screens/features/career_explore_screen.dart` |
| 3 | Katalog Pendidikan | `lib/screens/features/school_catalog_screen.dart` |
| 4 | Persiapan SNBP & SNBT | `lib/screens/features/snbp_snbt_screen.dart` |
| 5 | Scholarship Matcher | `lib/screens/features/scholarship_screen.dart` |
| 6 | Portofolio Digital Siswa | `lib/screens/features/portfolio_screen.dart` |
| 7 | Portal Magang & PKL | `lib/screens/features/internship_screen.dart` |
| 8 | AI Career Assistant | `lib/screens/features/ai_assistant_screen.dart` |
| 9 | Produktivitas & Manajemen Waktu | `lib/screens/features/productivity_screen.dart` |
| 10 | Forum & Komunitas | `lib/screens/features/forum_screen.dart` |
| 11 | Dashboard Ortu & Guru BK | `lib/screens/features/dashboard_guardian_screen.dart` |
| 12 | Gamifikasi | `lib/screens/features/gamification_screen.dart` |
| 13 | Analitik & Prediksi Masa Depan | `lib/screens/features/analytics_screen.dart` |
| 14 | Fitur Premium | `lib/screens/features/premium_screen.dart` |

### Apa yang sudah jadi di tiap fitur
- UI lengkap & fungsional secara visual, mengikuti gaya desain yang sudah
  ada (card putih, border tipis, warna ungu primer `#6C2BD9`, dst — lihat
  `lib/theme/app_theme.dart`)
- Data masih **dummy** (`lib/data/feature_dummy_data.dart`), supaya bisa
  langsung dicoba tanpa setup backend dulu
- Model data sudah dirancang rapi (`lib/models/feature_models.dart`),
  siap dihubungkan ke Firestore tanpa perlu ubah UI
- Struktur koleksi Firestore yang disarankan sudah didokumentasikan di
  `lib/services/firestore_service.dart`

### Catatan penting (skeleton, belum produksi penuh)
Fitur-fitur ini masih **versi dasar/UI skeleton**, bukan implementasi
penuh produksi. Beberapa hal yang sengaja belum dikerjakan (di luar scope
"perbaiki error + bikin versi dasar"):
- **AI Career Assistant**: chat masih balasan dummy, belum tersambung ke
  layanan AI sungguhan (perlu API key & backend terpisah)
- **Machine Learning untuk tes minat bakat**: hasil tes saat ini statis
  (dummy), belum ada model ML sesungguhnya
- **Upload file** (sertifikat, foto profil, dsb): tombol ada, tapi belum
  terhubung ke Firebase Storage
- **Pembayaran fitur Premium**: tombol "Pesan" belum terhubung payment
  gateway
- **Notifikasi push** (Smart Reminder): belum diimplementasi (perlu
  Firebase Cloud Messaging)

Semua di atas adalah pekerjaan lanjutan yang masuk akal untuk fase
berikutnya — beri tahu fitur mana yang prioritas untuk dikembangkan lebih
dalam.

---

## 📦 Dependency baru di `pubspec.yaml`
```yaml
cloud_firestore: ^6.0.0   # database untuk semua fitur baru
fl_chart: ^1.1.0          # grafik aktivitas belajar mingguan di tab Progress
```

## Jalankan project
```bash
flutter pub get
flutter run
```
Untuk login Google/Facebook berfungsi penuh, ikuti `SETUP_LOGIN.md` dulu.
