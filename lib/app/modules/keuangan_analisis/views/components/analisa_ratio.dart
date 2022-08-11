import 'package:akm/app/widget/color_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

import 'package:akm/app/modules/keuangan_analisis/controllers/keuangan_analisis_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class AnalisaRatio extends StatelessWidget {
  AnalisaRatio({Key? key}) : super(key: key);

  final controller = Get.put(KeuanganAnalisisController());

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: const Text(
        'Click to reveal',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w200,
        ),
      ),
      children: [
        const SizedBox(
          height: 20,
        ),
        const Padding(
          padding: EdgeInsets.only(right: 250),
          child: Text(
            'a. Ratio profit',
            style: TextStyle(
              fontSize: 20,
              letterSpacing: 1,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Expanded(
              child: FormBuilderTextField(
                controller: controller.ratioProfitKini,
                name: 'Ratio Profit Kini',
                decoration: const InputDecoration(
                  labelText: 'Ratio Profit Kini',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: FormBuilderTextField(
                controller: controller.ratioProfitYAD,
                name: 'Ratio Profit YAD',
                decoration: const InputDecoration(
                  labelText: 'Ratio Profit YAD',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        colorButton(
          context,
          'Hitung Ratio Profit',
          () => controller.hitungRatioProfit(),
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          children: [
            const Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'b. ROE',
                  style: TextStyle(
                    fontSize: 20,
                    letterSpacing: 1,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: FormBuilderTextField(
                controller: controller.roeFixed,
                name: 'ROE',
                enabled: false,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Expanded(
              child: FormBuilderTextField(
                name: 'ROE Kini',
                decoration: const InputDecoration(
                  labelText: 'ROE Kini',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: FormBuilderTextField(
                name: 'ROE YAD',
                decoration: const InputDecoration(
                  labelText: 'ROE YAD',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'Baik 👍',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          children: [
            const Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'c. ROA',
                  style: TextStyle(
                    fontSize: 20,
                    letterSpacing: 1,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: FormBuilderTextField(
                name: 'ROA',
                controller: controller.roaFixed,
                enabled: false,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Expanded(
              child: FormBuilderTextField(
                name: 'ROA Kini',
                decoration: const InputDecoration(
                  labelText: 'ROA Kini',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: FormBuilderTextField(
                name: 'ROA YAD',
                decoration: const InputDecoration(
                  labelText: 'ROA YAD',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'Baik 👍',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          children: [
            const Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'd. DER',
                  style: TextStyle(
                    fontSize: 20,
                    letterSpacing: 1,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: FormBuilderTextField(
                name: 'DER',
                controller: controller.derFixed,
                enabled: false,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Expanded(
              child: FormBuilderTextField(
                name: 'DER Kini',
                decoration: const InputDecoration(
                  labelText: 'DER Kini',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: FormBuilderTextField(
                name: 'DER YAD',
                decoration: const InputDecoration(
                  labelText: 'DER YAD',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'Diterima 🤝',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          children: [
            const Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'e. DSC',
                  style: TextStyle(
                    fontSize: 20,
                    letterSpacing: 1,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: FormBuilderTextField(
                name: 'DSC',
                controller: controller.dscFixed,
                enabled: false,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Expanded(
              child: FormBuilderTextField(
                name: 'DSC Kini',
                decoration: const InputDecoration(
                  labelText: 'DSC Kini',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: FormBuilderTextField(
                name: 'DSC YAD',
                decoration: const InputDecoration(
                  labelText: 'DSC YAD',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'Diterima 🤝',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 60,
        ),
      ],
    );
  }
}
