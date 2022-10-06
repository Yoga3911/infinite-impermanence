// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

// 🌎 Project imports:
 import '../../../../../common/style.dart';
 import '../../../controllers/keuangan_analisis_controller.dart';

class ViewAngsuran extends StatelessWidget {
  ViewAngsuran({Key? key}) : super(key: key);

  final controller = Get.put(KeuanganAnalisisController());
  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: ListView(
        children: <Widget>[
          const SizedBox(
            height: 30,
          ),
          Text(
            'Angsuran Bank Lain',
            style: TextStyle(
              fontSize: 30,
              letterSpacing: 1,
              // make underline
              decoration: TextDecoration.combine([
                TextDecoration.underline,
              ]),
            ),
            textAlign: TextAlign.left,
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Expanded(
                child: FormBuilderTextField(
                  name: 'bunga_pinjaman_lain',
                  enabled: false,
                  controller: controller.bungaPerTahunLain,
                  decoration: InputDecoration(
                    labelText: 'Bunga/tahun %',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    suffixIcon: const Icon(FontAwesomeIcons.percent),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: FormBuilderTextField(
                  name: 'tenor_a',
                  enabled: false,
                  controller: controller.angsuranPerBulanLainAtas,
                  decoration: InputDecoration(
                    labelText: 'Tenor A',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: const Icon(FontAwesomeIcons.calendarWeek),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const Expanded(
                child: Text(''),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: FormBuilderTextField(
                  controller: controller.angsuranPerBulanLainBawah,
                  name: 'tenor_b',
                  enabled: false,
                  decoration: InputDecoration(
                    labelText: 'Tenor B',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: const Icon(FontAwesomeIcons.calendarWeek),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          FormBuilderTextField(
            enabled: false,
            textAlign: TextAlign.center,
            controller: controller.totalBungaLainAtas,
            name: 'angsuran_pinjaman_lain_top',
            decoration: InputDecoration(
              labelText: 'Angsuran Dibayarkan A',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              alignLabelWithHint: true,
              prefixIcon: const Icon(FontAwesomeIcons.rupiahSign),
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(
            height: 20,
          ),
          FormBuilderTextField(
            controller: controller.totalBungaLainBawah,
            enabled: false,
            readOnly: true,
            textAlign: TextAlign.center,
            name: 'angsuran_pinjaman_lain_bottom',
            decoration: InputDecoration(
              labelText: 'Angsuran Dibayarkan B',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              prefixIcon: const Icon(FontAwesomeIcons.rupiahSign),
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(
            height: 20,
          ),

          const Divider(
            height: 50,
            thickness: 2,
            color: primaryColor,
          ),

          // ! Angsuran Pinjaman Kredit
          Text(
            'Angsuran BPD DIY',
            style: TextStyle(
              fontSize: 30,
              letterSpacing: 1,
              // make underline
              decoration: TextDecoration.combine([
                TextDecoration.underline,
              ]),
            ),
            textAlign: TextAlign.left,
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Expanded(
                child: FormBuilderTextField(
                  name: 'bunga_per_tahun_bpd',
                  enabled: false,
                  readOnly: true,
                  controller: controller.bungaPerTahun = TextEditingController(
                      text: data.inputKeuangan.bungaPerTahun.toString()),
                  decoration: InputDecoration(
                    labelText: 'Bunga/tahun %',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    suffixIcon: const Icon(FontAwesomeIcons.percent),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: FormBuilderTextField(
                  name: 'tenor_bpd',
                  readOnly: true,
                  enabled: false,
                  controller: controller.angsuranPerBulan =
                      TextEditingController(
                    text: data.inputKeuangan.angsuran.toString(),
                  ),
                  decoration: InputDecoration(
                      labelText: 'Tenor',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: const Icon(FontAwesomeIcons.calendarWeek)),
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Expanded(
                child: FormBuilderDropdown(
                  decoration: InputDecoration(
                    labelText: 'Status',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  enabled: false,
                  initialValue: 'Efektif',
                  alignment: Alignment.center,
                  name: 'Choice Pinjaman Kredit',
                  items: const [
                    DropdownMenuItem(
                        value: 'Efektif',
                        child: Text(
                          'Efektif',
                          style: TextStyle(),
                        )),
                    DropdownMenuItem(
                      value: 'flat',
                      child: Text('Flat'),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                flex: 2,
                child: FormBuilderTextField(
                  name: 'Total Angsuran Kredit',
                  enabled: false,
                  controller: controller.totalBunga = MoneyMaskedTextController(
                      thousandSeparator: '.',
                      decimalSeparator: '',
                      precision: 0,
                      initialValue:
                          double.parse(data.inputKeuangan.angsuranRp)),
                  decoration: InputDecoration(
                    labelText: 'Angsuran Dibayarkan',
                    prefixIcon: const Icon(FontAwesomeIcons.rupiahSign),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),

          const Divider(
            height: 50,
            thickness: 2,
            color: primaryColor,
          ),

          // ! Hitung Flat / Efektif
          // Text(
          //   'Hitung Flat / Efektif',
          //   style: TextStyle(
          //     fontSize: 30,
          //     letterSpacing: 1,
          //     // make underline
          //     decoration: TextDecoration.combine([
          //       TextDecoration.underline,
          //     ]),
          //   ),
          //   textAlign: TextAlign.left,
          // ),
          // const SizedBox(
          //   height: 30,
          // ),
          // Row(
          //   children: [
          //     Expanded(
          //       child: FormBuilderTextField(
          //         name: 'Flat Initial',
          //         controller: controller.flatInitial,
          //         decoration: const InputDecoration(
          //           labelText: 'Flat Initial',
          //           border: OutlineInputBorder(),
          //         ),
          //       ),
          //     ),
          //     const SizedBox(
          //       width: 20,
          //     ),
          //     Expanded(
          //       child: FormBuilderTextField(
          //         controller: controller.efektifInitial,
          //         name: 'Efektif Initial',
          //         decoration: const InputDecoration(
          //           labelText: 'Efektif Initial',
          //           border: OutlineInputBorder(),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
          // const SizedBox(
          //   height: 30,
          // ),
          // FormBuilderTextField(
          //   name: 'Flat Perbulan',
          //   textAlign: TextAlign.center,
          //   enabled: false,
          //   style: const TextStyle(
          //     fontSize: 30,
          //     fontWeight: FontWeight.w600,
          //     letterSpacing: 1,
          //     color: primaryColor,
          //   ),
          //   controller: controller.totalFlatEfektif,
          //   decoration: const InputDecoration(
          //     labelText: 'Total Flat / Efektif',
          //     border: OutlineInputBorder(),
          //   ),
          //   keyboardType: TextInputType.number,
          // ),
          // const SizedBox(
          //   height: 30,
          // ),
          // colorButton(
          //   context,
          //   'Hitung Flat / Efektif',
          //   () {
          //     controller.hitungFlatAndEfektif();
          //   },
          // ),
          // const SizedBox(
          //   height: 20,
          // ),
          // Text(
          //   'Total Flat / Efektif',
          //   style: TextStyle(
          //     fontSize: 30,
          //     letterSpacing: 1,
          //     // make underline
          //     decoration: TextDecoration.combine([
          //       TextDecoration.underline,
          //     ]),
          //   ),
          //   textAlign: TextAlign.left,
          // ),
          // const SizedBox(
          //   height: 60,
          // ),
          // FormBuilderTextField(
          //   name: 'Total Efektif',
          //   controller: controller.totalEfektif,
          //   textAlign: TextAlign.center,
          //   enabled: false,
          //   style: const TextStyle(
          //     fontSize: 30,
          //     fontWeight: FontWeight.w600,
          //     letterSpacing: 1,
          //     color: primaryColor,
          //   ),
          //   decoration: const InputDecoration(
          //     labelText: 'Total Efektif',
          //     border: OutlineInputBorder(),
          //     prefixIcon: Icon(FontAwesomeIcons.rupiahSign),
          //   ),
          //   keyboardType: TextInputType.number,
          // ),
          // const SizedBox(
          //   height: 40,
          // ),
          // FormBuilderTextField(
          //   name: 'Total Flat',
          //   controller: controller.totalFlat,
          //   textAlign: TextAlign.center,
          //   enabled: false,
          //   style: const TextStyle(
          //     fontSize: 30,
          //     fontWeight: FontWeight.w600,
          //     letterSpacing: 1,
          //     color: primaryColor,
          //   ),
          //   decoration: const InputDecoration(
          //     labelText: 'Total Flat',
          //     border: OutlineInputBorder(),
          //     prefixIcon: Icon(FontAwesomeIcons.rupiahSign),
          //   ),
          //   keyboardType: TextInputType.number,
          // ),
          // const SizedBox(
          //   height: 20,
          // ),
          // colorButton(
          //   context,
          //   'Hitung',
          //   () {
          //     controller.hitungTotalFlatEfektif();
          //   },
          // ),
          // const Divider(
          //   height: 100,
          //   thickness: 2,
          //   color: primaryColor,
          // ),
          // ! Hitung Flat / Efektif
          Text(
            'Total Angsuran',
            style: TextStyle(
              fontSize: 30,
              letterSpacing: 1,
              // make underline
              decoration: TextDecoration.combine([
                TextDecoration.underline,
              ]),
            ),
            textAlign: TextAlign.left,
          ),
          const SizedBox(
            height: 30,
          ),
          FormBuilderTextField(
            name: 'total_angsuran',
            controller: controller.totalAngsuran = MoneyMaskedTextController(
                thousandSeparator: '.',
                decimalSeparator: '',
                precision: 0,
                initialValue: double.parse(
                  data.inputKeuangan.angsuranRp,
                )),
            textAlign: TextAlign.center,
            enabled: false,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
              color: primaryColor,
            ),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              prefixIcon: const Icon(FontAwesomeIcons.rupiahSign),
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(
            height: 20,
          ),

          // colorButton(
          //   context,
          //   'Hitung',
          //   () {
          //     controller.hitungTotalAngsuran();
          //   },
          // ),
        ],
      ),
    );
  }
}
