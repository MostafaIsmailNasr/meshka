import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sizer/sizer.dart';

import '../../../../../conustant/my_colors.dart';

class VerfiyCodeSheet extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _VerfiyCodeSheet();
  }
}

class _VerfiyCodeSheet extends State<VerfiyCodeSheet>{
  TextEditingController verfiyCodeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var currentPin="";
  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      backgroundColor: MyColors.MainColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ));
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 1.5.h,left: 1.5.h,top: 1.h,bottom: 1.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          customBar(),
          verifyCode(),
        ],
      ),
    );
  }

  Widget customBar(){
    return Container(
      margin: EdgeInsetsDirectional.only(end: 1.h,start: 1.h,top: 1.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('update_contact_number'.tr(),
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
          SizedBox(height: 2.h,),
          Text('enter_code_sent_to_your_phone_number'.tr(),
            style:  TextStyle(fontSize: 12.sp,
                fontFamily: 'medium',
                fontWeight: FontWeight.w400,
                color: MyColors.MainColor),),
          SizedBox(height: 2.h,),
        ],
      ),
    );
  }

  Widget verifyCode(){
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Container(
            padding: EdgeInsetsDirectional.only(start: 1.5.h,end: 1.5.h),
            child: PinCodeTextField(
              appContext: context,
              controller: verfiyCodeController,
              length: 4, // Set the length of the PIN code
              onChanged: (pin) {
                setState(() {
                  currentPin = pin;
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'please_enter_verify_code'.tr();
                }else if(value.length<4){
                  return 'code_must'.tr();
                }
                return null;
              },
              // controller: verifyController.verfiyCodeController,
              pinTheme: PinTheme(
                  selectedFillColor: Colors.white,
                  inactiveFillColor: Colors.white,
                  activeFillColor: Colors.white,
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  activeColor: MyColors.Dark5,
                  inactiveColor: MyColors.Dark5,
                  fieldHeight: 7.h,
                  fieldWidth: 17.w,borderWidth: 0.5
              ),enableActiveFill: true,
              cursorColor: Colors.black,
              keyboardType: TextInputType.number,
              textStyle:  TextStyle(fontSize: 11.sp),
              onCompleted: (pin) {
                //verifyController.verify(context,verifyController.currentPin);
                //verfiyCodeController.clear();
                Navigator.pop(context);
              },
            ),
          ),
          SizedBox(height: 2.h,),
          SizedBox(
            width: double.infinity,
            height: 8.h,
            child: TextButton(
              style: flatButtonStyle,
              onPressed: () {
                if(_formKey.currentState!.validate()){
                  //verifyController.verify(context,verifyController.currentPin);
                }
              },
              child: Text('confirm'.tr(),
                style:  TextStyle(fontSize: 12.sp,
                    fontFamily: 'regular',
                    fontWeight: FontWeight.w700,
                    color: Colors.white),),
            ),
          ),
        ],
      )
    );
  }

}