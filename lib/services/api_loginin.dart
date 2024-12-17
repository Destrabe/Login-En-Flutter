import 'dart:convert';
import 'package:http/http.dart' as http;

class Api_loginin {
  final String baseUrl = "https://portfolio-c4l9.onrender.com";

  // Método para registrar un usuario (POST request)
  Future<bool> loginUser(String nombreLogin, String contraseniaLogin) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/applogin'),
        headers: {
          'Content-Type':
              'application/json', // Indicamos que los datos se enviarán en formato JSON
        },
        body: json.encode({
          'nombre': nombreLogin,
          'contrasenia': contraseniaLogin,
        }),
      );

      // Depurar la respuesta de la API
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      // Verificar que la respuesta de la API es exitosa
      if (response.statusCode == 200) {
        return true;
      } else if (response.statusCode == 400) {
        // Verificar si el error es relacionado con el nombre o la contraseña
        if (response.body.contains('Nombre incorrecto')) {
          throw Exception('Nombre incorrecto');
        } else if (response.body.contains('Contraseña incorrecta')) {
          throw Exception('Contraseña incorrecta');
        } else {
          throw Exception('Error desconocido: ${response.body}');
        }
      } else {
        throw Exception('Error al registrar al usuario: ${response.body}');
      }
    } catch (e) {
      throw Exception('Error al conectar con la API: $e');
    }
  }
}
