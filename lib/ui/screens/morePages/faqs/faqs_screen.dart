import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:sizer/sizer.dart';

import 'dart:math' as math;

import '../../../../conustant/my_colors.dart';
import '../../../widget/AnswerQuestionItem.dart';
import '../../../widget/QuestionsFaqs.dart';

class FaqsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FaqsScreen();
  }
}

class _FaqsScreen extends State<FaqsScreen>{
  var selectedFlage;
  var selectedFlageTime=0;
  //final faqsController = Get.put(FaqsController());
  //final changeLanguageController = Get.put(ChangeLanguageController());

  @override
  void initState() {
    //faqsController.getFaqs();
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
                  child: SvgPicture.asset('assets/back.svg',))),
          title: Center(
            child: SvgPicture.asset(
              'assets/logo_login.svg',
              height: 7.h,
            ),
          ),
        ),
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            margin: EdgeInsetsDirectional.only(start: 2.h, end: 2.h, top: 2.h),
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'how_can_we_help_you'.tr(),
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: 'medium',
                        fontWeight: FontWeight.w500,
                        color: MyColors.Dark1,
                      ),
                    ),
                    SizedBox(height: 1.h),
                    Text(
                      'top_questions'.tr(),
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontFamily: 'regular',
                        fontWeight: FontWeight.w400,
                        color: MyColors.Dark2,
                      ),
                    ),
                    SizedBox(height: 1.h),
                  ],
                ),
                QuestionsList(),
                SizedBox(height: 2.h),
                AnswerList(), // Wrap with Expanded instead of Flexible
              ],
            ),
          )


    );
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

  Widget QuestionsList(){
    return GridView.builder(
        scrollDirection: Axis.vertical,
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: (2 / 1),
          crossAxisSpacing: 12,
          mainAxisSpacing: 8,
        ),
        itemCount: 3,
        itemBuilder: (context, int index) {
          return QuestionsFaqs(
              is_selected: selectedFlageTime==index,
              onTap: () {
                setState(() {
                  selectedFlageTime=index;
                });
              },
              //allFaqs: faqsController.faqList[index]
          );
        });

  }

  Widget AnswerList() {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      itemCount: 3,//faqsController.faqsResponse.value.data![selectedFlageTime].faqs!.length,
      itemBuilder: (context, i) {
        //var faq =faqsController.faqsResponse.value.data![selectedFlageTime].faqs![i];
        return AnswerQuestionItem(
          question: "هل يمكنني الغاء الطلب ؟",
          answer: "نص مثال يمكن ان يستبدل في نفس المساحه نص مثال يمكن ان يستبدل في نفس المساحه نص مثال يمكن ان يستبدل في نفس المساحه نص مثال يمكن ان يستبدل في نفس المساحه نص مثال يمكن ان يستبدل",
        );
      },
    );
  }
}