import 'package:chopper/chopper.dart';
import 'package:reelproject/Utils/Models/BannerModel.dart';
import 'package:reelproject/Utils/Models/ReelMainModel.dart';
part 'HomeChopperService.chopper.dart';

@ChopperApi()
abstract class HomeChopperService extends ChopperService {
  static HomeChopperService create({ChopperClient? client}) {
    return _$HomeChopperService(client);
  }

  @Get(path: 'allcategorieswithreels')
  // page=1&limit=5
  Future<Response<ReelMainModel>> homeScreenApi(
      {@QueryMap() required Map<String, dynamic> queryParameters});

  @Get(path: "getbanner")
  Future<Response<BannerModel>> bannerApi();
}
