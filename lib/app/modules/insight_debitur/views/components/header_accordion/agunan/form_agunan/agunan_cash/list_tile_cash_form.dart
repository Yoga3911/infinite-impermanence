// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

// 🌎 Project imports:
import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/agunan_pilih/controllers/agunan_pilih_controller.dart';
import 'package:akm/app/modules/insight_debitur/controllers/insight_debitur_controller.dart';
import 'package:akm/app/routes/app_pages.dart';

class CashForm extends StatelessWidget {
  CashForm({
    Key? key,
  }) : super(key: key);

  final controller = Get.put(InsightDebiturController());
  final selectedAgunanController = Get.put(AgunanPilihController());

  @override
  Widget build(BuildContext context) {
    return GFListTile(
      color: secondaryColor,
      title: const Text(
        'Agunan Cash',
        style: TextStyle(
          color: primaryColor,
          fontSize: 25,
          fontWeight: FontWeight.w500,
        ),
      ),
      avatar: const GFAvatar(
        backgroundColor: primaryColor,
        child: Icon(
          FontAwesomeIcons.fileInvoiceDollar,
          color: secondaryColor,
        ),
      ),
      icon: controller.listAgunan.any((element) => element.kodeAgunan == 5)
          ? GFButton(
              onPressed: () {
                Get.toNamed(Routes.LIST_AGUNAN_CASH,
                    arguments: controller.listAgunan.elementAt(controller
                        .listAgunan
                        .indexWhere((element) => element.kodeAgunan == 5)));
              },
              text: "READY",
              buttonBoxShadow: true,
              color: GFColors.SUCCESS,
            )
          : GFButton(
              onPressed: () {
                Get.snackbar(
                  "Error",
                  "Jenis Agunan ini tidak dipilih",
                  snackPosition: SnackPosition.TOP,
                  backgroundColor: GFColors.DANGER,
                  colorText: GFColors.WHITE,
                );
              },
              text: "N/A",
              buttonBoxShadow: true,
              color: GFColors.DANGER,
            ),
    );
  }
}
