// ignore_for_file: unnecessary_overrides

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

// 🌎 Project imports:
 import '../../../service/analisa_bisnis_service.dart';

class BisnisAnalisisController extends GetxController {
  final formKey = GlobalKey<FormBuilderState>();

  var debiturId = TextEditingController();

  final omzetPenjualan = 0.obs;
  var omzetPenjualanKeterangan = TextEditingController();
  final hargaBersaing = 0.obs;
  var hargaBersaingKeterangan = TextEditingController();
  final persainganPasar = 0.obs;
  var persainganPasarKeterangan = TextEditingController();
  final lokasiPasar = 0.obs;
  var lokasiPasarKeterangan = TextEditingController();
  final kapasitasTerpasan = 0.obs;
  var kapasitasTerpasanKeterangan = TextEditingController();
  final rating = 0.obs;
  var ratingKeterangan = TextEditingController();
  var deskripsi = TextEditingController();

  final resultOmzet = TextEditingController();
  final resultHarga = TextEditingController();
  final resultPersaingan = TextEditingController();
  final resultLokasi = TextEditingController();
  final resultKapasitas = TextEditingController();
  final resultRating = TextEditingController();

  final sumCrrBisnis = TextEditingController();
  final resultCrrBisnis = 0.obs;

  void hasilHitungCrrBisnis() {
    final omzet = omzetPenjualan.value;
    final harga = hargaBersaing.value;
    final persaingan = persainganPasar.value;
    final lokasi = lokasiPasar.value;
    final kapasitas = kapasitasTerpasan.value;
    final ratingDebitur = rating.value;

    final sum = omzet + harga + persaingan + lokasi + kapasitas + ratingDebitur;
    final hasil = sum ~/ 6;

    resultOmzet.text = '$omzet';
    resultHarga.text = '$harga';
    resultPersaingan.text = '$persaingan';
    resultLokasi.text = '$lokasi';
    resultKapasitas.text = '$kapasitas';
    resultRating.text = '$ratingDebitur';

    sumCrrBisnis.text = '$sum';

    resultCrrBisnis.value = hasil;
  }

  void saveAnalisisBisnis() {
    final api = AnalisaBisnisService();

    final data = {
      "nilai_omzet": omzetPenjualan.value,
      "keterangan_omzet": omzetPenjualanKeterangan.text,
      "nilai_harga_bersaing": hargaBersaing.value,
      "keterangan_harga_bersaing": hargaBersaingKeterangan.text,
      "nilai_persaingan": persainganPasar.value,
      "keterangan_persaingan": persainganPasarKeterangan.text,
      "nilai_lokasi_usaha": lokasiPasar.value,
      "keterangan_lokasi_usaha": lokasiPasarKeterangan.text,
      "nilai_produktivitas": kapasitasTerpasan.value,
      "keterangan_produktivitas": kapasitasTerpasanKeterangan.text,
      "nilai_kualitas": rating.value,
      "keterangan_kualitas": ratingKeterangan.text,
      "deskripsi_bisnis": deskripsi.text,
      "debitur": debiturId.text,
      "hasil_crr_bisnis": resultCrrBisnis.value,
    };

    api.addAnalisaBisnis(data);

    update();
  }

  void editAnalisaBisnis() {}

  final omzetList = '''[
    {"value": 50, "label": "s/d 50%"},
    {"value": 60, "label": "s/d 60%"},
    {"value": 70, "label": "s/d 70%"},
    {"value": 80, "label": "s/d 80%"},
    {"value": 90, "label": "s/d 90%"}
  ]''';

  final hargaBersaingList = '''[
    {"value": 50, "label": "Lebih mahal dari pesaing"},
    {"value": 60, "label": "Sama dengan pesaing"},
    {"value": 70, "label": "Lebih murah sd 5%"},
    {"value": 80, "label": "Lebih murah 5 - 10%"},
    {"value": 90, "label": "Lebih murah diatas 10%"}
  ]''';

  final persainganPasarList = '''[
    {"value": 50, "label": "Sangat ketat"},
    {"value": 60, "label": "Ketat"},
    {"value": 70, "label": "Cukup ketat"},
    {"value": 80, "label": "Kurang ketat"},
    {"value": 90, "label": "Tidak ketat"}
  ]''';

  final lokasiPasarList = '''[
    {"value": 50, "label": "Tidak strategis"},
    {"value": 60, "label": "Kurang strategis"},
    {"value": 70, "label": "Cukup strategis"},
    {"value": 80, "label": "Strategis"},
    {"value": 90, "label": "Sangat strategis"}
  ]''';

  final kapasitasTerpasanList = '''[
    {"value": 50, "label": "s/d 50%"},
    {"value": 60, "label": "s/d 60%"},
    {"value": 70, "label": "s/d 70%"},
    {"value": 80, "label": "s/d 80%"},
    {"value": 90, "label": "Lebih dari s/d 80%"}
  ]''';

