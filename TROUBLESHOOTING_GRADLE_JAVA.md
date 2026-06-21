# Troubleshooting: Error Gradle / Java saat `flutter run` (Windows)

## Error yang muncul
```
Value '/usr/lib/jvm/java-17-openjdk-amd64' given for org.gradle.java.home
Gradle property is invalid (Java home supplied is invalid)
```

## Penyebab
File `android/gradle.properties` di project ini sebelumnya berisi baris:
```
org.gradle.java.home=/usr/lib/jvm/java-17-openjdk-amd64
```
Itu adalah **path Java khas Linux**, padahal kamu menjalankan project di
**Windows**. Baris ini kemungkinan tertinggal dari environment/template lain
dan tidak relevan untuk setup kamu. **Sudah saya hapus** dari project ini.

## Cek apakah sekarang sudah cukup
Setelah baris itu dihapus, coba langsung:
```powershell
cd D:\edu2\Edu_PathAI
flutter clean
flutter pub get
flutter run
```

## Kalau masih error soal Java setelah itu
Itu artinya Gradle tidak bisa menemukan JDK secara otomatis di sistem kamu.
Berarti perlu setting `JAVA_HOME` secara manual di Windows:

### 1. Cek apakah JDK 17 sudah terpasang
```powershell
java -version
```
Kalau tidak ada / errornya "not recognized", install dulu JDK 17:
- Download dari https://adoptium.net/temurin/releases/?version=17
  (pilih installer `.msi` untuk Windows x64)
- Saat instalasi, centang opsi **"Set JAVA_HOME variable"** dan
  **"Add to PATH"** kalau tersedia.

### 2. Cek/atur JAVA_HOME secara manual
1. Tekan **Win** → cari "Edit the system environment variables" → Enter
2. Klik tombol **Environment Variables...**
3. Di bagian **System variables**, klik **New...**
   - Variable name: `JAVA_HOME`
   - Variable value: path instalasi JDK kamu, contoh:
     `C:\Program Files\Eclipse Adoptium\jdk-17.0.x.x-hotspot`
     (sesuaikan dengan folder JDK yang benar-benar ada di komputermu —
     cek di `C:\Program Files\Eclipse Adoptium\` atau
     `C:\Program Files\Java\`)
4. Edit variable **Path** (di System variables juga), tambahkan baris baru:
   `%JAVA_HOME%\bin`
5. Klik OK semua, lalu **tutup dan buka ulang VS Code/terminal** supaya
   perubahan environment variable kebaca.

### 3. Verifikasi
```powershell
echo $env:JAVA_HOME
java -version
flutter doctor -v
```
`flutter doctor -v` akan menunjukkan apakah Android toolchain & Java
sudah terdeteksi dengan benar (cari bagian "Android toolchain").

### Alternatif: pakai JDK bawaan Android Studio
Kalau kamu sudah install Android Studio, biasanya ada JDK bawaan di:
```
C:\Program Files\Android\Android Studio\jbr
```
Bisa dipakai sebagai `JAVA_HOME` juga tanpa perlu install JDK terpisah.

---

## Catatan
Error ini **tidak ada hubungannya dengan kode aplikasi EduPath AI** — murni
soal konfigurasi Java/Gradle di environment lokal kamu. Setelah Java
terdeteksi dengan benar, build seharusnya lanjut ke proses compile kode
Flutter/Dart yang sesungguhnya.
