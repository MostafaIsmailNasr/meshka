import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../conustant/my_colors.dart';
import 'package:flutter_html/flutter_html.dart';
import 'dart:convert';
import 'dart:math' as math;

class AboutAppScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _AboutAppScreen();
  }
}

class _AboutAppScreen extends State<AboutAppScreen>{
  //final aboutUsController = Get.put(AboutUsController());
  //final changeLanguageController = Get.put(ChangeLanguageController());
  @override
  void initState() {
    //aboutUsController.aboutUs();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {
              Navigator.pop(context);
              },
              icon: Transform.rotate(
                  angle:translator.activeLanguageCode=='en'? 180 *math.pi /180:0,
                  child: SvgPicture.asset('assets/back.svg',))

          ),
          title: Center(
            child: SvgPicture.asset(
              'assets/logo_login.svg',
              height: 7.h,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            margin:  EdgeInsetsDirectional.only(end: 1.5.h,start: 1.5.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 2.h,),
                Text('about_mashkah'.tr(), style:  TextStyle(fontSize: 16.sp,
                    fontFamily: 'medium',
                    fontWeight: FontWeight.w500,
                    color: MyColors.Dark1)),
                SizedBox(height: 1.h,),
                Html(
                  data: "نص مثال يمكن ان يستبدل في نفس المساحه نص مثال يمكن ان يستبدل في نفس المساحه نص مثال يمكن ان يستبدل في نفس المساحه نص مثال يمكن ان يستبدل في نفس المساحه نص مثال يمكن ان يستبدل نص مثال يمكن ان يستبدل في نفس المساحه نص مثال يمكن ان يستبدل في نفس المساحه نص مثال يمكن ان يستبدل في نفس المساحه نص مثال يمكن ان يستبدل في نفس المساحه نص مثال يمكن ان يستبدل نص مثال يمكن ان يستبدل في نفس المساحه نص مثال يمكن ان يستبدل في نفس المساحه نص مثال يمكن ان يستبدل في نفس المساحه نص مثال يمكن ان يستبدل في نفس المساحه نص مثال يمكن ان يستبدل نص مثال يمكن ان يستبدل في نفس المساحه نص مثال يمكن ان يستبدل في نفس المساحه نص مثال يمكن ان يستبدل في نفس المساحه",
                ),
                SizedBox(height: 2.h),
                Text('contact_us'.tr(), style:  TextStyle(fontSize: 14.sp,
                    fontFamily: 'regular',
                    fontWeight: FontWeight.w400,
                    color: MyColors.Dark1)),
                SizedBox(height: 1.h),
                GestureDetector(
                  onTap: (){
                    var phone="+94759554847";
                    //aboutUsController.socialResponse.value.data!.contactUs!.value![1].link.toString();
                    _makePhoneCall('tel:$phone');
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/call_calling.svg',width: 3.h,height: 3.h),
                      SizedBox(width: 1.h),
                      Text("+94759554847", style:  TextStyle(fontSize: 14.sp,
                          fontFamily: 'regular',
                          fontWeight: FontWeight.w400,
                          color: MyColors.MainColor)),
                    ],
                  ),
                ),
                SizedBox(height: 1.h),
                GestureDetector(
                  onTap: (){
                    // launchEmail(aboutUsController.socialResponse.value.data!.contactUs!.value![0].link.toString());
                    launchEmail("meshkah@info.com");
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/sms_notification.svg',width: 3.h,height: 3.h,),
                      SizedBox(width: 1.h),
                      Text("meshkah@info.com", style:  TextStyle(fontSize: 14.sp,
                          fontFamily: 'regular',
                          fontWeight: FontWeight.w400,
                          color: MyColors.MainColor)),
                    ],
                  ),
                ),
                SizedBox(height: 3.h),
                Text('social_media_links'.tr(), style:  TextStyle(fontSize: 14.sp,
                    fontFamily: 'regular',
                    fontWeight: FontWeight.w400,
                    color: MyColors.Dark1)),
                SizedBox(height: 1.h),
                Row(
                  children: [
                    GestureDetector(
                        onTap: (){
                          var twitterUrl = "https://twitter.com/i/flow/login";
                          //aboutUsController.socialResponse.value.data?.socialMediaLinks!.value![1].link.toString();
                          _openUrl(twitterUrl);
                        },
                        child: SvgPicture.asset('assets/twitter.svg',width: 7.h,height: 7.h,)),
                    SizedBox(width: 1.h,),
                    GestureDetector(
                        onTap: (){
                          var instagramUrl = 'https://www.instagram.com';
                          _openUrl(instagramUrl);
                        },
                        child: SvgPicture.asset('assets/insta.svg',width: 7.h,height: 7.h,)),
                    SizedBox(width: 1.h,),
                    GestureDetector(
                        onTap: (){
                          var facebookUrl = "https://www.facebook.com/";
                          //aboutUsController.socialResponse.value.data?.socialMediaLinks!.value![0].link.toString();
                          _openUrl(facebookUrl);
                        },
                        child: SvgPicture.asset('assets/face4.svg',width: 7.h,height: 7.h,)),
                  ],
                )
              ],
            ),
          ),
        )


    );
  }
  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void launchEmail(String url) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: url,
    );

    if (await launchUrl(Uri.parse(emailLaunchUri.toString()))) {
    } else {
      throw Exception('Could not launch $emailLaunchUri');
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

  Widget NoIntrnet(){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/no_internet.png'),
          SizedBox(height: 10,),
          Text('there_are_no_internet'.tr(),
            style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.bold,color: MyColors.Dark1),
            textAlign: TextAlign.center,
          ),
        ],
      ),

    );
  }

}