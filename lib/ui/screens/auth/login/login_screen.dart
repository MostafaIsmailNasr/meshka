import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:sizer/sizer.dart';

import '../../../../business/auth/loginController/LoginController.dart';
import '../../../../conustant/my_colors.dart';

class LoginScreen extends StatefulWidget{
  var from;

  LoginScreen({this.from});

  @override
  State<StatefulWidget> createState() {
    return _LoginScreen();
  }
}

class _LoginScreen extends State<LoginScreen>{
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
  final loginController = Get.put(LoginController());
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    loginController.from=widget.from??"";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white),
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
                        Text('login_with_your_phone_number'.tr(), style:  TextStyle(fontSize: 14.sp,
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
                                      visible: loginController.isVisable.value,
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
                                    loginController.isVisable.value=true;
                                    //await loginController.updateToken();
                                    loginController.login(context);
                                  }
                                },
                                child: Text('login'.tr(),
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
                            SizedBox(
                              width: double.infinity,
                              height: 8.h,
                              child: TextButton(
                                style: socialButtonStyle,
                                onPressed: () async{
                                  Navigator.pushNamedAndRemoveUntil(context,'/buttom_navagation_screen',
                                      ModalRoute.withName('/buttom_navagation_screen'),arguments: 0);
                                  loginController.sharedPreferencesService.setBool("islogin", false);
                                  loginController.passController.clear();
                                  loginController.PhoneController.clear();
                                  await loginController.sharedPreferencesService.setString("cartId", "null");
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
                            /*SizedBox(height: 1.h,),
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
                                Navigator.pushNamed(context, "/register_screen");
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('dont_have_account'.tr(),
                                      style:  TextStyle(fontSize: 14.sp,
                                          fontFamily: 'bold',
                                          fontWeight: FontWeight.w600,
                                          color: MyColors.MainTint1)),
                                  Text('register'.tr(),
                                      style:  TextStyle(fontSize: 14.sp,
                                          fontFamily: 'bold',
                                          fontWeight: FontWeight.w600,
                                          color: MyColors.MainColor2))
                                ],
                              ),
                            )
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
      controller: loginController.PhoneController,
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
      // inputFormatters: [FilteringTextInputFormatter.digitsOnly,
      //   LengthLimitingTextInputFormatter(10)],
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
    );
  }

  Widget password(){
    return Obx(() =>  TextFormField(
      autovalidateMode:AutovalidateMode.onUserInteraction ,
      controller: loginController.passController,
      obscureText: loginController.obscureText.value,
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
          child: new GestureDetector(
            onTap: (){
              //setState(() {
              loginController.obscureText.value = !loginController.obscureText.value;
              //});
            },
            child: Icon(loginController.obscureText.value ? Icons.visibility_off :  Icons.visibility),
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
      // inputFormatters: [FilteringTextInputFormatter.digitsOnly,
      //   LengthLimitingTextInputFormatter(8)],
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
    ));
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