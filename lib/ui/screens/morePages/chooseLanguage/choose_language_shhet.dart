import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:sizer/sizer.dart';

import '../../../../conustant/di.dart';
import '../../../../conustant/my_colors.dart';
import '../../../../conustant/shared_preference_serv.dart';
import '../../../../conustant/toast_class.dart';

class ChooseLanguageDialog extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _ChooseLanguageDialog();
  }
}

class _ChooseLanguageDialog extends State<ChooseLanguageDialog>{
  var isSelected=false;
  int? itemId=0;
  //final changeLanguageController = Get.put(ChangeLanguageController());
  var lang;
  final SharedPreferencesService sharedPreferencesService =
  instance<SharedPreferencesService>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(right: 2.h,left: 2.h,top: 1.h,bottom: 1.h),
      child: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              customBar(),
              InkWell(
                onTap: (){
                  setState(() {
                    isSelected=true;
                    itemId=1;
                    lang='ar';
                    sharedPreferencesService.setString("lang", lang);
                    translator.setNewLanguage(
                      context,
                      newLanguage: lang,
                      remember: true,
                    );
                    Phoenix.rebirth(context);
                    Navigator.pop(context);
                  });
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 6.h,
                  margin:  EdgeInsetsDirectional.only(start: 1.h,end: 1.h),
                  padding:  EdgeInsets.all(1.h),
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/qater.svg',width: 3.h,),
                      SizedBox(width: 1.h,),
                      Text('arabic'.tr(),
                        style:  TextStyle(fontSize: 14.sp,
                            fontFamily: 'regular',
                            fontWeight: FontWeight.w400,
                            color: MyColors.Dark1),),
                      const Spacer(),
                      isSelected==true && itemId==1?SvgPicture.asset('assets/rado_checked.svg'):SvgPicture.asset('assets/rado_unChecked.svg',),
                    ],
                  ),
                ),
              ),
              Container(
                  margin:  EdgeInsetsDirectional.only(start: 1.h,end: 1.h),
                  child: SvgPicture.asset('assets/saperator.svg',width: MediaQuery.of(context).size.width)),
               SizedBox(height: 1.h,),
              InkWell(
                onTap: (){
                  setState(() {
                    isSelected=true;
                    itemId=2;
                    lang='en';
                    sharedPreferencesService.setString("lang", lang);
                    translator.setNewLanguage(
                      context,
                      newLanguage: lang,
                      remember: true,
                    );
                    Phoenix.rebirth(context);
                    Navigator.pop(context);
                  });
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 6.h,
                  margin:  EdgeInsetsDirectional.only(start: 1.h,end: 1.h),
                  padding:  EdgeInsets.all(1.h),
                  child: Row(
                    children: [
                      Image.asset('assets/english.png',width: 3.h,height: 2.h,),
                      SizedBox(width: 1.h,),
                      Text('english'.tr(),
                        style:  TextStyle(fontSize: 14.sp,
                            fontFamily: 'regular',
                            fontWeight: FontWeight.w400,
                            color: MyColors.Dark1),),
                      const Spacer(),
                      isSelected==true && itemId==2?SvgPicture.asset('assets/rado_checked.svg'):SvgPicture.asset('assets/rado_unChecked.svg',),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }

  Widget customBar(){
    return Container(
      margin: EdgeInsetsDirectional.only(end: 1.h,start: 1.h,top: 1.h),
      child: SizedBox(
        height: 5.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('choose_language'.tr(),
              style:  TextStyle(fontSize: 16.sp,
                  fontFamily: 'medium',
                  fontWeight: FontWeight.w500,
                  color: MyColors.Dark1),),
            IconButton(
                icon: SvgPicture.asset('assets/close_circle.svg'),
                onPressed:(){
                  Navigator.pop(context);
                }
            ),

          ],
        ),
      ),
    );
  }
}