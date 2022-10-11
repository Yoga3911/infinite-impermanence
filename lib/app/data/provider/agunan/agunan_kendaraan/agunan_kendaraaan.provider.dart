import 'dart:convert';

import 'package:akm/app/common/constant.dart';
import 'package:akm/app/models/debitur_model/insight_debitur.model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class AgunanKendaraanProvider {
  final httpClient = http.Client();

  Future<List<FormKendaraan>> fetchAgunanKendaraan(int id) async {
    try {
      final response = await httpClient.get(
        Uri.parse('${baseUrl}agunan/$id/agunan-kendaraan/'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );
      debugPrint(response.body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        debugPrint(data.toString());
        return (data as List).map((e) => FormKendaraan.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<FormKendaraan> saveFormAgunanKendaraan(int id, Map body) async {
    try {
      final response = await httpClient.post(
        Uri.parse('${baseUrl}agunan/$id/agunan-kendaraan/'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(body),
      );
      debugPrint(response.body);

      if (response.statusCode == 201) {
        return FormKendaraan.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  // TODO: Add Agunan Kendaraan Edit Feature

  // TODO: Add Agunan Kendaraan Delete Feature
}
