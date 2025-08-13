import 'dart:convert';

class CepModel {
  final String cep;
  final String logradouro;
  final String complemento;
  final String unidade;
  final String bairro;
  final String localidade;
  final String estado;
  final String uf;
  final String regiao;
  final String ibge;
  final String gia;
  final String ddd;
  final String siafi;
  CepModel({
    required this.cep,
    required this.logradouro,
    required this.complemento,
    required this.unidade,
    required this.bairro,
    required this.localidade,
    required this.estado,
    required this.uf,
    required this.regiao,
    required this.ibge,
    required this.gia,
    required this.ddd,
    required this.siafi,
  });

  factory CepModel.fromJson(Map<String, dynamic> json) {
    return CepModel(
      cep: json['cep'],
      logradouro: json['logradouro'],
      complemento: json['complemento'],
      unidade: json['unidade'],
      bairro: json['bairro'],
      localidade: json['localidade'],
      estado: json['estado'],
      uf: json['uf'],
      regiao: json['regiao'],
      ibge: json['ibge'],
      gia: json['gia'],
      ddd: json['ddd'],
      siafi: json['siafi'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'cep': cep,
      'logradouro': logradouro,
      'complemento': complemento,
      'unidade': unidade,
      'bairro': bairro,
      'localidade': localidade,
      'estado': estado,
      'uf': uf,
    };
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }
}
