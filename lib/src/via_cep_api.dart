import 'package:dio/dio.dart';
import 'package:flutter_via_cep/src/via_cep_model.dart';

class ViaCepApi {
  Future<ViaCepModel> getCep(String cep) async {
    var url = "https://viacep.com.br/ws/$cep/json/";
    var response = await Dio().get(url);
    return ViaCepModel.fromJson(response.data);
  }
}
