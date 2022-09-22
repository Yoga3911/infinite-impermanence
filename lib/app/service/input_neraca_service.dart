// Import http

// 🎯 Dart imports:

// 🐦 Flutter imports:

// 🎯 Dart imports:
import 'dart:convert';

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

// 🌎 Project imports:
 import '../common/constant.dart';
 import '../common/style.dart';
 import '../models/neraca.dart';
 import '../modules/debitur_real/controllers/debitur_real_controller.dart';
 import '../routes/app_pages.dart';

class InputNeracaService {
  final httpClient = http.Client();

  // Create Input Neraca
  Future<InputNeraca> addInputNeraca(body) async {
    try {
      const apiUrl = '${baseUrl}input-neraca';
      final response = await httpClient.post(
        Uri.parse(apiUrl),
        body: jsonEncode(body),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      debugPrint('response: ${response.body}');

      if (response.statusCode == 201) {
        AwesomeDialog(
          context: Get.context!,
          dialogType: DialogType.success,
          animType: AnimType.bottomSlide,
          dialogBackgroundColor: primaryColor,
          titleTextStyle: GoogleFonts.poppins(
            color: secondaryColor,
            fontSize: 30,
            fontWeight: FontWeight.w500,
          ),
          descTextStyle: GoogleFonts.poppins(
            color: secondaryColor,
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
          title: 'Sukses',
          desc: 'Data berhasil ditambahkan',
          btnOkOnPress: () {
            Get.offAndToNamed(Routes.DEBITUR_LIST);
            // Then refresh the list
            Get.find<DebiturRealController>().fetchDebitur();
          },
        ).show();
      }

      return InputNeraca.fromJson(jsonDecode(response.body));
    } catch (e) {
      debugPrint('error: ${e.toString()}');

      AwesomeDialog(
        context: Get.context!,
        dialogBackgroundColor: primaryColor,
        titleTextStyle: GoogleFonts.poppins(
          color: secondaryColor,
          fontSize: 30,
          fontWeight: FontWeight.w500,
        ),
        descTextStyle: GoogleFonts.poppins(
          color: secondaryColor,
          fontSize: 20,
          fontWeight: FontWeight.w400,
        ),
        dialogType: DialogType.error,
        animType: AnimType.bottomSlide,
        title: 'Error',
        desc: 'Terjadi kesalahan',
        btnOkOnPress: () {},
      ).show();
      throw Exception('Failed to create post');
    }
  }

  Future<void> editInputNeraca(id, body) async {
    try {
      final apiUrl = '${baseUrl}input-neraca/$id';
      final response = await httpClient.put(
        Uri.parse(apiUrl),
        body: jsonEncode(body),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        AwesomeDialog(
          context: Get.context!,
          dialogType: DialogType.success,
          animType: AnimType.bottomSlide,
          dialogBackgroundColor: primaryColor,
          titleTextStyle: GoogleFonts.poppins(
            color: secondaryColor,
            fontSize: 30,
            fontWeight: FontWeight.w500,
          ),
          descTextStyle: GoogleFonts.poppins(
            color: secondaryColor,
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
          dismissOnTouchOutside: false,
          dismissOnBackKeyPress: false,
          title: 'Sukses',
          desc: 'Data berhasil diubah',
          btnOkOnPress: () {
            Get.back();
            // Then refresh the list
            Get.find<DebiturRealController>().fetchDebitur();
          },
        ).show();
      } else {
        AwesomeDialog(
          context: Get.context!,
          dialogBackgroundColor: primaryColor,
          titleTextStyle: GoogleFonts.poppins(
            color: secondaryColor,
            fontSize: 30,
            fontWeight: FontWeight.w500,
          ),
          descTextStyle: GoogleFonts.poppins(
            color: secondaryColor,
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
          dialogType: DialogType.error,
          animType: AnimType.bottomSlide,
          title: 'Error',
          desc: 'Terjadi kesalahan',
          btnOkOnPress: () {},
        ).show();
        throw Exception('Failed to load post');
      }
    } catch (e) {
      debugPrint('error: ${e.toString()}');
      throw Exception('Failed to create post');
    }
  }
}
