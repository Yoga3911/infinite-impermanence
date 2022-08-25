import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/input_keuangan/controllers/input_keuangan_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AsumsiKeuanganInput extends StatelessWidget {
  AsumsiKeuanganInput({Key? key}) : super(key: key);

  final controller = Get.put(InputKeuanganController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 10.0,
            ),
            Text(
              'Asumsi Keuangan',
              style: GoogleFonts.poppins(
                fontSize: 25.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            SvgPicture.asset(
              'assets/images/input_keuangan/asumsi.svg',
              height: 400,
            ),
            const SizedBox(
              height: 16.0,
            ),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: FormBuilderTextField(
                    name: 'pinjaman_lainnya',
                    keyboardType: TextInputType.number,
                    controller: controller.pinjamanLainnya,
                    decoration: InputDecoration(
                      labelText: 'Pinjaman Lainnya',
                      prefixIcon: const Icon(FontAwesomeIcons.rupiahSign),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: FormBuilderTextField(
                    name: 'angsuran_pinjman_lain',
                    controller: controller.angsuranPinjamanLainnya,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Angsuran Lain (bln)',
                      suffixIcon: const Icon(FontAwesomeIcons.calendar),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16.0,
            ),
            FormBuilderTextField(
              name: 'nilai_aset',
              controller: controller.nilaiAset,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Nilai Aset (exc: Rumah)',
                prefixIcon: const Icon(FontAwesomeIcons.rupiahSign),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(
              height: 25.0,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 300),
              child: Text(
                'Keuangan Kini',
                style: GoogleFonts.poppins(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            FormBuilderTextField(
              name: 'penjualan',
              controller: controller.penjualanKini,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                alignLabelWithHint: true,
                prefixIcon: const Icon(FontAwesomeIcons.rupiahSign),
                labelText: 'Penjualan per bulan',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            FormBuilderTextField(
              name: 'hpp',
              controller: controller.hpp,
              textAlign: TextAlign.right,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
                FormBuilderValidators.numeric(),
                FormBuilderValidators.max(100),
                FormBuilderValidators.min(20),
              ]),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                suffixIcon: const Icon(FontAwesomeIcons.percent),
                labelText: 'HPP per bulan',
                labelStyle: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
                floatingLabelAlignment: FloatingLabelAlignment.center,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            FormBuilderTextField(
              name: 'biaya_bahan',
              controller: controller.biayaBahanKini,
              readOnly: true,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                suffixIcon: ElevatedButton.icon(
                  icon: const Icon(Icons.calculate_outlined),
                  label: const Text("Hitung HPP"),
                  style: ElevatedButton.styleFrom(
                    primary: primaryColor,
                    shape: const StadiumBorder(),
                  ),
                  onPressed: () {
                    controller.hitungBiayaBahanHpp();
                    showToast(
                      'Biaya Bahan: Rp. ${controller.biayaBahanKini.text}',
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: secondaryColor,
                      ),
                      context: context,
                      animation: StyledToastAnimation.scale,
                      reverseAnimation: StyledToastAnimation.fade,
                      position: StyledToastPosition.center,
                      animDuration: const Duration(seconds: 1),
                      duration: const Duration(seconds: 4),
                      curve: Curves.elasticOut,
                      reverseCurve: Curves.linear,
                    );
                  },
                ),
                labelText: 'Biaya bahan HPP',
                prefixIcon: const Icon(FontAwesomeIcons.rupiahSign),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            FormBuilderTextField(
              name: 'biaya_upah',
              controller: controller.biayaUpahKini,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Biaya Upah',
                prefixIcon: const Icon(FontAwesomeIcons.rupiahSign),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            FormBuilderTextField(
              name: 'biaya_operasional',
              controller: controller.biayaOperasionalKini,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Biaya Operasional',
                prefixIcon: const Icon(FontAwesomeIcons.rupiahSign),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            FormBuilderTextField(
              name: 'biaya_hidup',
              controller: controller.biayaHidupKini,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Biaya Hidup',
                prefixIcon: const Icon(FontAwesomeIcons.rupiahSign),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(
              height: 25.0,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 360),
              child: Text(
                'Asumsi',
                style: GoogleFonts.poppins(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            FormBuilderTextField(
              readOnly: true,
              name: 'penjualan_asumsi',
              controller: controller.penjualanYad,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                alignLabelWithHint: true,
                prefixIcon: const Icon(FontAwesomeIcons.rupiahSign),
                labelText: 'Penjualan YAD',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            FormBuilderTextField(
              readOnly: true,
              name: 'biaya_bahan_asumsi',
              controller: controller.biayaBahanYad,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Biaya bahan HPP YAD',
                prefixIcon: const Icon(FontAwesomeIcons.rupiahSign),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            FormBuilderTextField(
              readOnly: true,
              name: 'biaya_upah_asumsi',
              controller: controller.biayaUpahYad,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Biaya Upah YAD',
                prefixIcon: const Icon(FontAwesomeIcons.rupiahSign),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            FormBuilderTextField(
              readOnly: true,
              name: 'biaya_operasional_asumsi',
              controller: controller.biayaOperasionalYad,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Biaya Operasional YAD',
                prefixIcon: const Icon(FontAwesomeIcons.rupiahSign),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            FormBuilderTextField(
              readOnly: true,
              name: 'biaya_hidup_asumsi',
              controller: controller.biayaHidupYad,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Biaya Hidup YAD',
                prefixIcon: const Icon(FontAwesomeIcons.rupiahSign),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            ElevatedButton.icon(
              icon: const Icon(Icons.thumb_up),
              label: const Text("Like"),
              style: ElevatedButton.styleFrom(
                primary: Colors.blueGrey,
                shape: const StadiumBorder(),
              ),
              onPressed: () {
                controller.hitungAsumsiPenjualan();
              },
            ),
          ],
        ),
      ),
    );
  }
}
