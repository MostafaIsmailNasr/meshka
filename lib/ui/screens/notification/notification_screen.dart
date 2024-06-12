import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:sizer/sizer.dart';
import 'dart:math' as math;
import '../../../conustant/my_colors.dart';
import '../../widget/notification/NotificationItem.dart';

class NotificationScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _NotificationScreen();
  }
}

class _NotificationScreen extends State<NotificationScreen>{
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
      body: Container(
        margin: EdgeInsetsDirectional.only(start: 2.h, end: 2.h, top: 2.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('notifications'.tr(), style:  TextStyle(fontSize: 16.sp,
                  fontFamily: 'heavy',
                  fontWeight: FontWeight.w700,
                  color:MyColors.Dark1)),
              SizedBox(height: 1.h,),
              notificationList()
            ],
          ),
        ),
      ),
    );
  }

  Widget notificationList(){
    return ListView.builder(
        scrollDirection: Axis.vertical,
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        itemCount:10,
        itemBuilder: (context,int index){
          return NotificationItem();
        }
    );
  }

}