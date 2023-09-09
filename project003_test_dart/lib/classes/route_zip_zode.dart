import 'dart:convert';
import 'package:http/http.dart' as http;

class RouteZipCode {
  Future<Map<dynamic, dynamic>> returnZipCode(String cep) async {
    var uri = Uri.parse("https://viacep.com.br/ws/$cep/json/");
    var returnStringZipCode = await http.get(uri);
    var decodeResponse =
        jsonDecode(utf8.decode(returnStringZipCode.bodyBytes)) as Map;
    return decodeResponse;
  }
}
