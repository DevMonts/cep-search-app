import 'dart:convert';

import 'package:cep/features/cep/data/model/cep_model.dart';
import 'package:http/http.dart' as http;

class CepRepository {
  static const baseUrl = 'https://viacep.com.br/ws';
  final http.Client httpClient;
  CepRepository({required this.httpClient});
  Future<CepModel> getCep(String cep) async {
    final url = Uri.parse('$baseUrl/$cep/json/');
    final response = await httpClient.get(url);
    final jsonMap = json.decode(response.body);
    return CepModel.fromJson(jsonMap);
  }
}
