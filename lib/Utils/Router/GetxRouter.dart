import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reelproject/Bindings/HomeBinding.dart';
import 'package:reelproject/Utils/Router/RouteName.dart';
import 'package:reelproject/view/HomeScreen/HomeScreen.dart';

Route<dynamic>? generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RoutesName.homeScreen:
      return getPageRoutes(
          routeName: RoutesName.homeScreen,
          page: () => const HomeScreen(),
          settings: settings,
          bindings: [HomeBinding()]);
    default:
      return getPageRoutes(
          routeName: RoutesName.homeScreen,
          page: () => const HomeScreen(),
          settings: settings,
          bindings: [HomeBinding()]);
  }
}

PageRoute getPageRoutes(
    {required String routeName,
    required Function page,
    required RouteSettings settings,
    List<Bindings>? bindings}) {
  return GetPageRoute(
      page: () => page(),
      routeName: routeName,
      settings: settings,
      bindings: bindings);
}
