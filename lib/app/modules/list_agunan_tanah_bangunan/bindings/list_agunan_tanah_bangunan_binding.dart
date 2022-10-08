import 'package:get/get.dart';

import '../controllers/list_agunan_tanah_bangunan_controller.dart';

class ListAgunanTanahBangunanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListAgunanTanahBangunanController>(
      () => ListAgunanTanahBangunanController(),
    );
  }
}
