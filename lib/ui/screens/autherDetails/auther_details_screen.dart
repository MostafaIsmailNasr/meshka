import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:sizer/sizer.dart';
import 'dart:math' as math;
import '../../../conustant/my_colors.dart';
import '../../widget/autherDetails/autherDetailsItem.dart';

class AutherDetailsScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _AutherDetailsScreen();
  }
}

class _AutherDetailsScreen extends State<AutherDetailsScreen>{
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
          margin: EdgeInsetsDirectional.only(start: 2.h, end: 2.h, top: 2.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsetsDirectional.all(1.h),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: MyColors.MainTint5),
                child: Center(child: Image.asset('assets/auther2.png')),
              ),
              SizedBox(height: 1.h,),
              Text("نجيب محفوظ", style:  TextStyle(fontSize: 14.sp,
                  fontFamily: 'medium',
                  fontWeight: FontWeight.w500,
                  color:MyColors.Dark1)),
              Text("وُلِد في ١١ ديسمبر ١٩١١م في حي الجمالية بالقاهرة، لعائلةٍ من الطبقة المتوسطة، وكان والده موظفًا حكوميًّا، وقد اختار له اسمَ الطبيب الذي أشرَف على وِلادته، وهو الدكتور «نجيب محفوظ باشا»، ليصبح اسمُه مُركَّبًا «نجيب محفوظ»",
                  style:  TextStyle(fontSize: 11.sp,
                  fontFamily: 'regular',
                  fontWeight: FontWeight.w400,
                  color:MyColors.Dark3)),
              SizedBox(height: 2.h,),
              Text('books_written_by_writer'.tr(), style:  TextStyle(fontSize: 12.sp,
                  fontFamily: 'regular',
                  fontWeight: FontWeight.w400,
                  color:MyColors.Dark1)),
              autherDetailsList()
            ],
          ),
        ),
      ),
    );
  }

  Widget autherDetailsList(){
    return GridView.builder(
        scrollDirection: Axis.vertical,
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: (1 / 2),
          crossAxisSpacing: 12,
          mainAxisSpacing: 8,
        ),
        itemCount: 4,
        itemBuilder: (context, int index) {
          return autherDetailsItem();
        });

  }

}