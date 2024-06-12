import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sizer/sizer.dart';
import 'dart:math' as math;
import '../../../../../conustant/my_colors.dart';

class VerifyCodeUpdateScreen extends StatefulWidget{
  var phone;
  VerifyCodeUpdateScreen(this.phone);

  @override
  State<StatefulWidget> createState() {
    return _VerifyCodeUpdateScreen();
  }
}

class _VerifyCodeUpdateScreen extends State<VerifyCodeUpdateScreen>{
  final _verifyformKey = GlobalKey<FormState>();
  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      backgroundColor: MyColors.MainColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ));
  TextEditingController verfiyCodeController = TextEditingController();
  var currentPin="";
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
          key: _verifyformKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               Text('please_enter_digit_code'.tr(), style:  TextStyle(fontSize: 14.sp,
                   fontFamily: 'regular',
                   fontWeight: FontWeight.w400,
                   color: MyColors.MainColor),textAlign: TextAlign.center,),
               Text("(+974)${widget.phone}", style:  TextStyle(fontSize: 16.sp,
                   fontFamily: 'heavy',
                   fontWeight: FontWeight.w700,
                   color: MyColors.MainColor)),
               SizedBox(height: 3.h,),
               PinCodeTextField(
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
                     selectedFillColor: MyColors.MainTint,
                     inactiveFillColor: MyColors.MainTint,
                     activeFillColor: MyColors.MainTint,
                     shape: PinCodeFieldShape.box,
                     borderRadius: BorderRadius.circular(5),
                     activeColor: MyColors.Dark5,
                     inactiveColor: MyColors.Dark5,
                     fieldHeight: 7.h,
                     fieldWidth: 17.w,borderWidth: 1
                 ),enableActiveFill: true,

                 cursorColor: Colors.black,
                 keyboardType: TextInputType.number,
                 textStyle:  TextStyle(fontSize: 11.sp),
                 onCompleted: (pin) {
                   //verifyController.verify(context,verifyController.currentPin);
                   verfiyCodeController.clear();
                   // Navigator.pushNamedAndRemoveUntil(context,'/buttom_navagation_screen',
                   //     ModalRoute.withName('/buttom_navagation_screen'),arguments: 0);
                   Navigator.pushNamed(context, '/success_update_phone_screen');
                 },
               ),
               SizedBox(height: 2.h,),
               SizedBox(
                 width: double.infinity,
                 height: 8.h,
                 child: TextButton(
                   style: flatButtonStyle,
                   onPressed: () {
                     if(_verifyformKey.currentState!.validate()){
                       //verifyController.verify(context,verifyController.currentPin);
                       Navigator.pushNamed(context, '/success_update_phone_screen');
                     }
                   },
                   child: Text('confirm'.tr(),
                     style:  TextStyle(fontSize: 12.sp,
                         fontFamily: 'regular',
                         fontWeight: FontWeight.w700,
                         color: Colors.white),),
                 ),
               ),
               SizedBox(height: 3.h,),
               Text('didnt_receive_code'.tr(), style:  TextStyle(fontSize: 14.sp,
                   fontFamily: 'regular',
                   fontWeight: FontWeight.w400,
                   color: MyColors.MainColor)),
               GestureDetector(
                 onTap: (){
                   //verifyController.isVisable.value=true;
                   //verifyController.resendCode(context);
                 },
                 child: Text('request_again'.tr(), style:  TextStyle(fontSize: 12.sp,
                     fontFamily: 'heavy',
                     fontWeight: FontWeight.w700,
                     color: MyColors.SecondryColor)),
               ),
             ],
          ),
        ),
      ),
    );
  }

}