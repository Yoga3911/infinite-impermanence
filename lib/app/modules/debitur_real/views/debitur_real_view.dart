// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_builder_extra_fields/form_builder_extra_fields.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

// 🌎 Project imports:
import '../../../common/provinsi_kabupaten.dart';
import '../../../common/style.dart';
import '../controllers/debitur_real_controller.dart';

class DebiturRealView extends StatelessWidget {
  DebiturRealView({Key? key}) : super(key: key);

  final controller = Get.put(DebiturRealController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Debitur'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            margin: const EdgeInsets.all(16),
            child: FormBuilder(
              autovalidateMode: AutovalidateMode.disabled,
              key: controller.formKey,
              // onChanged: () {
              //   controller.formKey.currentState!.save();
              //   debugPrint(controller.formKey.currentState!.value.toString());
              // },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: SvgPicture.asset(
                      'assets/images/debitur_real/farmer.svg',
                      height: 350,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.only(right: 300),
                    child: Text(
                      'Data Peminjam',
                      style: GoogleFonts.bangers(
                          fontSize: 20, color: Colors.grey[700]),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: FormBuilderTextField(
                          name: 'peminjam1',
                          controller: controller.peminjam1.value,
                          validator: FormBuilderValidators.required(),
                          decoration: const InputDecoration(
                            labelText: 'Peminjam 1',
                            labelStyle: TextStyle(fontSize: 18),
                            hintText: 'Masukkan Peminjam 1',
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: primaryColor),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        // child: FormBuilderTextField(
                        //   name: 'ktp1',
                        //   validator: FormBuilderValidators.compose([
                        //     FormBuilderValidators.required(),
                        //   ]),
                        //   controller: controller.ktp1.value,
                        //   decoration: const InputDecoration(
                        //     labelText: 'Asal KTP 1',
                        //     labelStyle: TextStyle(fontSize: 18),
                        //     hintText: 'Kota Yogyakarta',
                        //     focusedBorder: OutlineInputBorder(
                        //       borderSide: BorderSide(color: primaryColor),
                        //     ),
                        //     enabledBorder: OutlineInputBorder(
                        //       borderSide: BorderSide(color: Colors.grey),
                        //     ),
                        //   ),
                        // ),
                        child: FormBuilderSearchableDropdown<String>(
                          name: 'ktp1',
                          onChanged: (value) {
                            controller.ktp1.value.text = value!;
                          },
                          onSaved: (value) {
                            controller.ktp1.value.text = value!;
                          },
                          validator: FormBuilderValidators.required(),
                          items: allProvinsi,
                          popupProps:
                              const PopupProps.menu(showSearchBox: true),
                          dropdownSearchDecoration: const InputDecoration(
                            hintText: 'Search',
                            labelText: 'Search',
                          ),
                          filterFn: (provinsi, filter) => provinsi
                              .toLowerCase()
                              .contains(filter.toLowerCase()),
                          decoration: const InputDecoration(
                            labelText: 'Asal KTP 1',
                            labelStyle: TextStyle(fontSize: 18),
                            hintText: 'Asal KTP 1',
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: primaryColor),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: FormBuilderTextField(
                          name: 'peminjam2',
                          controller: controller.peminjam2.value,
                          decoration: const InputDecoration(
                            labelText: 'Peminjam 2',
                            labelStyle: TextStyle(fontSize: 18),
                            hintText: 'Masukkan Peminjam 2',
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: primaryColor),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        // child: FormBuilderTextField(
                        //   name: 'ktp2',
                        //   controller: controller.ktp2.value,
                        //   decoration: const InputDecoration(
                        //     labelText: 'Asal KTP 2',
                        //     labelStyle: TextStyle(fontSize: 18),
                        //     hintText: 'Kabupaten Sleman',
                        //     focusedBorder: OutlineInputBorder(
                        //       borderSide: BorderSide(color: primaryColor),
                        //     ),
                        //     enabledBorder: OutlineInputBorder(
                        //       borderSide: BorderSide(color: Colors.grey),
                        //     ),
                        //   ),
                        // ),
                        child: FormBuilderSearchableDropdown<String>(
                          name: 'ktp2',
                          onChanged: (value) {
                            controller.ktp2.value.text = value!;
                            debugPrint(value);
                          },
                          onSaved: (value) {
                            controller.ktp2.value.text = value!;
                            debugPrint(value);
                          },
                          validator: FormBuilderValidators.required(),
                          items: allProvinsi,
                          popupProps:
                              const PopupProps.menu(showSearchBox: true),
                          dropdownSearchDecoration: const InputDecoration(
                            hintText: 'Search',
                            labelText: 'Search',
                          ),
                          filterFn: (provinsi, filter) => provinsi
                              .toLowerCase()
                              .contains(filter.toLowerCase()),
                          decoration: const InputDecoration(
                            labelText: 'Asal KTP 1',
                            labelStyle: TextStyle(fontSize: 18),
                            hintText: 'Asal KTP 1',
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: primaryColor),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  Row(
                    children: [
                      Expanded(
                        child: FormBuilderTextField(
                          name: 'pemilik_agunan_1',
                          controller: controller.pemilikAgunan1.value,
                          decoration: const InputDecoration(
                            labelText: 'Pemilik Agunan 1',
                            labelStyle: TextStyle(fontSize: 18),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: primaryColor),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: FormBuilderTextField(
                          name: 'no_ktp1',
                          controller: controller.noKtp1.value,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            FormBuilderValidators.numeric(),
                            FormBuilderValidators.minLength(16,
                                errorText: 'Min 16 Karakter'),
                            FormBuilderValidators.maxLength(16,
                                errorText: 'Max 16 Karakter')
                          ]),
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'No Ktp',
                            labelStyle: TextStyle(fontSize: 18),
                            hintText: 'Masukkan No KTP',
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: primaryColor),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: FormBuilderTextField(
                          name: 'pemilik_agunan_2',
                          controller: controller.pemilikAgunan2.value,
                          decoration: const InputDecoration(
                            labelText: 'Pemilik Agunan 2',
                            labelStyle: TextStyle(fontSize: 18),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: primaryColor),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: FormBuilderTextField(
                          name: 'no_ktp2',
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.numeric(),
                            FormBuilderValidators.minLength(16,
                                errorText: 'Min 16 Karakter'),
                            FormBuilderValidators.maxLength(16,
                                errorText: 'Max 16 Karakter')
                          ]),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: controller.noKtp2.value,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'No Ktp',
                            labelStyle: TextStyle(fontSize: 18),
                            hintText: 'Masukkan No KTP',
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: primaryColor),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.only(right: 280),
                    child: Text(
                      'Alamat Peminjam',
                      style: GoogleFonts.bangers(
                          fontSize: 20, color: Colors.grey[700]),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Column(
                    children: [
                      FormBuilderTextField(
                        name: 'alamat_1',
                        controller: controller.alamat1.value,
                        keyboardType: TextInputType.multiline,
                        decoration: const InputDecoration(
                          alignLabelWithHint: true,
                          labelText: 'Alamat 1',
                          labelStyle: TextStyle(fontSize: 18),
                          hintText: 'Masukkan Alamat 1',
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: primaryColor),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                        maxLines: 2,
                      ),
                      const SizedBox(height: 16),
                      FormBuilderTextField(
                        name: 'alamat_2',
                        controller: controller.alamat2.value,
                        keyboardType: TextInputType.multiline,
                        decoration: const InputDecoration(
                          alignLabelWithHint: true,
                          labelText: 'Alamat 2',
                          labelStyle: TextStyle(fontSize: 18),
                          hintText: 'Masukkan Alamat 2',
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: primaryColor),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                        maxLines: 2,
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.only(right: 230),
                    child: Text(
                      'Data Pribadi Peminjam',
                      style: GoogleFonts.bangers(
                          fontSize: 20, color: Colors.grey[700]),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        // child: FormBuilderTextField(
                        //   name: 'tempat_lahir',
                        //   controller: controller.tempatLahir.value,
                        //   decoration: const InputDecoration(
                        //     labelText: 'Tempat Lahir',
                        //     labelStyle: TextStyle(fontSize: 18),
                        //     hintText: 'Masukkan Tempat Lahir',
                        //     focusedBorder: OutlineInputBorder(
                        //       borderSide: BorderSide(color: primaryColor),
                        //     ),
                        //     enabledBorder: OutlineInputBorder(
                        //       borderSide: BorderSide(color: Colors.grey),
                        //     ),
                        //   ),
                        // ),
                        child: FormBuilderSearchableDropdown<String>(
                          name: 'tempat_lahir',
                          onChanged: (value) {
                            controller.tempatLahir.value.text = value!;
                            debugPrint(value);
                          },
                          onSaved: (value) {
                            controller.tempatLahir.value.text = value!;
                            debugPrint(value);
                          },
                          validator: FormBuilderValidators.required(),
                          items: allProvinsi,
                          popupProps:
                              const PopupProps.menu(showSearchBox: true),
                          dropdownSearchDecoration: const InputDecoration(
                            hintText: 'Search',
                            labelText: 'Search',
                          ),
                          filterFn: (provinsi, filter) => provinsi
                              .toLowerCase()
                              .contains(filter.toLowerCase()),
                          decoration: const InputDecoration(
                            labelText: 'Tempat Lahir',
                            labelStyle: TextStyle(fontSize: 18),
                            hintText: 'Tempat Lahir',
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: primaryColor),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: FormBuilderDateTimePicker(
                          textAlign: TextAlign.center,
                          name: 'tanggal_lahir',
                          onChanged: (value) {
                            controller.tanggalLahir.value = value!;
                            debugPrint(value.toString());
                          },
                          errorFormatText: 'Format tanggal salah',
                          errorInvalidText: 'Tanggal tidak valid',
                          inputType: InputType.date,
                          decoration: const InputDecoration(
                            labelText: 'Tanggal Lahir',
                            labelStyle: TextStyle(fontSize: 18),
                            hintText: 'Masukkan Tanggal Lahir',
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: primaryColor),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                          ),
                          format: DateFormat('dd/MM/yyyy'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: FormBuilderTextField(
                          name: 'umur',
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: controller.umur.value,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            FormBuilderValidators.numeric(),
                            FormBuilderValidators.min(18,
                                errorText: 'Umur minimal 18 tahun'),
                            FormBuilderValidators.max(65,
                                errorText: 'Umur maksimal 65 tahun'),
                            FormBuilderValidators.maxLength(3,
                                errorText: 'Max 3 Karakter'),
                          ]),
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'Umur',
                            labelStyle: TextStyle(fontSize: 18),
                            hintText: 'Masukkan Umur',
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: primaryColor),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        // child: FormBuilderTextField(
                        //   name: 'status_keluarga',
                        //   controller: controller.statusKeluarga.value,
                        //   decoration: const InputDecoration(
                        //     labelText: 'Status Keluarga',
                        //     labelStyle: TextStyle(fontSize: 18),
                        //     hintText: 'Masukkan Status Keluarga',
                        //     focusedBorder: OutlineInputBorder(
                        //       borderSide: BorderSide(color: primaryColor),
                        //     ),
                        //     enabledBorder: OutlineInputBorder(
                        //       borderSide: BorderSide(color: Colors.grey),
                        //     ),
                        //   ),
                        // ),
                        child: FormBuilderDropdown(
                          name: 'status_keluarga',
                          decoration: const InputDecoration(
                            labelText: 'Status Keluarga',
                            labelStyle: TextStyle(fontSize: 18),
                            hintText: 'Masukkan Status Keluarga',
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: primaryColor),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                          ),
                          items: controller.statusList
                              .map((e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(e),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            controller.statusKeluargaInput.value =
                                value.toString();
                            debugPrint(value.toString());
                          },
                          onSaved: (value) {
                            controller.statusKeluargaInput.value =
                                value.toString();
                            debugPrint(value.toString());
                          },
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  FormBuilderTextField(
                    name: 'jumlah_tanggungan',
                    controller: controller.jumlahTanggungan.value,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.numeric(),
                      FormBuilderValidators.min(1,
                          errorText: 'Jumlah tanggungan minimal 1 orang'),
                      FormBuilderValidators.max(99,
                          errorText: 'Jumlah tanggungan maksimal 99 orang'),
                      FormBuilderValidators.maxLength(2,
                          errorText: 'Max 2 Karakter'),
                    ]),
                    decoration: const InputDecoration(
                      labelText: 'Jumlah Tanggungan',
                      labelStyle: TextStyle(fontSize: 18),
                      hintText: 'Masukkan Jumlah Tanggungan',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: primaryColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.only(right: 280),
                    child: Text(
                      'Usaha Peminjam',
                      style: GoogleFonts.bangers(
                          fontSize: 20, color: Colors.grey[700]),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: FormBuilderTextField(
                          name: 'lamanya_berusaha',
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            FormBuilderValidators.numeric(),
                            FormBuilderValidators.maxLength(2,
                                errorText: 'Impposibru'),
                          ]),
                          controller: controller.lamanyaBerusaha.value,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'Lamanya Berusaha',
                            labelStyle: TextStyle(fontSize: 18),
                            hintText: 'Masukkan Lamanya Berusaha',
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: primaryColor),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: FormBuilderTextField(
                          name: 'lokasi_usaha',
                          controller: controller.lokasiUsaha.value,
                          decoration: const InputDecoration(
                            labelText: 'Lokasi Usaha',
                            labelStyle: TextStyle(fontSize: 18),
                            hintText: 'Masukkan Lokasi Usaha',
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: primaryColor),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: FormBuilderDropdown(
                          decoration: const InputDecoration(
                            labelText: 'Jenis Usaha',
                            labelStyle: TextStyle(fontSize: 18),
                            border: OutlineInputBorder(),
                          ),
                          items: controller.jenisUsahaList.map((String value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          name: 'jenis_usaha',
                          onChanged: (value) {
                            controller.jenisUsahaInput.value = value.toString();
                            debugPrint(value.toString());
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: FormBuilderTextField(
                          name: 'bidang_usaha',
                          controller: controller.bidangUsaha.value,
                          decoration: const InputDecoration(
                            labelText: 'Bidang Usaha',
                            labelStyle: TextStyle(fontSize: 18),
                            hintText: 'Masukkan Bidang Usaha',
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: primaryColor),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.only(right: 250),
                    child: Text(
                      'Pendidikan Peminjam',
                      style: GoogleFonts.bangers(
                          fontSize: 20, color: Colors.grey[700]),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  const SizedBox(height: 10),
                  FormBuilderDropdown(
                    name: 'pendidikan',
                    onChanged: (value) {
                      controller.pendidikanInput.value = value.toString();
                      debugPrint(value.toString());
                    },
                    decoration: const InputDecoration(
                      labelText: 'Pendidikan',
                      labelStyle: TextStyle(fontSize: 18),
                      border: OutlineInputBorder(),
                    ),
                    items: controller.pendidikanList.map((String value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.only(right: 250),
                    child: Text(
                      'Pekerjaan Peminjam',
                      style: GoogleFonts.bangers(
                          fontSize: 20, color: Colors.grey[700]),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: FormBuilderTextField(
                          decoration: const InputDecoration(
                            labelText: 'Pekerjaan 1',
                            labelStyle: TextStyle(fontSize: 18),
                            border: OutlineInputBorder(),
                          ),
                          name: 'pekerjaan1',
                          controller: controller.pekerjaan1.value,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: FormBuilderTextField(
                          name: 'pekerjaan2',
                          controller: controller.pekerjaan2.value,
                          decoration: const InputDecoration(
                            labelText: 'Pekerjaan 2',
                            labelStyle: TextStyle(fontSize: 18),
                            hintText: 'Masukkan Pekerjaan 2',
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: primaryColor),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.only(right: 340),
                    child: Text(
                      'Lainnya',
                      style: GoogleFonts.bangers(
                          fontSize: 20, color: Colors.grey[700]),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  const SizedBox(height: 10),
                  FormBuilderTextField(
                    name: 'no_skpk',
                    controller: controller.noSkpk.value,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    // validator: FormBuilderValidators.compose(
                    //   [
                    //     FormBuilderValidators.numeric(),
                    //     FormBuilderValidators.minLength(10,
                    //         errorText: 'Min 10 Digit'),
                    //   ],
                    // ),
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'No SKPK',
                      labelStyle: TextStyle(fontSize: 18),
                      hintText: 'Masukkan No SKPK',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: primaryColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Current Date
                  FormBuilderDateTimePicker(
                    name: 'tgl_sekarang',
                    onChanged: (value) {
                      controller.tanggalSekarangInput.value = value!;
                      debugPrint(value.toString());
                    },
                    decoration: const InputDecoration(
                      labelText: 'Tanggal Sekarang',
                      labelStyle: TextStyle(fontSize: 18),
                      hintText: 'Masukkan Tanggal Sekarang',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: primaryColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                    inputType: InputType.date,
                    format: DateFormat('dd MMMM yyyy'),
                  ),
                  const SizedBox(height: 16),
                  FormBuilderTextField(
                    name: 'deskripsi_debitur',
                    controller: controller.deskripsiDebitur.value,
                    maxLines: 5,
                    decoration: const InputDecoration(
                      alignLabelWithHint: true,
                      labelText: 'Deskripsi Debitur',
                      labelStyle: TextStyle(fontSize: 18),
                      hintText: 'Masukkan Deskripsi Debitur',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: primaryColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            if (controller.formKey.currentState
                                    ?.saveAndValidate() ??
                                false) {
                              controller.saveDebtor();
                            } else {
                              debugPrint(controller.formKey.currentState?.value
                                  .toString());
                              debugPrint('validation failed');
                              AwesomeDialog(
                                context: context,
                                animType: AnimType.bottomSlide,
                                dialogType: DialogType.warning,
                                dialogBackgroundColor: primaryColor,
                                titleTextStyle: GoogleFonts.poppins(
                                  color: secondaryColor,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w500,
                                ),
                                descTextStyle: GoogleFonts.poppins(
                                  color: secondaryColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                ),
                                title: 'Warning',
                                desc: 'Form masih ada yang kosong',
                                btnOkText: 'Sunting Kembali',
                                btnOkIcon: Icons.edit,
                                btnOkOnPress: () {},
                                btnOkColor: blue300,
                              ).show();
                            }
                          },
                          child: const Text(
                            'Submit',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            controller.formKey.currentState?.reset();
                            AwesomeDialog(
                              context: context,
                              dialogBackgroundColor: primaryColor,
                              titleTextStyle: GoogleFonts.poppins(
                                color: secondaryColor,
                                fontSize: 30,
                                fontWeight: FontWeight.w500,
                              ),
                              descTextStyle: GoogleFonts.poppins(
                                color: secondaryColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                              ),
                              dialogType: DialogType.success,
                              animType: AnimType.scale,
                              title: 'Success',
                              desc: 'Form has been reset',
                              btnOkOnPress: () {
                                debugPrint('OnClcik');
                              },
                            ).show();
                          },
                          // color: Theme.of(context).colorScheme.secondary,
                          child: Text(
                            'Reset',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
