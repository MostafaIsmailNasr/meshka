import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:mashkah_library/ui/screens/auth/splash/splash_screen.dart';
import 'package:sizer/sizer.dart';

import 'AppRouter.dart';
import 'business/cartController/CartController.dart';
import 'conustant/di.dart';
import 'notification_service.dart';

FirebaseMessaging messaging = FirebaseMessaging.instance;

NotificationService notificationService = NotificationService();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupDependencyInjection();
  await NotificationService().init();
  await notificationService.initializePlatformNotifications();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await translator.init(
    localeType: LocalizationDefaultType.device,
    languagesList: <String>['ar', 'en'],
    assetsDirectory: 'lib/language/',
  );
  final cartController = Get.put(CartController());
  var y=translator.currentLanguage.toString();
  cartController.sharedPreferencesService.setString("lang", y);


  /*FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;
  Future<void> initDynamicLinks() async {
    final PendingDynamicLinkData? data = await dynamicLinks.getInitialLink();
    final Uri? deepLink = data?.link;

    if (deepLink != null) {
      log(deepLink.queryParameters.toString());
      final String carId = deepLink.queryParameters["car_id"]!;
      final int index = int.parse(deepLink.queryParameters["index"]!);

      log(carId.toString());
      Navigator.navigatTo(RenterCarDetailsScreen(
          carId: int.parse(carId), index: index, fromOnerUser: 'fromOnerUser'));
    }
    dynamicLinks.onLink.listen((dynamicLinkData) {
      log(dynamicLinkData.utmParameters.toString());
      final String carId = dynamicLinkData.utmParameters["car_id"]!;
      final int index = int.parse(dynamicLinkData.utmParameters["index"]!);

      Navigation.navigatTo(
        RenterCarDetailsScreen(
            carId: int.parse(carId),
            index: index,
            fromOnerUser: 'fromOnerUser'),
      );
    }).onError((error) {
      log('onLink error');
      log(error.message);
    });
  }*/

  runApp(LocalizedApp(
    child: MyApp(appRouter: AppRouter(),),
  ),);
  runApp(
    Phoenix(
      child: //MyApp(appRouter: AppRouter())
      LocalizedApp(child: MyApp(appRouter: AppRouter(),)),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key,required this.appRouter});
  final AppRouter appRouter;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          title: "Mashkah",
          theme: ThemeData(
              useMaterial3: true,
              pageTransitionsTheme: const PageTransitionsTheme(builders: {
                TargetPlatform.android: CupertinoPageTransitionsBuilder(),
                TargetPlatform.iOS: CupertinoPageTransitionsBuilder()
              }),
              bottomAppBarColor: Colors.black54,

              scaffoldBackgroundColor: Colors.white),
          debugShowCheckedModeBanner: false,
          onGenerateRoute: appRouter.generateRoute,
          localizationsDelegates: translator.delegates,
          locale: translator.activeLocale,
          supportedLocales: translator.locals(),
          home: SplashScreen(),
        );
      },
    );
  }
}

