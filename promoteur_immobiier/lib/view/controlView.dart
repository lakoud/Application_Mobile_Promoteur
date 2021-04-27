import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:promoteur_immobiier/view/auth/login.dart';
import 'package:promoteur_immobiier/view/screen/TestPageAccueil.dart';
import 'package:promoteur_immobiier/viewmodel/authViewModel.dart';

class ControlView extends GetWidget<AuthViewModel> {
  const ControlView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthViewModel>().user != null)
          ? HomePage()
          : LoginPage();
    });
  }
}
