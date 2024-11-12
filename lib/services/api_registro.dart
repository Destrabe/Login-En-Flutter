import 'dart:convert';
import 'package:http/http.dart' as http;

class Api_registro {
  final String baseUrl = "https://portfolio-c4l9.onrender.com";  // Reemplaza con la URL de tu API

  // Método para registrar un usuario (POST request)
  Future<bool> registerUser(String nombreRegister, String contraseniaRegister, String correoRegister) async {
    try {
      // Realiza la solicitud POST a la API
      final response = await http.post(
        Uri.parse('$baseUrl/registro'), // URL completa para el registro
        headers: {
          'Content-Type': 'application/json', // Indicamos que los datos se enviarán en formato JSON
        },
        body: json.encode({
          'nombre': nombreRegister,
          'contrasenia': contraseniaRegister,
          'correo': correoRegister, 
        }),
      );

      // Depurar la respuesta de la API
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      // Verificar que la respuesta de la API es exitosa
      if (response.statusCode == 200) {
        return true; // Registro exitoso
      } else {
        // Si la API devuelve un error, lanza una excepción
        throw Exception('Error al registrar al usuario: ${response.body}');
      }
    } catch (e) {
      // Si hay un error de conexión o cualquier otra excepción
      throw Exception('Error al conectar con la API: $e');
    }
  }
}

