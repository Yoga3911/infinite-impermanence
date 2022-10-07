import 'package:akm/app/data/provider/debitur/detail_debitur.provider.dart';
import 'package:akm/app/models/debitur_model/insight_debitur.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nekos/nekos.dart';

class InsightDebiturController extends GetxController
    with GetSingleTickerProviderStateMixin {
  // Initialize on Init and get debiturs details
  @override
  void onInit() {
    super.onInit();
    fetchOneDebitur(debiturId);
    // Define how many tabs you want to show
    tabController = TabController(length: 1, vsync: this);
  }

  @override
  void onClose() {
    super.onClose();
    tabController?.dispose();
  }

  // For carousel
  final List<String> imageList = [
    "https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg",
    "https://cdn.pixabay.com/photo/2017/12/13/00/23/christmas-3015776_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/19/10/55/christmas-market-4705877_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/22/04/18/x-mas-4711785__340.jpg",
    "https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg"
  ];

  // For tab Controller
  TabController? tabController;

  // For nekos api
  Future<String> img = Nekos().ngif();

  // Get debitur id from previous page
  final debiturId = Get.arguments;

  // Initialize map for insight debitur
  var insightDebitur = DebiturInsight().obs;

  // Variable for loading
  var isDataLoading = false.obs;

  // Fetch Debitur by id
  void fetchOneDebitur(int id) async {
    try {
      isDataLoading(true);
      InsightDebiturProvider().fetchDebiturById(debiturId).then((resp) {
        isDataLoading(false);
        insightDebitur(resp);
      }, onError: (err) {
        isDataLoading(false);
        Get.snackbar('Error', err.toString());
      });
    } catch (e) {
      isDataLoading(false);
      Get.snackbar('Error', e.toString());
    }
  }
}