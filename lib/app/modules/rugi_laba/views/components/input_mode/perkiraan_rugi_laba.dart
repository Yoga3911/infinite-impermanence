// 🐦 Flutter imports:
import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/rugi_laba/controllers/rugi_laba_controller.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

// 🌎 Project imports:

class PerkiraanLabaRugi extends StatelessWidget {
  PerkiraanLabaRugi({super.key});

  final controller = Get.put(RugiLabaController());

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      initiallyExpanded: true,
      title: const Text('Perkiraan Laba / Rugi'),
      children: [
        SizedBox(
          height: 650,
          child: DataTable2(
            columnSpacing: 12,
            horizontalMargin: 12,
            minWidth: 800,
            columns: const [
              DataColumn2(
                label: Text(
                  'Perkiraan penjualan :',
                  style: subtitle2,
                ),
                size: ColumnSize.L,
              ),
              DataColumn2(
                label: SizedBox.shrink(),
              ),
              DataColumn2(
                label: SizedBox.shrink(),
              ),
              DataColumn2(
                label: SizedBox.shrink(),
              ),
            ],
            rows: [
              DataRow2(
                cells: [
                  const DataCell(Text('Omzet penjualan rata - rata :')),
                  const DataCell(SizedBox.shrink()),
                  const DataCell(SizedBox.shrink()),
                  DataCell(
                    FormBuilderTextField(
                      name: 'omzet_penjualan_rata_rata',
                      controller: controller.omzetPerBulan,
                      decoration: const InputDecoration(
                        hintText: 'Input disini',
                      ),
                    ),
                  ),
                ],
              ),
              DataRow2(
                cells: [
                  const DataCell(Text('Persen harga pokok penjualan :')),
                  const DataCell(SizedBox.shrink()),
                  const DataCell(SizedBox.shrink()),
                  DataCell(
                    FormBuilderTextField(
                      name: 'persen_hpp',
                      controller: controller.persentaseHpp,
                      decoration: const InputDecoration(
                        hintText: 'Input disini',
                      ),
                    ),
                  ),
                ],
              ),
              DataRow2(
                cells: [
                  const DataCell(Text('Harga pokok penjualan')),
                  const DataCell(SizedBox.shrink()),
                  const DataCell(SizedBox.shrink()),
                  DataCell(
                    FormBuilderTextField(
                      enabled: false,
                      name: 'harga_pokok_penjualan',
                      controller: controller.hargaPokokPenjualan,
                      decoration: const InputDecoration(
                        hintText: 'Hasil disini',
                      ),
                    ),
                  ),
                ],
              ),
              DataRow2(
                cells: [
                  const DataCell(SizedBox.shrink()),
                  const DataCell(SizedBox.shrink()),
                  const DataCell(Text('Laba Kotor')),
                  DataCell(
                    FormBuilderTextField(
                      name: 'laba_kotor',
                      readOnly: true,
                      controller: controller.labaKotor,
                      decoration: InputDecoration(
                        hintText: 'Hasil',
                        suffixIcon: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            shape: const StadiumBorder(),
                          ),
                          onPressed: () {
                            controller.hitungHpp();
                            controller.sumLabaKotor();
                          },
                          child: const Text("Hit"),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const DataRow2(
                cells: [
                  DataCell(Text('Biaya :')),
                  DataCell(SizedBox.shrink()),
                  DataCell(SizedBox.shrink()),
                  DataCell(SizedBox.shrink()),
                ],
              ),
              DataRow2(
                cells: [
                  const DataCell(Text('1. Biaya Tenaga Kerja')),
                  const DataCell(SizedBox.shrink()),
                  DataCell(
                    FormBuilderTextField(
                      name: 'biaya_tenaga_kerja',
                      controller: controller.biayaTenagaKerja,
                      decoration: const InputDecoration(
                        hintText: 'Input disini',
                      ),
                    ),
                  ),
                  const DataCell(SizedBox.shrink()),
                ],
              ),
              DataRow2(
                cells: [
                  const DataCell(Text('2. Biaya Operasional')),
                  const DataCell(SizedBox.shrink()),
                  DataCell(
                    FormBuilderTextField(
                      name: 'biaya_operasional',
                      controller: controller.biayaOperasional,
                      decoration: const InputDecoration(
                        hintText: 'Input disini',
                      ),
                    ),
                  ),
                  const DataCell(SizedBox.shrink()),
                ],
              ),
              DataRow2(
                cells: [
                  const DataCell(Text('2. Biaya Lainnya')),
                  const DataCell(SizedBox.shrink()),
                  DataCell(
                    FormBuilderTextField(
                      name: 'biaya_lainnya',
                      controller: controller.biayaLainnya,
                      decoration: const InputDecoration(
                        hintText: 'Input disini',
                      ),
                    ),
                  ),
                  DataCell(
                    ElevatedButton.icon(
                      icon: const Icon(FontAwesomeIcons.calculator),
                      label: const Text("Hitung Total"),
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(500, 40),
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12), // <-- Radius
                        ),
                      ),
                      onPressed: () {
                        controller.perkiraanLaba();
                      },
                    ),
                  ),
                ],
              ),
              DataRow2(
                cells: [
                  const DataCell(SizedBox.shrink()),
                  const DataCell(Text('Total Biaya')),
                  const DataCell(SizedBox.shrink()),
                  DataCell(
                    FormBuilderTextField(
                      name: 'total_biaya',
                      readOnly: true,
                      controller: controller.totalBiaya,
                      decoration: const InputDecoration(
                        hintText: 'Hasil',
                      ),
                    ),
                  ),
                ],
              ),
              DataRow2(
                cells: [
                  const DataCell(SizedBox.shrink()),
                  const DataCell(Text('Laba sebelum pajak (EBIT)')),
                  const DataCell(SizedBox.shrink()),
                  DataCell(
                    FormBuilderTextField(
                      name: 'laba_sebelum_pajak',
                      readOnly: true,
                      controller: controller.labaSebelumPajak,
                      decoration: const InputDecoration(
                        hintText: 'Hasil',
                      ),
                    ),
                  ),
                ],
              ),
              DataRow2(
                cells: [
                  const DataCell(SizedBox.shrink()),
                  const DataCell(Text('Perkiraan Pajak')),
                  const DataCell(SizedBox.shrink()),
                  DataCell(
                    FormBuilderTextField(
                      name: 'perkiraan_pajak',
                      readOnly: true,
                      controller: controller.perkiraanPajak,
                      decoration: const InputDecoration(
                        hintText: 'Hasil',
                      ),
                    ),
                  ),
                ],
              ),
              DataRow2(
                cells: [
                  const DataCell(SizedBox.shrink()),
                  const DataCell(Text('Laba setelah pajak')),
                  const DataCell(SizedBox.shrink()),
                  DataCell(
                    FormBuilderTextField(
                      name: 'laba_setelah_pajak',
                      readOnly: true,
                      controller: controller.labaSetelahPajak,
                      decoration: const InputDecoration(
                        hintText: 'Hasil',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
