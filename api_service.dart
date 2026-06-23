import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  // Ganti URL ini dengan URL server/localhost kamu. 
  // Jika pakai emulator Android dan XAMPP, gunakan 10.0.2.2.
  static const String baseUrl = 'http://10.4.2.5/phpmyadmin/'; 

  static Future<void> syncUserToMysql({
    required String uid,
    required String name,
    required String email,
    String? photoUrl,
    required String provider,
  }) async {
    final url = Uri.parse('$baseUrl/sync_user.php');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'firebase_uid': uid,
          'full_name': name,
          'email': email,
          'photo_url': photoUrl ?? '',
          'provider': provider, // 'google', 'facebook', atau 'email'
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print('MySQL Sync Result: ${data['message']}');
      } else {
        print('Gagal terhubung ke API MySQL. Status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error saat sinkronisasi MySQL: $e');
    }
  }
}