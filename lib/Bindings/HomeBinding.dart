import 'package:get/get.dart';
import 'package:reelproject/Controllers/BaseController.dart';
import 'package:reelproject/Controllers/HomeController.dart';
import 'package:reelproject/Utils/ChopperClientService/HomeChopperService.dart';
import 'package:reelproject/Utils/Network/AppChopperClient.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(BaseController(), permanent: true);
    Get.lazyPut(() => AppChopperClient());
    Get.lazyPut(() => HomeController(
        homeChopperService: Get.find<AppChopperClient>()
            .getChopperService<HomeChopperService>()));
  }
}
