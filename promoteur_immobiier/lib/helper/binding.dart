import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:promoteur_immobiier/viewmodel/AppartementViewModel.dart';
import 'package:promoteur_immobiier/viewmodel/authViewModel.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut(() => AppartementViewModel());
    Get.put(AppartementViewModel());
    Get.put(AuthViewModel());
  }
}
