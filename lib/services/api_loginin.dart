import 'dart:convert';
import 'package:http/http.dart' as http;

class Api_loginin {
  final String baseUrl = "https://portfolio-c4l9.onrender.com"; 

  // Método para registrar un usuario (POST request)
  Future<bool> loginUser(String nombreLogin,String contraseniaLogin) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/loginin'),
        headers: {
          'Content-Type': 'application/json', // Indicamos que los datos se enviarán en formato JSON
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
      if (response.statusCode == 200 ) {
        return true; // Registro exitosov
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