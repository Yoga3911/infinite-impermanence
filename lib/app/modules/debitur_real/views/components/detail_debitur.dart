// ignore_for_file: unnecessary_const

// 🐦 Flutter imports:
import 'package:akm/app/modules/debitur_real/views/components/data_pribadi.dart';
import 'package:akm/app/modules/debitur_real/views/components/neraca.dart';
import 'package:akm/app/modules/debitur_real/views/components/rugi_laba.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
import 'package:akm/app/common/style.dart';
import 'package:akm/app/models/debtor.dart';
import 'package:akm/app/modules/debitur_real/controllers/debitur_real_controller.dart';

class DetailDebitur extends StatelessWidget {
  DetailDebitur({
    Key? key,
    required this.debtor,
  }) : super(key: key);

  final Debtor debtor;

  final controller = Get.put(DebiturRealController());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: secondaryColor,
      child: Obx(
        () => controller.loadingFetch.value
            ? const SizedBox()
            : ExpansionTile(
                title: const Text('Detail Debitur'),
                children: [
                  // Detail Debitur
                  DataPribadi(debtor: debtor),
                  // Analisa Kuantitatif
                  ExpansionTile(
                    title: const Text('Analisa Kuantitatif'),
                    leading: const Icon(
                      Icons.attach_money,
                    ),
                    children: [
                      // Neraca
                      Neraca(debtor: debtor),
                      // Rugi Laba
                      // check if neraca is empty
                      RugiLaba(debtor: debtor)
                    ],
                  )
                ],
              ),
      ),
    );
  }
}
