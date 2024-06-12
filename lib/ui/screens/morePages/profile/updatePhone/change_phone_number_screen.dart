import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:sizer/sizer.dart';

import '../../../../../conustant/my_colors.dart';
import 'dart:math' as math;

class ChangePhoneNumberScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _ChangePhoneNumberScreen();
  }
}

class _ChangePhoneNumberScreen extends State<ChangePhoneNumberScreen>{
  TextEditingController PhoneController = TextEditingController();
  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      backgroundColor: MyColors.MainColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ));
  final _formKey = GlobalKey<FormState>();
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
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('change_phone_number'.tr(), style:  TextStyle(fontSize: 16.sp,
                  fontFamily: 'medium',
                  fontWeight: FontWeight.w500,
                  color:MyColors.Dark1)),
              SizedBox(height: 1.h,),
              Text('you_can_change'.tr(), style:  TextStyle(fontSize: 12.sp,
                  fontFamily: 'regular',
                  fontWeight: FontWeight.w400,
                  color:MyColors.Dark3)),
              SizedBox(height: 2.h,),
              Text('phone_number'.tr(),
                style:  TextStyle(fontSize: 12.sp,
                    fontFamily: 'regular',
                    fontWeight: FontWeight.w400,
                    color: MyColors.MainTint2),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 1.h,),
              Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    border: Border.all(color: MyColors.Dark5, width: 1.0,),
                    color: Colors.white),
                child: PhoneNumber(),
              ),
              SizedBox(height: 2.h,),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 8.h,
                child: TextButton(
                  style: flatButtonStyle ,
                  onPressed: (){
                    if(_formKey.currentState!.validate()) {
                      // profileController.isVisabl.value = true;
                      // profileController.profile(context);
                      Navigator.pushNamed(context, '/verfiy_code_update_screen',arguments: PhoneController.text);
                    }
                  },
                  child: Text('send_code'.tr(),
                      style:  TextStyle(fontSize: 12.sp,
                          fontFamily: 'heavy',
                          fontWeight: FontWeight.w700,
                          color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget PhoneNumber (){
    return TextFormField(
      autovalidateMode:AutovalidateMode.onUserInteraction ,
      controller: PhoneController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'please_enter_phone_number'.tr();
        }else if(value.length<10){
          return 'phone_number_must'.tr();
        }
        return null;
      },
      maxLines: 1,
      decoration: InputDecoration(
        prefixIcon:   Padding(
            padding: EdgeInsetsDirectional.fromSTEB(1.2.h,0,1.2.h,0),
            child: Image(image: const AssetImage('assets/qater.png',),width: 3.h,height: 3.h,)
        ),
        errorBorder:  const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(color: Colors.red,style: BorderStyle.solid),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(color: Colors.white70,style: BorderStyle.solid),
        ),
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(style: BorderStyle.solid,color: Colors.white70,)
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(color: Colors.red,style: BorderStyle.solid),
        ) ,
        hintText: 'enter_phone'.tr(),
        hintStyle:  TextStyle(fontSize: 12.sp,
            fontFamily: 'regular',
            fontWeight: FontWeight.w400,
            color: MyColors.MainColor),
      ),
      style:  TextStyle(fontSize: 12.sp,
          fontFamily: 'regular',
          fontWeight: FontWeight.w400,
          color: MyColors.MainColor),
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(10)],
    );
  }

}