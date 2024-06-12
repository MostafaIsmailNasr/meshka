import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../business/more/profileController/ProfileController.dart';
import '../../../../conustant/my_colors.dart';
import '../../createOrder/buttomSheets/loginSheet/login_sheet.dart';
import '../../morePages/chooseLanguage/choose_language_shhet.dart';


class MoreScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MoreScreen();
  }
}

class _MoreScreen extends State<MoreScreen>{
  final moreController = Get.put(ProfileController());

  @override
  void initState() {
    moreController.getData();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.MainTint5,
      appBar: AppBar(
        backgroundColor: MyColors.MainTint5,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 3.h,),
            Center(
              child: Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        width: 25.w,
                        height: 12.h,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(200),
                          child: Image.network(
                            moreController.pic,
                            loadingBuilder: (context, child,
                                loadingProgress) =>
                            (loadingProgress == null)
                                ? child
                                : const Center(child: CircularProgressIndicator()),
                            errorBuilder: (context, error, stackTrace) =>
                                Center(child:  SvgPicture.asset('assets/logo_login.svg',width: 8.h,)),
                          ),
                        ),
                      ),

                      Positioned(
                        left: 2,
                        right: 0,
                        child: SizedBox(
                          width: 25.w,
                          height: 12.h,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(200),
                              child: SvgPicture.asset('assets/shape.svg')
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                      moreController.name??"", style:  TextStyle(fontSize: 14.sp,
                      fontFamily: 'medium',
                      fontWeight: FontWeight.w500,
                      color: MyColors.MainColor)),
                  Text(
                      moreController.email??"", style:  TextStyle(fontSize: 10.sp,
                      fontFamily: 'regular',
                      fontWeight: FontWeight.w400,
                      color: MyColors.MainTint2)),
                ],
              ),
            ),
            SizedBox(height: 2.h,),
            GestureDetector(
              onTap: (){
                if (moreController.sharedPreferencesService
                        .getBool("islogin") ==
                    true) {
                  Navigator.pushNamed(context, "/profile_screen");
                }else{
                  showModalBottomSheet<void>(
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20)),
                      ),
                      context: context,
                      backgroundColor: Colors.white,
                      builder: (BuildContext context) =>
                          Padding(
                              padding: EdgeInsets.only(
                                  bottom:
                                  MediaQuery.of(context).viewInsets.bottom),
                              child: LoginSheet(from: "",)));
                }
              },
              child: Container(
                color: Colors.white,
                padding:  EdgeInsetsDirectional.all(2.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/my_account.svg',height: 4.h,),
                    SizedBox(width: 1.h,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('edit_account'.tr(), style:  TextStyle(fontSize: 14.sp,
                            fontFamily: 'regular',
                            fontWeight: FontWeight.w500,
                            color:MyColors.MainColor)),
                        Text('change_your_phone_number_and_account_details'.tr(), style:  TextStyle(fontSize: 11.sp,
                            fontFamily: 'regular',
                            fontWeight: FontWeight.w400,
                            color:MyColors.MainTint2)),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 0.5.h,),
            GestureDetector(
              onTap: (){
                if (moreController.sharedPreferencesService
                    .getBool("islogin") ==
                    true) {
                  Navigator.pushNamed(context, "/my_orders_screen");
                }else{
                  showModalBottomSheet<void>(
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20)),
                      ),
                      context: context,
                      backgroundColor: Colors.white,
                      builder: (BuildContext context) =>
                          Padding(
                              padding: EdgeInsets.only(
                                  bottom:
                                  MediaQuery.of(context).viewInsets.bottom),
                              child: LoginSheet(from: "",)));
                }

              },
              child: Container(
                color: Colors.white,
                padding:  EdgeInsetsDirectional.all(2.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/book_square.svg',height: 4.h,),
                    SizedBox(width: 1.h,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('my_orders'.tr(), style:  TextStyle(fontSize: 14.sp,
                            fontFamily: 'regular',
                            fontWeight: FontWeight.w500,
                            color:MyColors.MainColor)),
                        Text('track_your_orders'.tr(), style:  TextStyle(fontSize: 11.sp,
                            fontFamily: 'regular',
                            fontWeight: FontWeight.w400,
                            color:MyColors.MainTint2)),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 0.5.h,),
            GestureDetector(
              onTap: (){
                if (moreController.sharedPreferencesService
                    .getBool("islogin") ==
                    true) {
                  Navigator.pushNamed(context, "/my_location_screen");
                }else{
                  showModalBottomSheet<void>(
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20)),
                      ),
                      context: context,
                      backgroundColor: Colors.white,
                      builder: (BuildContext context) =>
                          Padding(
                              padding: EdgeInsets.only(
                                  bottom:
                                  MediaQuery.of(context).viewInsets.bottom),
                              child: LoginSheet(from: "",)));
                }
              },
              child: Container(
                color: Colors.white,
                padding:  EdgeInsetsDirectional.all(2.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/map.svg',height: 4.h,),
                    SizedBox(width: 1.h,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('delivery_addresses'.tr(), style:  TextStyle(fontSize: 14.sp,
                            fontFamily: 'regular',
                            fontWeight: FontWeight.w500,
                            color:MyColors.MainColor)),
                        Text('control_your_delivery_addresses'.tr(), style:  TextStyle(fontSize: 11.sp,
                            fontFamily: 'regular',
                            fontWeight: FontWeight.w400,
                            color:MyColors.MainTint2)),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 0.5.h,),
            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, "/fags_screen");
              },
              child: Container(
                color: Colors.white,
                padding:  EdgeInsetsDirectional.all(2.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/message_question.svg',height: 4.h,),
                    SizedBox(width: 1.h,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('common_questions'.tr(), style:  TextStyle(fontSize: 14.sp,
                            fontFamily: 'regular',
                            fontWeight: FontWeight.w500,
                            color:MyColors.MainColor)),
                        Text('most_frequently_asked_questions_users'.tr(), style:  TextStyle(fontSize: 11.sp,
                            fontFamily: 'regular',
                            fontWeight: FontWeight.w400,
                            color:MyColors.MainTint2)),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 0.5.h,),
            GestureDetector(
              onTap: (){
                showModalBottomSheet<void>(
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    context: context,
                    backgroundColor: Colors.white,
                    builder: (BuildContext context) => Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: ChooseLanguageDialog()));
              },
              child: Container(
                color: Colors.white,
                padding:  EdgeInsetsDirectional.all(2.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/global.svg',height: 4.h,),
                    SizedBox(width: 1.h,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('language'.tr(), style:  TextStyle(fontSize: 14.sp,
                            fontFamily: 'regular',
                            fontWeight: FontWeight.w500,
                            color:MyColors.MainColor)),
                        Text('use_your_preferred_language'.tr(), style:  TextStyle(fontSize: 11.sp,
                            fontFamily: 'regular',
                            fontWeight: FontWeight.w400,
                            color:MyColors.MainTint2)),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 0.5.h,),
            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, "/about_app_screen");
              },
              child: Container(
                color: Colors.white,
                padding:  EdgeInsetsDirectional.all(2.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/information.svg',height: 4.h,),
                    SizedBox(width: 1.h,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('about_app'.tr(), style:  TextStyle(fontSize: 14.sp,
                            fontFamily: 'regular',
                            fontWeight: FontWeight.w500,
                            color:MyColors.MainColor)),
                        Text('about_Mishka_application'.tr(), style:  TextStyle(fontSize: 11.sp,
                            fontFamily: 'regular',
                            fontWeight: FontWeight.w400,
                            color:MyColors.MainTint2)),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 0.5.h,),
           /* GestureDetector(
              onTap: (){
                //Navigator.pushNamed(context, "/profile_screen");
              },
              child: Container(
                color: Colors.white,
                padding:  EdgeInsetsDirectional.all(2.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/medal_star.svg',height: 4.h,),
                    SizedBox(width: 1.h,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('rate_app'.tr(), style:  TextStyle(fontSize: 14.sp,
                            fontFamily: 'regular',
                            fontWeight: FontWeight.w500,
                            color:MyColors.MainColor)),
                        SizedBox(
                          width: 38.h,
                          child: Text('rate_application_the_google_and_apple_stores'.tr(), style:  TextStyle(fontSize: 11.sp,
                              fontFamily: 'regular',
                              fontWeight: FontWeight.w400,
                              color:MyColors.MainTint2)),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),*/
            SizedBox(height: 0.5.h,),
          moreController.sharedPreferencesService.getBool("islogin") == true?
          GestureDetector(
              onTap: ()async{

                await moreController.sharedPreferencesService.setBool("islogin",false);
                await moreController.sharedPreferencesService.setString("cartId", "null");
                await moreController.sharedPreferencesService.removeKey('id');
                await moreController.sharedPreferencesService.removeKey('name');
                await moreController.sharedPreferencesService.removeKey('email');
                ///profile//////
                await moreController.sharedPreferencesService.removeKey('bio');
                await moreController.sharedPreferencesService.removeKey('contact');
                await moreController.sharedPreferencesService.removeKey('avatarId');
                await moreController.sharedPreferencesService.removeKey('avatarOriginal');
                await moreController.sharedPreferencesService.removeKey('avatarThumbnail');
                print("kioio"+moreController.sharedPreferencesService.getString("cartId").toString());
                await Navigator.pushNamedAndRemoveUntil(context,'/Login_screen',
                    ModalRoute.withName('/Login_screen'));
              },
              child: Container(
                color: Colors.white,
                padding:  EdgeInsetsDirectional.all(2.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/logout.svg',height: 4.h,),
                    SizedBox(width: 1.h,),
                    Text('logout'.tr(), style:  TextStyle(fontSize: 14.sp,
                        fontFamily: 'regular',
                        fontWeight: FontWeight.w500,
                        color:MyColors.MainColor))
                  ],
                ),
              ),
            ):Container(),
            SizedBox(height: 1.h,),
            Container(
              color: Colors.white,
              padding:  EdgeInsetsDirectional.all(2.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('version'.tr(), style:  TextStyle(fontSize: 14.sp,
                      fontFamily: 'regular',
                      fontWeight: FontWeight.w500,
                      color:MyColors.MainColor)),
                  Text(moreController.installedVersion.value??"", style:  TextStyle(fontSize: 14.sp,
                      fontFamily: 'bold',
                      fontWeight: FontWeight.w600,
                      color:MyColors.MainColor))
                ],
              ),
            ),
            SizedBox(height: 1.h,),
          ],
        ),
      )
      ,
    );
  }

  /*Widget NoIntrnet(){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //SvgPicture.asset('assets/no_internet.svg'),
          Image.asset('assets/no_internet.png'),
          SizedBox(height: 10,),
          Text('there_are_no_internet'.tr(),
            style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.bold,color: MyColors.Dark1),
            textAlign: TextAlign.center,
          ),
        ],
      ),

    );
  }*/

}