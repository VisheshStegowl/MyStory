import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:reelproject/Utils/Constants/AppFontFamily.dart';
import 'package:reelproject/Utils/Router/GetxRouter.dart';
import 'package:reelproject/Utils/Router/RouteName.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        builder: (context, _) {
          return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              onGenerateRoute: generateRoute,
              initialRoute: RoutesName.homeScreen,
              theme: ThemeData(fontFamily: AppFontFamily.Gothic.string));
        });
  }
}
