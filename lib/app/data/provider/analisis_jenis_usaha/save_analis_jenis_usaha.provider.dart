// 🎯 Dart imports:
import 'dart:convert';

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:http/http.dart' as http;

// 🌎 Project imports:
import 'package:akm/app/common/constant.dart';
import 'package:akm/app/models/debitur_model/insight_debitur.model.dart';

class AnalisaJenisUsahaProvider {
  final httpClient = http.Client();

  Future<AnalisaJenisUsaha> deployAnalisaJenisUsaha(Map body) async {
    try {
      final response = await httpClient.post(
        Uri.parse('${baseUrl}analisa-jenis-usaha'),
        body: jsonEncode(body),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );
      debugPrint(response.body);
      if (response.statusCode == 201) {
        return AnalisaJenisUsaha.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to save data');
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<void> putAnalisaJenisUsaha(id, Map body) async {
    try {
      final response = await httpClient.put(
        Uri.parse('${baseUrl}analisa-jenis-usaha/$id'),
        body: jsonEncode(body),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );
      debugPrint(response.body);
      if (response.statusCode == 200) {
        debugPrint('It works');
      } else {
        throw Exception('Failed to save data');
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
