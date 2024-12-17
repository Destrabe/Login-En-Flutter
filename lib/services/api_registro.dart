import 'dart:convert';
import 'package:http/http.dart' as http;

class Api_registro {
  final String baseUrl = "https://portfolio-c4l9.onrender.com";

  Future<bool> registerUser(String nombreRegistro, String correoRegistro,
      String contraseniaRegistro) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/appregistro'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'nombre': nombreRegistro,
          'correo': correoRegistro,
          'contrasenia': contraseniaRegistro,
        }),
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      print("Correo enviado: $correoRegistro");

      if (response.statusCode == 200) {
        return true;
      } else {
        var errorResponse = json.decode(response.body);
        String errorMessage = errorResponse is List
            ? (errorResponse as List).join(",")
            : 'Error desconocido';
        throw Exception('Error al registrar al usuario: $errorMessage');
      }
    } catch (e) {
      throw Exception('Error al conectar con la API: $e');
    }
  }
}
