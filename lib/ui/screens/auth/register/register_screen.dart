import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:sizer/sizer.dart';

import '../../../../business/auth/registerController/RegisterController.dart';
import '../../../../conustant/my_colors.dart';

class RegisterScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _RegisterScreen();
  }
}

class _RegisterScreen extends State<RegisterScreen>{
  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      backgroundColor: MyColors.MainColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ));
  final ButtonStyle socialButtonStyle = TextButton.styleFrom(
      backgroundColor: MyColors.MainTint,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          side: BorderSide(color: MyColors.Dark5, width: 1)
      ));
  final _formKey = GlobalKey<FormState>();
  final registerController = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin:  EdgeInsetsDirectional.only(start: 2.5.h,end: 2.5.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Center(
                child: Form(
                  key:_formKey ,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 15.h,child: SvgPicture.asset('assets/logo_login.svg')),
                        SizedBox(height: 2.h,),
                        Text('create_your_account_easily'.tr(), style:  TextStyle(fontSize: 14.sp,
                            fontFamily: 'bold',
                            fontWeight: FontWeight.w600,
                            color: MyColors.MainColor)),
                        SizedBox(height: 3.h,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                                  border: Border.all(color: MyColors.Dark5, width: 1.0,),
                                  color: MyColors.MainTint),
                              child: name(),
                            ),
                            SizedBox(height: 1.h,),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                                  border: Border.all(color: MyColors.Dark5, width: 1.0,),
                                  color: MyColors.MainTint),
                              child: PhoneNumber(),
                            ),
                            SizedBox(height: 1.h,),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                                  border: Border.all(color: MyColors.Dark5, width: 1.0,),
                                  color: MyColors.MainTint),
                              child: password(),
                            ),
                            SizedBox(height: 1.h,),
                            Center(
                              child: Obx(() =>
                                  Visibility(
                                      visible: registerController.isVisable.value,
                                      child: const CircularProgressIndicator(color: MyColors.MainColor,)
                                  )),
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: 8.h,
                              child: TextButton(
                                style: flatButtonStyle,
                                onPressed: () async{
                                  if(_formKey.currentState!.validate()){
                                    registerController.isVisable.value=true;
                                    //await loginController.updateToken();
                                    registerController.register(context);
                                    //Navigator.pushNamed(context, "/Verfiy_code_screen",arguments:PhoneController.text);
                                  }
                                },
                                child: Text('register'.tr(),
                                  style:  TextStyle(fontSize: 12.sp,
                                      fontFamily: 'bold',
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),),
                              ),
                            ),
                            SizedBox(height: 2.h,),
                            Row(
                              children: [
                                SvgPicture.asset('assets/saperator.svg'),
                                SizedBox(width: 1.h,),
                                Text('Or'.tr(), style:  TextStyle(fontSize: 12.sp,
                                    fontFamily: 'regular',
                                    fontWeight: FontWeight.w400,
                                    color: MyColors.MainColor)),
                                SizedBox(width: 1.h,),
                                SvgPicture.asset('assets/saperator.svg'),
                              ],
                            ),
                            SizedBox(height: 1.h,),
                            SizedBox(height: 1.h,),
                            SizedBox(
                              width: double.infinity,
                              height: 8.h,
                              child: TextButton(
                                style: socialButtonStyle,
                                onPressed: () async{
                                  await registerController.sharedPreferencesService.setString("cartId", "null");
                                 await Navigator.pushNamedAndRemoveUntil(context,'/buttom_navagation_screen',
                                      ModalRoute.withName('/buttom_navagation_screen'),arguments: 0);
                                  registerController.sharedPreferencesService.setBool("islogin", false);
                                  registerController.passController.clear();
                                  registerController.PhoneController.clear();
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('skip'.tr(),
                                      style:  TextStyle(fontSize: 12.sp,
                                          fontFamily: 'bold',
                                          fontWeight: FontWeight.w600,
                                          color: MyColors.MainColor),),
                                  ],
                                ),
                              ),
                            ),
                            /*SizedBox(
                              width: double.infinity,
                              height: 8.h,
                              child: TextButton(
                                style: socialButtonStyle,
                                onPressed: () async{

                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset('assets/face.svg'),
                                    SizedBox(width: 1.h,),
                                    Text('login_with_facebook'.tr(),
                                      style:  TextStyle(fontSize: 12.sp,
                                          fontFamily: 'regular',
                                          fontWeight: FontWeight.w500,
                                          color: MyColors.MainColor),),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 1.h,),
                            SizedBox(
                              width: double.infinity,
                              height: 8.h,
                              child: TextButton(
                                style: socialButtonStyle,
                                onPressed: () async{

                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset('assets/google.svg'),
                                    SizedBox(width: 1.h,),
                                    Text('login_with_google'.tr(),
                                      style:  TextStyle(fontSize: 12.sp,
                                          fontFamily: 'regular',
                                          fontWeight: FontWeight.w500,
                                          color: MyColors.MainColor),),
                                  ],
                                ),
                              ),
                            ),*/
                            SizedBox(height: 1.h,),
                            GestureDetector(
                              onTap: (){
                                //.pushNamed(context, "/Login_screen",arguments:PhoneController.text);
                                Navigator.pop(context);
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('you_have_account'.tr(),
                                    style:  TextStyle(fontSize: 14.sp,
                                        fontFamily: 'bold',
                                        fontWeight: FontWeight.w600,
                                        color: MyColors.MainTint1)),
                                  Text('login'.tr(),
                                      style:  TextStyle(fontSize: 14.sp,
                                          fontFamily: 'bold',
                                          fontWeight: FontWeight.w600,
                                          color: MyColors.MainColor2))
                                ],
                              ),
                            ),
                            SizedBox(height: 1.h,),
                          ],
                        ),

                      ],
                    ),
                  ),
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
      controller: registerController.PhoneController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'please_enter_phone_number'.tr();
        }else if(!_isEmailValid(value)){
          return 'enter_your_email'.tr();
        }
        // else if(value.length<10){
        //   return 'phone_number_must'.tr();
        // }
        return null;
      },
      maxLines: 1,
      decoration: InputDecoration(
        errorBorder:  const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(color: Colors.red,style: BorderStyle.solid),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(color: Colors.white70,style: BorderStyle.solid),
        ),
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(style: BorderStyle.solid,color: Colors.white70,)
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
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
      //keyboardType: TextInputType.number,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
    );
  }

  Widget password(){
    return Obx(() => TextFormField(
      autovalidateMode:AutovalidateMode.onUserInteraction ,
      controller: registerController.passController,
      obscureText: registerController.obscureText.value,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'please_enter_password'.tr();
        }else if(value.length<8){
          return 'pass_must'.tr();
        }
        return null;
      },
      maxLines: 1,
      decoration: InputDecoration(
        errorBorder:  const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(color: Colors.red,style: BorderStyle.solid),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(color: Colors.white70,style: BorderStyle.solid),
        ),
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(style: BorderStyle.solid,color: Colors.white70,)
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(color: Colors.red,style: BorderStyle.solid),
        ) ,
        suffixIcon: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0,0,0,0),
          child: GestureDetector(
            onTap: (){
              registerController.obscureText.value = !registerController.obscureText.value;
            },
            child: Icon(registerController.obscureText.value ? Icons.visibility_off :  Icons.visibility),
          ),
        ),
        hintText: 'enter_pass'.tr(),
        hintStyle:  TextStyle(fontSize: 12.sp,
            fontFamily: 'regular',
            fontWeight: FontWeight.w400,
            color: MyColors.MainColor),
      ),

      style:  TextStyle(fontSize: 12.sp,
          fontFamily: 'regular',
          fontWeight: FontWeight.w400,
          color: MyColors.MainColor),
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
    ));
  }

  Widget name (){
    return TextFormField(
      autovalidateMode:AutovalidateMode.onUserInteraction ,
      controller: registerController.nameController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'please_enter_name'.tr();
        }
        return null;
      },
      maxLines: 1,
      decoration: InputDecoration(
        errorBorder:  const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(color: Colors.red,style: BorderStyle.solid),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(color: Colors.white70,style: BorderStyle.solid),
        ),
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(style: BorderStyle.solid,color: Colors.white70,)
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(color: Colors.red,style: BorderStyle.solid),
        ) ,
        hintText: 'please_enter_name'.tr(),
        hintStyle:  TextStyle(fontSize: 12.sp,
            fontFamily: 'regular',
            fontWeight: FontWeight.w400,
            color: MyColors.MainColor),
      ),
      style:  TextStyle(fontSize: 12.sp,
          fontFamily: 'regular',
          fontWeight: FontWeight.w400,
          color: MyColors.MainColor),
      //keyboardType: TextInputType.number,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
    );
  }

  bool _isEmailValid(String value) {
    final emailRegExp = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
      caseSensitive: false,
      unicode: true,
    );
    return emailRegExp.hasMatch(value);
  }

}