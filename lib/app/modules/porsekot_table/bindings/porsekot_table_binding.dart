// 📦 Package imports:
import 'package:get/get.dart';

// 🌎 Project imports:
import '../controllers/porsekot_table_controller.dart';

// 🌎 Project imports:
 import '../controllers/hitung_table/table1.dart';

class PorsekotTableBinding extends Binding {
  @override
  // void dependencies() {
  //   Get.lazyPut<PorsekotTableController>(
  //     () => PorsekotTableController(),
  //   );
  // }

  List<Bind> dependencies() {
    return [
      Bind.lazyPut<PorsekotTableController>(
        () => PorsekotTableController(),
      ),
      Bind.lazyPut<Table1>(
        () => Table1(),
      ),
    ];
  }
}
