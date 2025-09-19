import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  static const String baseUrl = 'https://farrmertransfer.xpertbot.online/api/auth';

  static Future<Map<String, dynamic>> register({
    required String prenom,
    required String name,
    required String telephone,
    required String password,
    required String passwordConfirmation,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/register'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: json.encode({
          'prenom': prenom,
          'name': name,
          'telephone': telephone,
          'password': password,
          'password_confirmation': passwordConfirmation,
        }),
      );

      final responseData = json.decode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return {
          'success': true,
          'data': responseData,
        };
      } else {
        return {
          'success': false,
          'error': responseData['message'] ?? 'Une erreur est survenue',
          'errors': responseData['errors'] ?? {},
        };
      }
    } catch (e) {
      return {
        'success': false,
        'error': 'Erreur de connexion. Vérifiez votre connexion internet.',
      };
    }
  }

  static Future<Map<String, dynamic>> login({
    required String telephone,
    required String password,
  }) async {
    try {
      print('🔐 Tentative de connexion avec téléphone: $telephone');
      
      final response = await http.post(
        Uri.parse('$baseUrl/login'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: json.encode({
          'telephone': telephone,
          'password': password,
        }),
      );

      print('📡 Status Code: ${response.statusCode}');
      print('📦 Response Body: ${response.body}');

      final responseData = json.decode(response.body);
      print('🔍 Parsed Response Data: $responseData');

      if (response.statusCode == 200 || response.statusCode == 201) {
        print('✅ Connexion réussie');
        print('👤 User Data: ${responseData['data']?['user']}');
        return {
          'success': true,
          'data': responseData['data'], // Extraction de la propriété 'data'
        };
      } else {
        print('❌ Échec de la connexion - Status: ${response.statusCode}');
        return {
          'success': false,
          'error': responseData['message'] ?? 'Identifiants incorrects',
          'errors': responseData['errors'] ?? {},
        };
      }
    } catch (e) {
      print('💥 Exception lors de la connexion: $e');
      print('📋 Stack trace: ${StackTrace.current}');
      return {
        'success': false,
        'error': 'Erreur de connexion. Vérifiez votre connexion internet.',
        'exception': e.toString(),
      };
    }
  }
}