import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sizer/sizer.dart';
import 'dart:math' as math;
import '../../../../conustant/di.dart';
import '../../../../conustant/my_colors.dart';
import '../../../../conustant/shared_preference_serv.dart';
import 'dart:math' as math;

class VerfiyCodeScreen extends StatefulWidget{
  //var code;
  var phone;
  VerfiyCodeScreen({required this.phone});

  @override
  State<StatefulWidget> createState() {
    return _VerfiyCodeScreen();
  }
}

class _VerfiyCodeScreen extends State<VerfiyCodeScreen>{
  final _verifyformKey = GlobalKey<FormState>();
  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      backgroundColor: MyColors.MainColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ));
  TextEditingController verfiyCodeController = TextEditingController();
  var currentPin="";

  @override
  void initState() {
    super.initState();
    // print(widget.code.toString());
    // Fluttertoast.showToast(
    //   msg: widget.code.toString(),
    //   toastLength: Toast.LENGTH_SHORT,
    //   gravity: ToastGravity.TOP,
    //   timeInSecForIosWeb: 1,
    // );

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Transform.rotate(
                angle:translator.activeLanguageCode=='en'? 180 *math.pi /180:0,
                child: SvgPicture.asset('assets/back.svg',))
        ),
      ),
      body: Form(
        key: _verifyformKey,
        child: Container(
            margin:  EdgeInsetsDirectional.only(start: 2.5.h, end: 2.5.h),
            child: Center(
                child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            height: 20.h,child: SvgPicture.asset('assets/logo_login.svg')),
                        SizedBox(height: 1.5.h),
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
                            Navigator.pushNamedAndRemoveUntil(context,'/buttom_navagation_screen',
                                ModalRoute.withName('/buttom_navagation_screen'),arguments: 0);
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
                                Navigator.pushNamedAndRemoveUntil(context,'/buttom_navagation_screen',
                                    ModalRoute.withName('/buttom_navagation_screen'),arguments: 0);
                              }
                            },
                            child: Text('login'.tr(),
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
                        // Center(
                        //   child: Obx(() =>
                        //       Visibility(
                        //           visible: verifyController.isVisable
                        //               .value,
                        //           child: const CircularProgressIndicator(color: MyColors.MainColor,)
                        //       )),
                        // ),
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
                      ]
                  ),
                )
            )
        ),
      ),
    );
  }


}