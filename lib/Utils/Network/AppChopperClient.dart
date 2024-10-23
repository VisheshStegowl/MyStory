import 'package:chopper/chopper.dart';
import 'package:reelproject/Utils/ChopperClientService/HomeChopperService.dart';
import 'package:reelproject/Utils/Models/BannerModel.dart';
import 'package:reelproject/Utils/Models/GeneralErrorModel.dart';
import 'package:reelproject/Utils/Models/ReelMainModel.dart';
import 'Utils/Convertors/JsonToTypeConverter.dart';
import 'Utils/Interceptors/ApplyHeaderInterceptor.dart';
import 'Utils/Interceptors/RequestLogger.dart';
import 'Utils/Interceptors/ResponseLogger.dart';

class AppChopperClient {
  static final AppChopperClient _singleton = AppChopperClient._internal();

  factory AppChopperClient() {
    return _singleton;
  }

  AppChopperClient._internal() {
    createChopperClient();
  }
  ChopperClient? _client;

  T getChopperService<T extends ChopperService>() {
    return _client!.getService<T>();
  }

  void createChopperClient() {
    if (_client != null) {
      return;
    }
    _client = ChopperClient(
        baseUrl: Uri.parse(
          "https://mystories.live/api/",
        ),
        services: [
          HomeChopperService.create(),
        ],
        interceptors: [
          RequestLogger(),
          ResponseLogger(),
          ApplyHeaderInterceptor(),
        ],
        converter: const JsonToTypeConverter(
          jsonConvertorMap: {
            GeneralErrorModel: GeneralErrorModel.fromJson,
            ReelMainModel: ReelMainModel.fromJson,
            BannerModel: BannerModel.fromJson
          },
        ),
        errorConverter: const JsonToTypeConverter(
            jsonConvertorMap: {GeneralErrorModel: GeneralErrorModel.fromJson}));
  }
}
// flutter pub run build_runner build --delete-conflicting-outputs
// flutter packages pub run build_runner build --delete-conflicting-outputs
