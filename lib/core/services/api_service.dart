import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiService {
  ApiService();
  final baseUrl = 'https://fakestoreapi.com';
  // GET request
  Future<Response> getRequest(String endpoint) async {
    final response = await http.get(Uri.parse('$endpoint'));
    // _handleResponse(response);
    // final data = json.decode(response.body);

    return response;
  }

  // POST request
  Future<Map<String, dynamic>?> postRequest(
      String endpoint, Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse('$endpoint'),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: json.encode(data),
    );
    //   _handleResponse(response);
    return json.decode(response.body);
  }

  // PUT request
  Future<Map<String, dynamic>?> putRequest(
      String endpoint, Map<String, dynamic> data) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl$endpoint'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(data),
      );
      _handleResponse(response);
      return json.decode(response.body);
    } catch (e) {
      print('PUT request error: $e');
      return null; // Handle the error as needed
    }
  }

  // DELETE request
  Future<bool> deleteRequest(String endpoint) async {
    try {
      final response = await http.delete(Uri.parse('$baseUrl$endpoint'));
      _handleResponse(response);
      return response.statusCode == 200; // Return true if successful
    } catch (e) {
      print('DELETE request error: $e');
      return false; // Handle the error as needed
    }
  }

  // Handle HTTP response
  void _handleResponse(http.Response response) {
    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw Exception(
          'HTTP error: ${response.statusCode} ${response.reasonPhrase}');
    }
  }
}
