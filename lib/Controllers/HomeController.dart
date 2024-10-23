import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:reelproject/Controllers/BaseController.dart';
import 'package:reelproject/Utils/ChopperClientService/HomeChopperService.dart';
import 'package:reelproject/Utils/Models/BannerModel.dart';
import 'package:reelproject/Utils/Models/ReelMainModel.dart';

class HomeController extends BaseController {
  late HomeChopperService _homeChopperService;
  HomeController({required HomeChopperService homeChopperService}) {
    _homeChopperService = homeChopperService;
  }
  ScrollController scrollController = ScrollController();
  final List<String> videoUrls = [
    "https://assets.mixkit.co/videos/preview/mixkit-father-and-his-little-daughter-eating-marshmallows-in-nature-39765-large.mp4",
    "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
    "https://www.shutterstock.com/shutterstock/videos/3449060991/preview/stock-footage-beautiful-panorama-blue-sky-and-clouds-with-sun-and-daylight-natural-background-blue-sky-on-a.mp4",
    "https://www.shutterstock.com/shutterstock/videos/1072472474/preview/stock-footage-short-time-lapse-second-duration-fast-moving-clouds-cold-color-of-the-green-turquoise-sky.mp4",
    "https://www.shutterstock.com/shutterstock/videos/3507729939/preview/stock-footage--k-looped-animated-grunge-typography-collage-texture-overlay-background.mp4",
    "https://www.shutterstock.com/shutterstock/videos/3432772993/preview/stock-footage--k-looped-animated-grunge-texture-overlay-paper-collage-background.mp4"
  ];
  final List<String> imageUrls = [
    "https://stegowl.in/assets/one.png",
    "https://stegowl.in/assets/one.png",
    "https://stegowl.in/assets/one.png",
    "https://stegowl.in/assets/one.png",
    "https://stegowl.in/assets/one.png",
    "https://stegowl.in/assets/one.png",
  ];
  List<bool> a = [];
  int paginationInt = 1;
  int maxPages = 0;
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await getAllBanner();
    await reelDataApi();
    // scrollController.addListener(scrollListener);
  }

  @override
  Future<void> scrollListener() async {
    if (scrollController.hasClients) {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        if (paginationInt < maxPages) {
          paginationInt = paginationInt + 1;
          await reelDataApi();
        }
      }
    }
  }

  ReelMainModel? reelMainModel;
  BannerModel? bannerModel;
  Future<void> getAllBanner() async {
    try {
      final response = await _homeChopperService.bannerApi();
      if (response.isSuccessful) {
        bannerModel = response.body;
        update();
      }
    } catch (e) {
      log('', name: 'Banner Api', error: e.toString());
    }
  }

  Future<void> reelDataApi() async {
    loader(true);
    try {
      final queryParameters = {"page": 1, "limit": 20};
      final response = await _homeChopperService.homeScreenApi(
          queryParameters: queryParameters);
      if (response.isSuccessful) {
        reelMainModel = response.body;
        print(reelMainModel?.categories?.length);
        maxPages = response.body?.totalPages ?? 0;
        a.addAll(List.generate(
            response.body?.categories
                    ?.where((e) => e.reels!.isNotEmpty)
                    .toList()
                    .length ??
                0,
            (index) => false).toList());
        print("this is length ${a?.length}");
        update();
        loader(false);
      } else {
        loader(false);
      }
    } catch (e) {
      loader(false);
      log("", error: e.toString(), name: "Reel Data Api Error");
    }
  }

  void previewVideo(int index) {
    Future.delayed(const Duration(seconds: 5), () {
      a[index] = true;
      update();
    });
  }

  void noPreviewVideo(int index) {
    Future.delayed(const Duration(seconds: 5), () {
      a[index] = false;
      update();
    });
  }
}
