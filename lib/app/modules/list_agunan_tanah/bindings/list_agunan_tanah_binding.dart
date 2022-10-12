// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
import '../controllers/list_agunan_tanah_controller.dart';

class ListAgunanTanahBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListAgunanTanahController>(
      () => ListAgunanTanahController(),
    );
  }
}
