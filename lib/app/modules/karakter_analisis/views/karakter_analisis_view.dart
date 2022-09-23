// ignore_for_file: avoid_print

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

// 🌎 Project imports:
import '../controllers/karakter_analisis_controller.dart';
import 'components/hitung_crr.dart';

// 🌎 Project imports:
 import '../../../common/style.dart';

class KarakterAnalisisView extends GetView<KarakterAnalisisController> {
  KarakterAnalisisView({Key? key}) : super(key: key);

  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: primaryColor.withOpacity(0.3),
        title: const Text(
          "Karakter Analisis",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 120 + MediaQuery.of(context).padding.top,
              child: Stack(
                children: [
                  ClipPath(
                    clipper: WaveClipperTwo(),
                    child: Container(
                      height: 220,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          // image: AssetImage('assets/image/gradient/15.png'),
                          image: NetworkImage(
                            "https://wallpaperaccess.com/full/1601031.jpg",
                          ),
                        ),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            color: primaryColor.withOpacity(0.85),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SafeArea(
                    child: Container(
                      padding: const EdgeInsets.only(
                        left: 20.0,
                        right: 20.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                            height: 12.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
              child: Obx(
                () => FormBuilder(
                  key: controller.formKey,
                  onChanged: () {
                    controller.formKey.currentState!.save();
                    debugPrint(
                        controller.formKey.currentState!.value.toString());
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Data Analisa Karakter',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w200,
                          letterSpacing: 1,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Berikut beberapa parameter yang harus diinputkan untuk mengetahui karakter debitur.',
                        style: TextStyle(
                          color: Colors.grey,
                          overflow: TextOverflow.fade,
                          letterSpacing: 1,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Visibility(
                        visible: false,
                        child: FormBuilderTextField(
                          name: 'debiturId',
                          controller: controller.debiturId =
                              TextEditingController(
                            text: data.id.toString(),
                          ),
                        ),
                      ),
                      FormBuilderTextField(
                        enabled: false,
                        name: 'nilai_umur',
                        controller: controller.nilaiUmur =
                            TextEditingController(
                          text: data.umur.toString(),
                        ),
                        decoration: const InputDecoration(
                          labelText: 'Umur',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      FormBuilderDropdown(
                        enabled: false,
                        name: 'pendidikan',
                        initialValue: data.pendidikan,
                        onChanged: (value) {
                          controller.pendidikanInput.value = value.toString();
                        },
                        onSaved: (value) {
                          controller.pendidikanInput.value = value.toString();
                        },
                        decoration: const InputDecoration(
                          labelText: 'Pendidikan',
                          labelStyle: TextStyle(fontSize: 18),
                          border: OutlineInputBorder(),
                        ),
                        items: controller.pendidikanList
                            .map(
                              (element) => DropdownMenuItem(
                                value: element,
                                child: Text(element),
                              ),
                            )
                            .toList(),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      FormBuilderTextField(
                        name: 'lamanya_berusaha',
                        enabled: false,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.numeric(),
                          FormBuilderValidators.maxLength(2,
                              errorText: 'Impposibru'),
                        ]),
                        controller: controller.lamanyaBerusaha =
                            TextEditingController(
                          text: data.lamanyaBerusaha.toString(),
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'Lamanya Berusaha',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      FormBuilderSlider(
                        divisions: 19,
                        initialValue: 0,
                        min: 0,
                        max: 95,
                        onChanged: (double? value) {
                          controller.uletDalamBisnis.value = value!;
                        },
                        name: 'ulet',
                        decoration: InputDecoration(
                          labelText: 'Ulet Dalam Bisnis',
                          labelStyle: const TextStyle(fontSize: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      FormBuilderTextField(
                        name: 'keterangan_ulet',
                        enabled: false,
                        maxLines: 3,
                        textAlign: TextAlign.center,
                        controller: controller.keteranganUletDalamBisnis =
                            TextEditingController(
                          text: controller.uletDalamBisnis.value == 95
                              ? 'Sangat ulet dalam mengelola usahanya dan memiliki banyak langganan'
                              : controller.uletDalamBisnis.value >= 75 &&
                                      controller.uletDalamBisnis.value < 95
                                  ? 'Cukup ulet dalam mengelola usahanya dan memiliki langganan.'
                                  : controller.uletDalamBisnis.value >= 50 &&
                                          controller.uletDalamBisnis.value < 75
                                      ? 'Kurang ulet dalam mengelola usahanya dan memiliki sedikit langganan.'
                                      : controller.uletDalamBisnis.value < 50
                                          ? 'Tidak ulet dalam mengelola usahanya dan memiliki sedikit langganan.'
                                          : '',
                        ),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                      FormBuilderSlider(
                        divisions: 19,
                        initialValue: 0,
                        min: 0,
                        max: 95,
                        onChanged: (double? value) {
                          controller.kakuFleksibel.value = value!;
                          print(controller.kakuFleksibel.value);
                        },
                        name: 'kaku',
                        decoration: InputDecoration(
                          labelText: 'Kaku / Fleksibel',
                          labelStyle: const TextStyle(fontSize: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      FormBuilderTextField(
                        name: 'keterangan_kaku',
                        enabled: false,
                        maxLines: 3,
                        textAlign: TextAlign.center,
                        controller: controller.keteranganKakuFleksibel =
                            TextEditingController(
                          text: controller.kakuFleksibel.value == 95
                              ? 'Sangat fleksibel dalam berusaha dan menentukan harga'
                              : controller.kakuFleksibel.value >= 75 &&
                                      controller.kakuFleksibel.value < 95
                                  ? 'Fleksibel dalam berusaha dan menentukan harga.'
                                  : controller.kakuFleksibel.value >= 50 &&
                                          controller.kakuFleksibel.value < 75
                                      ? 'Kaku dalam berusaha dan menentukan harga.'
                                      : controller.kakuFleksibel.value < 50
                                          ? 'Sangat kaku dalam berusaha dan menentukan harga.'
                                          : '',
                        ),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                      FormBuilderSlider(
                        divisions: 19,
                        initialValue: 0,
                        min: 0,
                        max: 95,
                        onChanged: (double? value) {
                          controller.inovatifKreatif.value = value!;
                          print(controller.inovatifKreatif.value);
                        },
                        name: 'kreatif',
                        decoration: InputDecoration(
                          labelText: 'Kreatif / Inovatif',
                          labelStyle: const TextStyle(fontSize: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      FormBuilderTextField(
                        name: 'keterangan_inovatif',
                        enabled: false,
                        maxLines: 3,
                        textAlign: TextAlign.center,
                        controller: controller.keteranganInovatifKreatif =
                            TextEditingController(
                          text: controller.inovatifKreatif.value == 95
                              ? 'Sangat kreatif dan inovatif dalam mengembangkan usahanya'
                              : controller.inovatifKreatif.value >= 75 &&
                                      controller.inovatifKreatif.value < 95
                                  ? 'Kreatif dan selalu ingin mempunyai usaha kecil lebih lebih dari yang ada sekarang'
                                  : controller.inovatifKreatif.value >= 50 &&
                                          controller.inovatifKreatif.value < 75
                                      ? 'Kurang kreatif dan enggan mempunyai usaha kecil lebih dari yang ada sekarang'
                                      : controller.inovatifKreatif.value < 50
                                          ? 'Sangat tidak kreatif dan malah menyepelekan usahanya.'
                                          : '',
                        ),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                      FormBuilderSlider(
                        divisions: 19,
                        initialValue: 0,
                        min: 0,
                        max: 95,
                        onChanged: (double? value) {
                          controller.jujur.value = value!;
                          print(controller.jujur.value);
                        },
                        name: 'jujur',
                        decoration: InputDecoration(
                          labelText: 'Memiliki kejujuran dalam bisnis',
                          labelStyle: const TextStyle(fontSize: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      FormBuilderTextField(
                        name: 'keterangan_jujur',
                        enabled: false,
                        maxLines: 3,
                        textAlign: TextAlign.center,
                        controller: controller.keteranganJujur =
                            TextEditingController(
                          text: controller.jujur.value == 95
                              ? 'Sangat jujur dalam berbisnis'
                              : controller.jujur.value >= 75 &&
                                      controller.jujur.value < 100
                                  ? 'Cukup jujur dalam berbisnis'
                                  : controller.jujur.value >= 50 &&
                                          controller.jujur.value < 75
                                      ? 'Kurang jujur dalam berbisnis'
                                      : controller.jujur.value < 50
                                          ? 'Tidak jujur dalam berbisnis'
                                          : '',
                        ),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                      FormBuilderTextField(
                        keyboardType: TextInputType.multiline,
                        controller: controller.deskripsi,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                        ),
                        textAlign: TextAlign.start,
                        name: 'deskripsi_karakter',
                        decoration: const InputDecoration(
                          labelText: 'Deskripsi Bisnis Pemohon',
                          border: OutlineInputBorder(),
                          alignLabelWithHint: true,
                        ),
                        maxLines: 10,
                        textInputAction: TextInputAction.newline,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // colorButton(
                      //   context,
                      //   'Hitung CRR',
                      //   () {
                      //     // controller.hitungCrr();
                      //     // showBarModalBottomSheet(
                      //     //     backgroundColor: secondaryColor,
                      //     //     bounce: true,
                      //     //     context: context,
                      //     //     builder: (context) {
                      //     //       return HitungCrr();
                      //     //     });
                      //     if (controller.formKey.currentState
                      //             ?.saveAndValidate() ??
                      //         false) {
                      //       // controller.hitungCrr();
                      //       controller.result();
                      //       showBarModalBottomSheet(
                      //           backgroundColor: secondaryColor,
                      //           bounce: true,
                      //           context: context,
                      //           builder: (context) {
                      //             return HitungCrr();
                      //           });
                      //       // controller.hitungCrrUmur();
                      //       // controller.hitungCrrPendidikan();
                      //       // controller.hitungLamanyaBerusaha();
                      //       // controller.hitungUletDalamBisnis();
                      //       // controller.hitungKakuFleksibel();
                      //       // controller.hitungInovatifKreatif();
                      //       // controller.hitungJujur();

                      //     }
                      //   },
                      // ),
                      OutlinedButton.icon(
                        icon: const Icon(Icons.check),
                        label: const Text(
                          "Hitung CRR",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 20),
                        ),
                        style: OutlinedButton.styleFrom(
                            foregroundColor: secondaryColor,
                            backgroundColor: primaryColor,
                            shape: const StadiumBorder(),
                            maximumSize: const Size.fromWidth(double.infinity),
                            fixedSize: const Size(500, 50)),
                        onPressed: () {
                          if (controller.formKey.currentState
                                  ?.saveAndValidate() ??
                              false) {
                            // controller.hitungCrr();
                            controller.result();
                            showBarModalBottomSheet(
                              backgroundColor: secondaryColor,
                              bounce: true,
                              context: context,
                              builder: (context) {
                                return HitungCrr();
                              },
                            );
                          }
                        },
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
