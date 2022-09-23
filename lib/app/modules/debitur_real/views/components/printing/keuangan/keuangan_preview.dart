// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
// intl
import 'package:intl/intl.dart';

// 🌎 Project imports:
import 'keuangan_export.dart';

class KeuanganPreview extends StatelessWidget {
  KeuanganPreview({Key? key}) : super(key: key);

  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Analisa Keuangan: ${data.peminjam1}'),
        centerTitle: true,
      ),
      body: PdfPreview(
        dynamicLayout: true,
        canDebug: false,
        initialPageFormat: PdfPageFormat.a4,
        onPrinted: (context) => {
          Get.snackbar(
            'Berhasil',
            'Berhasil mencetak',
            snackPosition: SnackPosition.top,
            backgroundColor: Colors.green,
            colorText: Colors.white,
          )
        },
        pdfFileName: // date
            '${DateFormat('dd-MM-yy').format(DateTime.now())}_KEUANGAN_${data.peminjam1}.pdf',
        onShared: (context) {
          Get.snackbar(
            'Berhasil',
            'File berhasil dibagikan',
            snackPosition: SnackPosition.top,
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
        },
        build: (context) => makeAnalisaKeuanganPdf(data),
      ),
    );
  }
}
