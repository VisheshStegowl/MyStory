// import 'dart:developer';
// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
//
// class AdService {
//   InterstitialAd? _interstitialAd;
//
//   final adUnitId = Platform.isAndroid
//       ? 'ca-app-pub-1401952134684535/7145153345'
//       : 'ca-app-pub-3940256099942544/4411468910';
//
//   /// Loads an interstitial ad.
//   void loadAd() async {
//     await InterstitialAd.load(
//         adUnitId: adUnitId,
//         request: const AdRequest(),
//         adLoadCallback: InterstitialAdLoadCallback(
//           // Called when an ad is successfully received.
//           onAdLoaded: (ad) {
//             ad.fullScreenContentCallback = FullScreenContentCallback(
//                 // Called when the ad showed the full screen content.
//                 onAdShowedFullScreenContent: (ad) {},
//                 // Called when an impression occurs on the ad.
//                 onAdImpression: (ad) {},
//                 // Called when the ad failed to show full screen content.
//                 onAdFailedToShowFullScreenContent: (ad, err) {
//                   // Dispose the ad here to free resources.
//                   ad.dispose();
//                 },
//                 // Called when the ad dismissed full screen content.
//                 onAdDismissedFullScreenContent: (ad) {
//                   // Dispose the ad here to free resources.
//                   ad.dispose();
//                 },
//                 // Called when a click is recorded for an ad.
//                 onAdClicked: (ad) {});
//
//             debugPrint('$ad loaded.');
//             // Keep a reference to the ad so you can show it later.
//             _interstitialAd = ad;
//             _interstitialAd?.show();
//           },
//           // Called when an ad request failed.
//           onAdFailedToLoad: (LoadAdError error) {
//             debugPrint('InterstitialAd failed to load: $error');
//           },
//         ));
//   }
//
//   void showAd() {
//     try {
//       log(_interstitialAd?.adUnitId ?? "null");
//       if (_interstitialAd != null) {
//         _interstitialAd?.show();
//       } else {
//         loadAd();
//       }
//     } catch (e) {
//       log(e.toString(), error: e.toString());
//     }
//   }
//
//   RewardedAd? _rewardedAd;
//   void createRewardedAd() {
//     try {
//       BaseController().loader(true);
//       RewardedAd.load(
//           adUnitId: "ca-app-pub-1401952134684535/7044756629",
//           request: const AdRequest(),
//           rewardedAdLoadCallback: RewardedAdLoadCallback(
//             onAdLoaded: (RewardedAd ad) {
//               print('$ad loaded. aaa');
//               _rewardedAd = ad;
//               // _numRewardedLoadAttempts = 0;
//             },
//             onAdFailedToLoad: (LoadAdError error) {
//               print('RewardedAd failed to load: $error');
//               _rewardedAd = null;
//               // _numRewardedLoadAttempts += 1;
//               // if (_numRewardedLoadAttempts < maxFailedLoadAttempts) {
//               //   _rewardedAd?.dispose();
//               //   createRewardedAd();
//               // }
//               _rewardedAd?.dispose();
//               createRewardedAd();
//             },
//           ));
//     } catch (e) {
//       BaseController().loader(false);
//       log(e.toString(), error: e.toString());
//     }
//   }
//
//   void showRewardedAd({required void Function() onClose}) {
//     if (_rewardedAd == null) {
//       print('Warning: attempt to show rewarded before loaded.');
//       return;
//     }
//     _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
//       onAdDismissedFullScreenContent: (RewardedAd ad) async {
//         onClose();
//         await Get.find<HomeController>().sendDailyUpdate(
//             isRewarded: AppConst.isRewarded.value + 1,
//             isSubscribed: Get.find<HomeController>()
//                     .dailyUpdateGetModel
//                     ?.data
//                     ?.isSubscribed ??
//                 0);
//         print('$ad onAdDismissedFullScreenContent.');
//         _rewardedAd = null;
//         ad.dispose();
//         createRewardedAd();
//       },
//     );
//     ;
//     if (Platform.isAndroid) {
//       // _rewardedAd!.setImmersiveMode(true);
//     }
//     _rewardedAd!.show(
//         onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {
//       print('$ad with reward $RewardItem(${reward.amount}, ${reward.type})');
//     });
//     _rewardedAd = null;
//   }
// }
//
// // class AdsService {
// //   disposeAds() {
// //     _interstitialAd?.dispose();
// //     bannerAd?.dispose();
// //   }
//
// //   int count = UserPreference.getInt(key: PrefKeys.adwatchCount) ?? 0;
//
// //   ///createing Interstitial Ads
// //   InterstitialAd? _interstitialAd;
// //   int _numInterstitialLoadAttempts = 0;
// //   static const int maxFailedLoadAttempts = 3;
// //   void createInterstitialAd() {
// //     InterstitialAd.load(
// //         adUnitId: kDebugMode
// //             ? Platform.isAndroid
// //                 ? 'ca-app-pub-3940256099942544/1033173712'
// //                 : 'ca-app-pub-3940256099942544/4411468910'
// //             : Platform.isAndroid
// //                 ? dotenv.env['interstitialAdUnitId'] ?? ''
// //                 : dotenv.env['interstitialAdUnitIdIos'] ?? '',
// //         request: const AdRequest(),
// //         adLoadCallback: InterstitialAdLoadCallback(onAdLoaded: (adId) {
// //           print('${adId.request} loaded');
// //           _interstitialAd = adId;
// //           _numInterstitialLoadAttempts = 0;
// //           if (Platform.isAndroid) {
// //             _interstitialAd?.setImmersiveMode(true);
// //           }
// //         }, onAdFailedToLoad: (loadError) {
// //           print('InterstitialAd failed to load: $loadError.');
// //           _numInterstitialLoadAttempts += 1;
// //           _interstitialAd = null;
// //           if (_numInterstitialLoadAttempts < maxFailedLoadAttempts) {
// //             createInterstitialAd();
// //           }
// //         }));
// //   }
//
// //   ///Show Interstitial ad with callbacks
// //   void showInterstitialAd() {
// //     if (_interstitialAd == null) {
// //       print('Warning: attempt to show interstitial before loaded.');
// //       return;
// //     }
// //     _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
// //       onAdShowedFullScreenContent: (InterstitialAd ad) =>
// //           print('ad onAdShowedFullScreenContent.'),
// //       onAdDismissedFullScreenContent: (InterstitialAd ad) {
// //         print('${ad.responseInfo} onAdDismissedFullScreenContent.');
// //         if (AppConst.dontShowAdDilog.value) {
// //           Get.dialog(
// //             const AdDontShowAgainDialog(),
// //           );
// //         }
//
// //         ad.dispose();
// //         createInterstitialAd();
// //       },
// //       onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
// //         print('$ad onAdFailedToShowFullScreenContent: $error');
// //         ad.dispose();
// //         createInterstitialAd();
// //       },
// //     );
// //     _interstitialAd!.show();
// //     _interstitialAd = null;
// //   }
//
// //   ///is use for takeing full width of device and devicePixelRatio take ratio for calculations
// //   /// PlatformDispatcher.instance.views.first.physicalSize.width
// //   /// PlatformDispatcher.instance.views.first.devicePixelRatio
//
// //   BannerAd? bannerAd;
//
// //   ///Create/load/show Banner Ad
// //   void createBannerAd() {
// //     if (bannerAd != null) {
// //       bannerAd!.dispose();
// //     }
// //     bannerAd = BannerAd(
// //       size: AdSize.getInlineAdaptiveBannerAdSize(
// //           Platform.isAndroid
// //               ? (PlatformDispatcher.instance.views.first.physicalSize.width ~/
// //                   PlatformDispatcher.instance.views.first.devicePixelRatio)
// //               : ((PlatformDispatcher.instance.views.first.physicalSize.width ~/
// //                   PlatformDispatcher.instance.views.first.devicePixelRatio)),
// //           50),
// //       adUnitId: kDebugMode
// //           ? Platform.isAndroid
// //               ? "ca-app-pub-3940256099942544/6300978111"
// //               : 'ca-app-pub-3940256099942544/2934735716'
// //           : Platform.isAndroid
// //               ? dotenv.env['bannerAdUnitId'] ?? ''
// //               : dotenv.env['bannerAdUnitIdIos'] ?? '',
// //       listener: _showBannerAd(),
// //       request: const AdRequest(),
// //     )..load();
// //   }
//
// //   int attemptOfBnanners = 0;
//
// //   /// Banner ad show Controll
// //   BannerAdListener _showBannerAd() {
// //     return BannerAdListener(
// //       onAdLoaded: (ad) {
// //         print("Ad Loaded:${ad.adUnitId}.");
// //       },
// //       onAdFailedToLoad: (ad, error) {
// //         print("Ad failed to load:${ad.adUnitId}.$error");
// //         if (attemptOfBnanners <= 3) {
// //           createBannerAd();
// //           attemptOfBnanners++;
// //         } else {
// //           ad.dispose();
// //         }
// //       },
// //     );
// //   }
//
// //   RewardedAd? _rewardedAd;
// //   int _numRewardedLoadAttempts = 0;
//
// //   ///Createing and loading Reward ad
// //   void createRewardedAd() {
// //     RewardedAd.load(
// //         adUnitId: kDebugMode
// //             ? Platform.isAndroid
// //                 ? 'ca-app-pub-3940256099942544/5224354917'
// //                 : 'ca-app-pub-3940256099942544/1712485313'
// //             : Platform.isAndroid
// //                 ? dotenv.env['rewardAdUnitId'] ?? ''
// //                 : dotenv.env['rewardAdUnitIdIos'] ?? '',
// //         request: const AdRequest(),
// //         rewardedAdLoadCallback: RewardedAdLoadCallback(
// //           onAdLoaded: (RewardedAd ad) {
// //             print('$ad loaded. aaa');
// //             _rewardedAd = ad;
// //             _numRewardedLoadAttempts = 0;
// //           },
// //           onAdFailedToLoad: (LoadAdError error) {
// //             print('RewardedAd failed to load: $error');
// //             _rewardedAd = null;
// //             _numRewardedLoadAttempts += 1;
// //             if (_numRewardedLoadAttempts < maxFailedLoadAttempts) {
// //               _rewardedAd?.dispose();
// //               createRewardedAd();
// //             }
// //           },
// //         ));
// //   }
//
// //   RxInt currentIndex = 0.obs;
//
// //   ///Show Reward ad with call Back Controll
// //   void showRewardedAd() {
// //     if (_rewardedAd == null) {
// //       print('Warning: attempt to show rewarded before loaded.');
// //       return;
// //     }
// //     _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
// //       onAdWillDismissFullScreenContent: (ad) {
// //         print('ad onAdWillDismissFullScreenContent.');
// //         createRewardedAd();
// //       },
// //       onAdShowedFullScreenContent: (RewardedAd ad) {
// //         print('ad onAdShowedFullScreenContent.');
// //         // createRewardedAd();
// //       },
// //       onAdDismissedFullScreenContent: (RewardedAd ad) {
// //         print('$ad onAdDismissedFullScreenContent.');
// //         _rewardedAd = null;
// //         ad.dispose();
// //         createRewardedAd();
// //       },
// //       onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
// //         print('$ad onAdFailedToShowFullScreenContent: $error');
// //         ad.dispose();
// //         createRewardedAd();
// //       },
// //     );
// //     if (Platform.isAndroid) {
// //       _rewardedAd!.setImmersiveMode(true);
// //     }
// //     _rewardedAd!.show(
// //         onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {
// //       print('$ad with reward $RewardItem(${reward.amount}, ${reward.type})');
//
// //       currentIndex.value++;
// //       if (currentIndex.value == count) {
// //         setAdfreeHour();
// //         Get.dialog(const RewardAdDialog(), barrierDismissible: false);
// //       }
// //     });
// //     _rewardedAd = null;
// //   }
//
// //   NativeAd? nativeAd;
//
// //   ///Create/load Native ad
// //   void createNativeAd() {
// //     nativeAd = NativeAd(
// //         adUnitId: Platform.isAndroid
// //             ? 'ca-app-pub-3940256099942544/2247696110'
// //             : 'ca-app-pub-3940256099942544/3986624511',
// //         listener: NativeAdListener(),
// //         request: const AdRequest(),
// //         nativeTemplateStyle: NativeTemplateStyle(
// //             templateType: TemplateType.medium, cornerRadius: 10.r));
// //   }
//
// //   void showNativeAd() {
// //     nativeAd?.load();
// //   }
//
// //   ///native ad Listener
// //   NativeAdListener nativeAdListener() {
// //     return NativeAdListener(
// //       onAdLoaded: (ad) {
// //         print('Native Ad loaded');
// //       },
// //       onAdFailedToLoad: (ad, error) {
// //         print('Native Ad Faild to load');
// //         showNativeAd();
// //       },
// //     );
// //   }
//
// //   int? rewardTimeStamp;
//
// //   ///Geting Time stamp for 1 hour ad free app usage.
// //   void setAdfreeHour() {
// //     rewardTimeStamp =
// //         DateTime.now().add(const Duration(hours: 1)).millisecondsSinceEpoch;
// //     AppConst.showAd.value = false;
//
// //     Get.find<GetInvitationDataController>().update();
// //     UserPreference.setValue(key: PrefKeys.adTimeStap, value: rewardTimeStamp);
// //   }
// // }
