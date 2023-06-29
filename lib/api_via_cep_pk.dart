library api_via_cep_pk;

import 'dart:convert';

import 'package:api_via_cep_pk/repositories/cep/cep_repository.dart';
import 'package:http/http.dart';

import 'models/cep.dart';

/// Api de Busca de Cep.
class CepService {
  /// Returns um objeto [cep].
  final CepRepository _cepRepository = CepRepository();
  Future<Cep> listCep(String cep) async{
    try {
      Response response = await _cepRepository.listCep(cep);
      Map<String, dynamic> json = jsonDecode(response.body);
      return Cep.fromJson(json);
    } catch (err) {
      throw Exception("Problema na busca de cep.");
    }
  }
}

