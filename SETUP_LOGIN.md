# Panduan Setup Login Google & Facebook — EduPath AI

Kode untuk Google Sign-In dan Facebook Login **sudah lengkap dan benar**
(pakai API terbaru `google_sign_in` v7). Supaya benar-benar berfungsi saat
kamu jalankan, ikuti langkah-langkah di bawah ini di luar kode.

---

## 1. Google Sign-In

### a. Aktifkan provider di Firebase Console
1. Buka https://console.firebase.google.com → pilih project **edupath-ai-a35fa**
2. Authentication → Sign-in method → aktifkan **Google**

### b. Daftarkan SHA-1 fingerprint (WAJIB untuk Android)
Tanpa ini, Google Sign-In akan selalu gagal di Android.

```bash
cd android
./gradlew signingReport
```
Cari baris `SHA1` di bagian `debug` (untuk testing) dan nanti `release` (untuk rilis production).

1. Firebase Console → Project Settings → klik app Android kamu
2. Scroll ke "Add fingerprint" → tempel SHA-1 yang didapat
3. Download ulang `google-services.json` yang baru, lalu **timpa** file
   yang ada di `android/app/google-services.json`

### c. (Opsional tapi disarankan) Generate ulang firebase_options.dart otomatis
File `lib/firebase_options.dart` saat ini sudah valid untuk Android, tapi
placeholder untuk Web/iOS. Cara paling aman generate semuanya otomatis:

```bash
dart pub global activate flutterfire_cli
flutterfire configure --project=edupath-ai-a35fa
```
Ikuti instruksi interaktifnya (pilih platform Android/Web/iOS yang dipakai).
Ini akan menimpa `firebase_options.dart` dengan nilai yang benar untuk semua
platform yang kamu pilih, dan otomatis mendaftarkan app baru ke Firebase
kalau belum ada (misal app Web).

---

## 2. Facebook Login

### a. Buat App di Facebook Developers
1. Buka https://developers.facebook.com/apps → Create App → pilih tipe **Consumer**
2. Setelah app dibuat, catat **App ID** dan **Client Token**
   (Settings → Basic, dan Settings → Advanced → Client Token)
3. Tambahkan produk **Facebook Login** ke app, lalu di pengaturannya
   tambahkan Android platform dengan:
   - Package Name: `com.example.edu_path` (cek `android/app/build.gradle.kts`
     untuk applicationId yang sebenarnya dipakai)
   - Key Hashes: generate dengan:
     ```bash
     keytool -exportcert -alias androiddebugkey -keystore ~/.android/debug.keystore | openssl sha1 -binary | openssl base64
     ```
     (password default keystore debug: `android`)

### b. Isi App ID & Client Token ke project
Edit file `android/app/src/main/res/values/strings.xml`:

```xml
<string name="facebook_app_id">ISI_DENGAN_APP_ID_ASLI</string>
<string name="facebook_client_token">ISI_DENGAN_CLIENT_TOKEN_ASLI</string>
<string name="fb_login_protocol_scheme">fbISI_DENGAN_APP_ID_ASLI</string>
```
(`fb_login_protocol_scheme` formatnya selalu `fb` + App ID, tanpa spasi)

### c. Aktifkan provider Facebook di Firebase Console
1. Firebase Console → Authentication → Sign-in method → aktifkan **Facebook**
2. Isi App ID dan App Secret Facebook ke kolom yang diminta Firebase
3. Salin **OAuth redirect URI** yang ditampilkan Firebase, lalu tempelkan di
   Facebook Developers → Facebook Login → Settings → "Valid OAuth Redirect URIs"

---

## 3. Testing

Setelah semua di atas selesai:

```bash
flutter pub get
flutter run
```

Coba tombol Google/Facebook di halaman Login. Kalau masih gagal, cek:
- Apakah SHA-1 yang didaftarkan sesuai dengan keystore yang dipakai untuk build
  (debug vs release pakai SHA-1 berbeda!)
- Apakah `google-services.json` sudah versi terbaru (setelah nambah SHA-1)
- Log error di konsol — `FirebaseAuthException` biasanya kasih pesan jelas

---

## Catatan Web & iOS

Konfigurasi saat ini baru lengkap untuk **Android**. Kalau kamu juga butuh
jalankan di Web atau iOS, jalankan `flutterfire configure` (langkah 1c di
atas) untuk auto-generate konfigurasi platform tersebut, lalu untuk iOS
tambahkan juga konfigurasi Facebook Login khusus iOS (Info.plist) — lihat
dokumentasi resmi `flutter_facebook_auth` untuk detailnya:
https://pub.dev/packages/flutter_facebook_auth
