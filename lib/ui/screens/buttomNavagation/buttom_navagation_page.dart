import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:mashkah_library/conustant/my_colors.dart';
import 'package:mashkah_library/ui/screens/buttomNavagation/postsTweet/posts_tweet_screen.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../business/cartController/CartController.dart';
import '../../../business/more/profileController/ProfileController.dart';
import '../../../business/productDetailsController/ProductDetailsController.dart';
import '../../../conustant/di.dart';
import '../../../conustant/shared_preference_serv.dart';
import '../categoryDetails/category_details_screen.dart';
import 'cart/cart_screen.dart';
import 'categories/categories_screen.dart';
import 'home/home_screen.dart';
import 'more/more_screen.dart';



class ButtomNavagationPage extends StatefulWidget{
  var selectedIndex;

  ButtomNavagationPage(this.selectedIndex);

  @override
  State<StatefulWidget> createState() {
    return _ButtomNavagationPage();
  }
}

class _ButtomNavagationPage extends State<ButtomNavagationPage>{
  final moreController = Get.put(ProfileController());
  int _selectedIndex = 0;
  int? selectedFlage;
  //buttom Navigation click/////
  List<Widget> NavigationScreen=[];
  final SharedPreferencesService sharedPreferencesService =
  instance<SharedPreferencesService>();
  //String installedVersion = "";
  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      backgroundColor: MyColors.MainColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ));
  var idi;

  Future<void> printAppVersion() async {
     idi= sharedPreferencesService.getString("cartId");
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      moreController.installedVersion.value = packageInfo.version;
      log('App version ${moreController.installedVersion.value}');
    });
  }

  Future<void> checkForUpdateAppAndroid() async {
    try {
      await InAppUpdate.checkForUpdate().then((storeValue) {
        log('... $storeValue');
        if (storeValue.immediateUpdateAllowed == true) {
          forceUpdatePopup(context);
        }
      }).catchError((e) {
        log('Error checking for update: $e');
      });
    } catch (e) {
      log('Exception checking for update: $e');
    }
  }

  Future<void> _openUrl(String url) async {
    if (!await launchUrl(
      Uri.parse(url),
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  int getExtendedVersionNumber(String version) {
    List versionCells = version.split('.');
    versionCells = versionCells.map((i) => int.parse(i)).toList();
    return versionCells[0] * 100000 + versionCells[1] * 1000 + versionCells[2];
  }

  Future<void> checkAppStoreIOS() async {
    const ourBundleId = 'com.sahl.mashkahLibrary';
    try {
      final Response response = await Dio().get(
        'https://itunes.apple.com/lookup?bundleId=$ourBundleId',
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.data);

        if (responseData.containsKey('results') &&
            responseData['results'] is List &&
            responseData['results'].isNotEmpty) {
          final List<dynamic> results = responseData['results'];
          final Map<String, dynamic> entry = results.first;
          final String appVersion = entry['version'];
          int installed = getExtendedVersionNumber(moreController.installedVersion.value);
          int store = getExtendedVersionNumber(appVersion);
          if (store > installed) {
            log('installed$installed store$store');
            // ignore: use_build_context_synchronously
            forceUpdatePopup(context);
          }
          log('App Store IOS Version: $appVersion');
        } else {
          log('Error: Invalid App Store version information response');
        }
      } else {
        log('Error: Unexpected status code ${response.statusCode}');
      }
    } catch (error) {
      log('Error: $error');
    }
  }

  forceUpdatePopup(BuildContext context) {
    AlertDialog dialog = AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(24.0))),
        backgroundColor: Colors.white,
        contentPadding: const EdgeInsets.all(0),
        // ignore: deprecated_member_use
        content: WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: Container(
              padding: EdgeInsets.symmetric(vertical: 3.h),
              margin: EdgeInsets.symmetric(horizontal: 3.h),
              height: 30.h,
              width: 95.w,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(24.0)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('update_available'.tr(),
                      style: TextStyle(fontSize: 16.sp,
                          fontFamily: 'bold',
                          fontWeight: FontWeight.w600,
                          color: MyColors.Dark1)),
                  SizedBox(
                    height: 4.h,
                  ),
                  Text('A new version of the app is available. Update now?'.tr(),
                      style: TextStyle(fontSize: 12.sp,
                          fontFamily: 'bold',
                          fontWeight: FontWeight.w500,
                          color: MyColors.Dark2)),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                          height: 6.h,
                          child: TextButton(
                            style: flatButtonStyle,
                            onPressed: () async {
                              Navigator.of(context).pop();
                            },
                            child: Text('Ignore'.tr(),
                              style: TextStyle(fontSize: 10.sp,
                                  fontFamily: 'bold',
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),),
                          ),
                        ),
                      ),
                      SizedBox(width: 1.w,),
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                          height: 6.h,
                          width: 20.w,
                          child: TextButton(
                            style: flatButtonStyle,
                            onPressed: () async {
                              if (Platform.isAndroid) {
                                _openUrl('market://details?id=com.sahl.mashkah_library');
                              }
                              else if (Platform.isIOS) {
                                _openUrl('itms-apps://itunes.apple.com/app/6475412039');
                              }
                              Navigator.of(context).pop();
                            },
                            child: Text('Update Now'.tr(),
                              style: TextStyle(fontSize: 10.sp,
                                  fontFamily: 'bold',
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )),
        ));

    showCupertinoDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return dialog;
        });
  }

  @override
  void initState() {
    printAppVersion();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (Platform.isAndroid) {
        checkForUpdateAppAndroid();
      } else if (Platform.isIOS) {
        checkAppStoreIOS();
      }
    });
     NavigationScreen=[
      HomeScreen(),
      CategoriesScreen(),
      CartScreen(cartId:idi),
      //PostsTweetScreen(),
      CategoryDetailsScreen(slug: "tags.slug:flash-sale;status:publish",
          name: 'featured_books'.tr(),
          tags: "flash-sale",
          from: "navigator"),
      MoreScreen(),
    ];
    _selectedIndex=widget.selectedIndex;
    super.initState();
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
        child: NavigationScreen[_selectedIndex],
      ),
    ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor:Colors.white,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/home_unselected.svg'),
                label: "",
                activeIcon: SvgPicture.asset('assets/home.svg')),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/element.svg'),
                label: "",
                activeIcon: SvgPicture.asset('assets/element_selected.svg')),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/message.svg'),
                label: "",
                activeIcon: SvgPicture.asset('assets/cart_selected.svg')),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/offer.svg',color: MyColors.disabledColor,),
                label: "",
                activeIcon: SvgPicture.asset('assets/offer.svg',color: MyColors.MainColor,)),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/user.svg'),
                label: "",
                activeIcon: SvgPicture.asset('assets/user.svg',color: MyColors.MainColor)),
          ],
        currentIndex: _selectedIndex,
        selectedItemColor: MyColors.MainColor,
        onTap: _onItemTapped,
      ),
    );
  }

}