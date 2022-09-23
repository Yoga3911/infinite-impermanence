import 'package:akm/app/models/debtor.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../../routes/app_pages.dart';

class PrintingTile extends StatelessWidget {
  const PrintingTile({
    Key? key,
    required this.debtor,
  }) : super(key: key);

  final Debtor debtor;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: const Text('Berkas untuk di print'),
      initiallyExpanded: true,
      leading: const Icon(
        FontAwesomeIcons.print,
      ),
      children: [
        ListTile(
          title: const Text('Print Keuangan'),
          onTap: () {
            debtor.analisaKeuangan == null
                ? Get.snackbar(
                    'Gagal',
                    'Data Analisa Keuangan Belum Lengkap',
                    backgroundColor: Colors.red,
                    colorText: Colors.white,
                  )
                : Get.toNamed(
                    Routes.KEUANGAN_PRINT,
                    arguments: debtor,
                  );
          },
          trailing: debtor.analisaKeuangan == null
              ? const Text('Not Ready 😭')
              : const Text('Ready 👍'),
        ),
        ListTile(
          title: const Text('Print Bisnis'),
          onTap: () {
            debtor.analisaBisnis == null
                ? Get.snackbar(
                    'Gagal',
                    'Data Analisa Bisnis Belum Lengkap',
                    backgroundColor: Colors.red,
                    colorText: Colors.white,
                  )
                : Get.toNamed(
                    Routes.BISNIS_PRINT,
                    arguments: debtor,
                  );
          },
          trailing: debtor.analisaKeuangan == null
              ? const Text('Not Ready 😭')
              : const Text('Ready 👍'),
        ),
        ListTile(
          title: const Text('Print Karakter'),
          onTap: () {
            debtor.analisaKarakter == null
                ? Get.snackbar(
                    'Gagal',
                    'Data Analisa Karakter Belum Lengkap',
                    backgroundColor: Colors.red,
                    colorText: Colors.white,
                  )
                : Get.toNamed(
                    Routes.KARAKTER_PRINT,
                    arguments: debtor,
                  );
          },
          trailing: debtor.analisaKarakter == null
              ? const Text('Not Ready 😭')
              : const Text('Ready 👍'),
        ),
      ],
    );
  }
}
