import 'package:akm/app/modules/bisnis_analisis/controllers/bisnis_analisis_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

final controller = Get.put(BisnisAnalisisController());

Column keteranganOmzet() {
  return Column(
    children: [
      Center(
        child: Text(
          controller.omzetPenjualan.value == 90
              ? 'Score 90'
              : controller.omzetPenjualan.value == 80
                  ? 'Score 80'
                  : controller.omzetPenjualan.value == 70
                      ? 'Score 70'
                      : controller.omzetPenjualan.value == 60
                          ? 'Score 60'
                          : controller.omzetPenjualan.value == 50
                              ? 'Score 50'
                              : '',
          style: GoogleFonts.poppins(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      Visibility(
        visible: false,
        child: Column(
          children: [
            controller.omzetPenjualan.value == 90
                ? FormBuilderTextField(
                    name: 'keteranganOmzet',
                    controller: controller.omzetPenjualanKeterangan =
                        TextEditingController(text: 's/d 90%'),
                    onChanged: (value) {
                      controller.omzetPenjualanKeterangan.text = value!;
                    },
                    onSaved: (value) {
                      controller.omzetPenjualanKeterangan.text = value!;
                    },
                    onSubmitted: (value) {
                      controller.omzetPenjualanKeterangan.text = value!;
                    },
                  )
                : controller.omzetPenjualan.value == 80
                    ? FormBuilderTextField(
                        name: 'keteranganOmzet',
                        controller: controller.omzetPenjualanKeterangan =
                            TextEditingController(text: 's/d 80%'),
                      )
                    : controller.omzetPenjualan.value == 70
                        ? FormBuilderTextField(
                            name: 'keteranganOmzet',
                            controller: controller.omzetPenjualanKeterangan =
                                TextEditingController(text: 's/d 70%'),
                          )
                        : controller.omzetPenjualan.value == 60
                            ? FormBuilderTextField(
                                name: 'keteranganOmzet',
                                controller:
                                    controller.omzetPenjualanKeterangan =
                                        TextEditingController(text: 's/d 60%'),
                              )
                            : controller.omzetPenjualan.value == 50
                                ? FormBuilderTextField(
                                    name: 'keteranganOmzet',
                                    controller: controller
                                            .omzetPenjualanKeterangan =
                                        TextEditingController(text: 's/d 50%'),
                                  )
                                : FormBuilderTextField(
                                    name: 'keteranganOmzet',
                                    controller:
                                        controller.omzetPenjualanKeterangan =
                                            TextEditingController(text: ''),
                                  ),
          ],
        ),
      ),
    ],
  );
}
