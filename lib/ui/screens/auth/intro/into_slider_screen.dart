import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:sizer/sizer.dart';
import 'package:localize_and_translate/localize_and_translate.dart';


import '../../../../conustant/my_colors.dart';

class IntroSliderScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return _IntroSliderScreen();
  }
}

class _IntroSliderScreen extends State<IntroSliderScreen>{
  List<ContentConfig> slides = [];

  @override
  void initState() {
    super.initState();
    // introController.getIntroData().then((response) {
    // setState(() {
    //   slides.forEach((intro) {
    //     slides.add(
    //       const ContentConfig(
    //         title: "اكتشف عالم المعرفه",
    //         description: "المكان الأمثل للعثور على الكتب التي ترغب في قراءتها وامتلاكها. يوفر التطبيق مجموعة متنوعة من الكتب في جميع المجالات، سواء كنت تبحث عن رواية مشوقة أو كتاب تعليمي مفيد. مع واجهة سهلة الاستخدام وإمكانية البحث والتصفح المتقدمة",
    //         pathImage: 'assets/intro.png',
    //       ),
    //     );
    //   });
    // });
    //});
    slides.add(
      const ContentConfig(
        title: "اكتشف عالم المعرفه",
        description: "المكان الأمثل للعثور على الكتب التي ترغب في قراءتها وامتلاكها. يوفر التطبيق مجموعة متنوعة من الكتب في جميع المجالات، سواء كنت تبحث عن رواية مشوقة أو كتاب تعليمي مفيد. مع واجهة سهلة الاستخدام وإمكانية البحث والتصفح المتقدمة",
        pathImage: 'assets/intro.png',
      ),
    );
    slides.add(
      const ContentConfig(
        title: "اكتشف عالم المعرفه",
        description: "المكان الأمثل للعثور على الكتب التي ترغب في قراءتها وامتلاكها. يوفر التطبيق مجموعة متنوعة من الكتب في جميع المجالات، سواء كنت تبحث عن رواية مشوقة أو كتاب تعليمي مفيد. مع واجهة سهلة الاستخدام وإمكانية البحث والتصفح المتقدمة",
        pathImage: 'assets/intro.png',
      ),
    );
    slides.add(
      const ContentConfig(
        title: "اكتشف عالم المعرفه",
        description: "المكان الأمثل للعثور على الكتب التي ترغب في قراءتها وامتلاكها. يوفر التطبيق مجموعة متنوعة من الكتب في جميع المجالات، سواء كنت تبحث عن رواية مشوقة أو كتاب تعليمي مفيد. مع واجهة سهلة الاستخدام وإمكانية البحث والتصفح المتقدمة",
        pathImage: 'assets/intro.png',
      ),
    );
  }

  List<Widget> generateListCustomTabs() {
    return slides.map((slide) {
      return Container(
        width: double.infinity,
        height: double.infinity,
        child: ListView(
          children: <Widget>[
            Image.asset(
              slide.pathImage!,
              fit: BoxFit.fill,
              width: MediaQuery.of(context).size.width,
              height: 52.h,
            ),
            SizedBox(height: 2.h),
            Text(
              slide.title!,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.sp,
                fontFamily: 'heavy',
                fontWeight: FontWeight.w800,
                color: MyColors.Dark1,
              ),
            ),
            SizedBox(height: 1.h),
            Text(
              slide.description!,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12.sp,
                fontFamily: 'regular',
                fontWeight: FontWeight.w400,
                color: MyColors.Dark2,
              ),
            ),
          ],
        ),
      );
    }).toList();
  }

  ButtonStyle myButtonStyle() {
    return ButtonStyle(
      shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
      backgroundColor: MaterialStateProperty.all<Color>(MyColors.MainColor),
      foregroundColor: MaterialStateProperty.all<Color>(MyColors.MainColor),
    );
  }

  @override
  Widget build(BuildContext context) {
    // if (slides.isEmpty) {
    //   return const Scaffold(
    //     body: Center(
    //       child: CircularProgressIndicator(),
    //     ),
    //   );
    // }
    return Scaffold(
      body: Container(
        //color: MyColors.BackGroundColor,
        child: IntroSlider(
          key: UniqueKey(),
          listContentConfig: slides,
          renderSkipBtn: Text(
            'skip'.tr(),
            style: TextStyle(
              fontSize: 12.sp,
              fontFamily: 'regular',
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
          renderNextBtn: Text(
            'continue'.tr(),
            style: TextStyle(
              fontSize: 9.sp,
              fontFamily: 'lexend_bold',
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          nextButtonStyle: myButtonStyle(),
          renderDoneBtn: Text(
            'login'.tr(),
            style: TextStyle(
              fontSize: 9.sp,
              fontFamily: 'lexend_bold',
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          onDonePress: onDonePress,
          doneButtonStyle: myButtonStyle(),
          skipButtonStyle: myButtonStyle(),
          indicatorConfig: IndicatorConfig(
            sizeIndicator: 1.2.h,
            colorActiveIndicator: MyColors.MainColor2,
            colorIndicator: MyColors.MainColor3,
            typeIndicatorAnimation: TypeIndicatorAnimation.sizeTransition,
          ),
          listCustomTabs: generateListCustomTabs(),
          scrollPhysics: BouncingScrollPhysics(),
          backgroundColorAllTabs: Colors.white,
        ),
      ),
    );
  }

  void onDonePress() {
    Navigator.pushNamedAndRemoveUntil(
      context,
      "/Login_screen",
      ModalRoute.withName('/Login_screen'),
    );
  }

}