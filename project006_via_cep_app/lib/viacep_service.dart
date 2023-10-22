import 'dart:convert';
import 'package:http/http.dart' as http;

class ViaCepService {
  final String baseUrl = "https://viacep.com.br/ws/";

  Future<Map<String, dynamic>> getCEP(String cep) async {
    final response = await http.get(Uri.parse("$baseUrl$cep/json"));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Falha ao buscar CEP");
    }
  }
}