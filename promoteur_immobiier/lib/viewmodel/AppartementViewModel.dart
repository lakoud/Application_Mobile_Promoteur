import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:promoteur_immobiier/model/AppartementModel.dart';
import 'package:promoteur_immobiier/services/EtrePropritaireService.dart';

class AppartementViewModel extends GetxController {
//loding
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);

  List<AppartementModel> get appartementModel => _appartementModel;
  List<AppartementModel> _appartementModel = [];

  AppartementViewModel() {
    getCategory();
  }
  getCategory() async {
    _loading.value = true;
    await EtrePropritaireServices().getAppartement().then((value) {
      for (int i = 0; i < value.length; i++) {
        _appartementModel.add(AppartementModel.fromJson(value[i].data()));
        //print(_appartementModel.length);
        //ba3d ma tkaml w tjib data mel firebase 5aliha false
        _loading.value = false;
      }
      update();
    });
  }
}
