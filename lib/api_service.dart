import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com/';

  Future<dynamic> get(String endpoint) async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/$endpoint'));
      return _handleResponse(response);
    } catch (e) {
      throw Exception('API call failed: $e');
    }
  }

  Future<dynamic> post(String endpoint, Map<String, dynamic> data) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/$endpoint'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(data),
      );
      return _handleResponse(response);
    } catch (e) {
      throw Exception('API call failed: $e');
    }
  }

  dynamic _handleResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        return json.decode(response.body);
      case 400:
        throw Exception('Bad Request');
      case 401:
      case 403:
        throw Exception('Unauthorized');
      case 404:
        throw Exception('Not Found');
      case 500:
        throw Exception('Server Error');
      default:
        throw Exception('Request failed with status: ${response.statusCode}');
    }
  }
}
