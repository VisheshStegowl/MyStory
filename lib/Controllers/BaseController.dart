import 'package:get/get.dart';

class BaseController extends GetxController {
  RxBool isLoading = false.obs;

  void loader(bool value) {
    isLoading.value = value;
    update();
  }


}
