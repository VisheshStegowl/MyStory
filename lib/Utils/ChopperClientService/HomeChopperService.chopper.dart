// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HomeChopperService.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$HomeChopperService extends HomeChopperService {
  _$HomeChopperService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = HomeChopperService;

  @override
  Future<Response<ReelMainModel>> homeScreenApi(
      {required Map<String, dynamic> queryParameters}) {
    final Uri $url = Uri.parse('allcategorieswithreels');
    final Map<String, dynamic> $params = queryParameters;
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<ReelMainModel, ReelMainModel>($request);
  }

  @override
  Future<Response<BannerModel>> bannerApi() {
    final Uri $url = Uri.parse('getbanner');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<BannerModel, BannerModel>($request);
  }
}
