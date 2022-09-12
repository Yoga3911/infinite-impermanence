import 'package:akm/app/models/debtor.dart';
import 'package:akm/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class InputKeuanganFixed extends StatelessWidget {
  InputKeuanganFixed({
    Key? key,
    required this.debtor,
  }) : super(key: key);

  final Debtor debtor;

  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('3. Input Keuangan'),
          // check if input keuangan is not null then give success icon else give error icon
          debtor.inputKeuangan != null
              ? const Icon(
                  FontAwesomeIcons.check,
                  color: Colors.green,
                )
              : const Icon(
                  FontAwesomeIcons.exclamation,
                  color: Colors.red,
                ),
        ],
      ),
      children: [
        debtor.inputRugiLaba == null
            ? Column(
                children: const [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Input Rugi Laba terlebih dahulu',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                ],
              )
            :
            // check if input keuangan is not null
            debtor.inputKeuangan != null
                ? const Text('data')
                : Row(
                    children: [
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: OutlinedButton.icon(
                          icon: const Icon(Icons.add),
                          label: const Text(
                            "Input Keuangan",
                            style: TextStyle(fontSize: 20),
                          ),
                          onPressed: () {
                            Get.toNamed(
                              Routes.INPUT_KEUANGAN,
                              arguments: debtor,
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                    ],
                  )
      ],
    );
  }
}