  final ratingList = '''[
    {"value": 50, "label": "Jelek"},
    {"value": 60, "label": "Kurang Baik"},
    {"value": 70, "label": "Cukup"},
    {"value": 80, "label": "Baik"},
    {"value": 90, "label": "Sangat Baik"}
  ]''';

  // Decode omzetList

  // void hasilUntukDeskripsiBisnis() {
  //   final omzetPenjualan =
  //       double.tryParse(this.omzetPenjualan.value.toString());
  //   final hargaBersaing = this.hargaBersaing.value;
  //   final persainganPasar = this.persainganPasar.value;
  //   final lokasiPasar = this.lokasiPasar.value;
  //   final kapasitasTerpasan =
  //       double.tryParse(this.kapasitasTerpasan.value.toString());
  //   final rating = double.tryParse(this.rating.value.toString());

  //   // Concatenate the string
  //   final harga = hargaBersaing == true
  //       ? 'sama dengan pesaing sejenis '
  //       : 'tidak sama dengan pesaing sejenis ';

  //   final lokasi = lokasiPasar == true
  //       ? 'lokasi mudah dijangkau pelanggan '
  //       : 'lokasi tidak mudah dijangkau pelanggan ';

  //   final persaingan = (persainganPasar == 'Sangat Ketat')
  //       ? 'usaha sejenis di sekitar sangat banyak saingan'
  //       : (persainganPasar == 'Cukup Ketat')
  //           ? 'usaha sejenis di sekitar sudah banyak saingan '
  //           : (persainganPasar == 'Ketat')
  //               ? 'usaha sejenis di sekitar ada sedikit saingan '
  //               : (persainganPasar == 'Tidak Ketat')
  //                   ? 'usaha sejenis di sekitar belum banyak '
  //                   : (persainganPasar == 'Sangat Tidak Ketat')
  //                       ? 'usaha sejenis di sekitar masih sepi dan hampir tidak ada saingan '
  //                       : ' ';

  //   final omset = (omzetPenjualan == 100.0)
  //       ? 'Omzet Penjualan sangat fantastis '
  //       : (omzetPenjualan! >= 80.0 && omzetPenjualan <= 99.0)
  //           ? 'Omzet Selalu berada diatas 80% dari target '
  //           : (omzetPenjualan >= 60.0 && omzetPenjualan < 80.0)
  //               ? 'Omzet Selalu berada diatas 60% dari target '
  //               : (omzetPenjualan >= 40.0 && omzetPenjualan < 60.0)
  //                   ? 'Omzet Selalu berada diatas 40% dari target '
  //                   : (omzetPenjualan >= 20.0 && omzetPenjualan < 40.0)
  //                       ? 'Omzet Selalu berada diatas 20% dari target '
  //                       : (omzetPenjualan >= 0.0 && omzetPenjualan < 20.0)
  //                           ? 'Omzet Penjualan dibawah 20% dari target '
  //                           : ' ';

  //   final terpasan = (kapasitasTerpasan == 100.0)
  //       ? 'Kapasitas terpasang sangat besar '
  //       : (kapasitasTerpasan! >= 80.0 && kapasitasTerpasan <= 99.0)
  //           ? 'Kapasitas terpasang sekitar 80% dari target '
  //           : (kapasitasTerpasan >= 60.0 && kapasitasTerpasan < 80.0)
  //               ? 'Kapasitas terpasang sekitar 60% dari target '
  //               : (kapasitasTerpasan >= 40.0 && kapasitasTerpasan < 60.0)
  //                   ? 'Kapasitas terpasang sekitar 40% dari target '
  //                   : (kapasitasTerpasan >= 20.0 && kapasitasTerpasan < 40.0)
  //                       ? 'Kapasitas terpasang sekitar 20% dari target '
  //                       : (kapasitasTerpasan >= 0.0 && kapasitasTerpasan < 20.0)
  //                           ? 'Kapasitas terpasang sangatlah kecil '
  //                           : ' ';

  //   final bintang = (rating == 5.0)
  //       ? 'Sangat Bagus '
  //       : (rating! == 4.0)
  //           ? 'Bagus '
  //           : (rating == 3.0)
  //               ? 'Cukup Bagus '
  //               : (rating == 2.0)
  //                   ? 'Kurang Bagus '
  //                   : (rating == 1.0)
  //                       ? 'Sangat Kurang Bagus '
  //                       : '';

  //   deskripsi.text =
  //       '$omset, harga yang ditawarkan kepada pelanggan $harga, persaingan $persaingan, $lokasi. \n\n'
  //       'Debitur ini mendapatkan hasil yang $bintang. \n\n'
  //       'Memungkinkan debitur untuk menjalankan usaha sejenis dengan  $terpasan.';
  // }
}
