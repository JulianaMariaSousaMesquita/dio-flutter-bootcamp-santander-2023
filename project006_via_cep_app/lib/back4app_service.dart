import 'package:dio/dio.dart';

class Back4AppService {
  final String baseUrl = "https://api.back4app.com/classes/CEP";

  final Dio dio = Dio();

  Back4AppService() {
    dio.options.headers["X-Parse-Application-Id"] = "YOUR_APP_ID";
    dio.options.headers["X-Parse-REST-API-Key"] = "YOUR_REST_API_KEY";
  }

  Future<Map<String, dynamic>> getCEPFromBack4App(String cep) async {
    try {
      final response = await dio.get("$baseUrl?where={\"cep\":\"$cep\"}");
      if (response.statusCode == 200) {
        // Processar a resposta e retornar os dados do CEP
        return response.data;
      } else {
        throw Exception("Falha ao buscar CEP do Back4App");
      }
    } catch (e) {
      throw Exception("Erro na requisição: $e");
    }
  }

  Future<void addCEPToBack4App(Map<String, dynamic> cepData) async {
    try {
      final response = await dio.post(baseUrl, data: cepData);
      if (response.statusCode == 201) {
        // CEP adicionado com sucesso
      } else {
        throw Exception("Falha ao adicionar CEP ao Back4App");
      }
    } catch (e) {
      throw Exception("Erro na requisição: $e");
    }
  }

  Future<void updateCEPInBack4App(String cep, Map<String, dynamic> updatedData) async {
    try {
      final existingCEP = await getCEPFromBack4App(cep);

      if (existingCEP != null) {
        final objectId = existingCEP['objectId'];
        final response = await dio.put("$baseUrl/$objectId", data: updatedData);

        if (response.statusCode == 200) {
          // CEP atualizado com sucesso
        } else {
          throw Exception("Falha ao atualizar CEP no Back4App");
        }
      } else {
        throw Exception("CEP não encontrado no Back4App");
      }
    } catch (e) {
      throw Exception("Erro na requisição: $e");
    }
  }

  Future<void deleteCEPInBack4App(String cep) async {
    try {
      final existingCEP = await getCEPFromBack4App(cep);

      if (existingCEP != null) {
        final objectId = existingCEP['objectId'];
        final response = await dio.delete("$baseUrl/$objectId");

        if (response.statusCode == 200) {
          // CEP excluído com sucesso
        } else {
          throw Exception("Falha ao excluir CEP do Back4App");
        }
      } else {
        throw Exception("CEP não encontrado no Back4App");
      }
    } catch (e) {
      throw Exception("Erro na requisição: $e");
    }
  }
}
