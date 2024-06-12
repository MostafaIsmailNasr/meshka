import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:sizer/sizer.dart';
import '../../../../business/more/profileController/ProfileController.dart';
import '../../../../conustant/my_colors.dart';
import 'dart:math' as math;

class ProfileScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _ProfileScreen();
  }
}

class _ProfileScreen extends State<ProfileScreen>{
  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      backgroundColor: MyColors.MainColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ));
  final profileController=Get.put(ProfileController());
  final _formKey = GlobalKey<FormState>();

  //final changeLanguageController = Get.put(ChangeLanguageController());

  @override
  void initState() {
    getUserDataFromLocal();
    super.initState();
  }

  getUserDataFromLocal()async{
    setState(() {
      profileController.nameController.text=profileController.sharedPreferencesService.getString("name")??"";
      profileController.emailController.text=profileController.sharedPreferencesService.getString("email")??"";
      profileController.PhoneController.text=profileController.sharedPreferencesService.getString("contact")??"";
      profileController.bioController.text=profileController.sharedPreferencesService.getString("bio")??"";
      profileController.pic=profileController.sharedPreferencesService.getString("avatarOriginal")??"";
      print("kkkkkop"+profileController.pic);
    });

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
                  child: SvgPicture.asset('assets/back.svg',))
          ),
          title: Center(
            child: SvgPicture.asset(
              'assets/logo_login.svg',
              height: 7.h,
            ),
          ),
          actions: [
            Container(width: 6.h,)
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            margin:  EdgeInsets.only(left: 2.h,right: 2.h,top: 3.h),
            child: Form(
              key:_formKey ,
              child: Column(
                children: [
                  Center(
                    child:Column(
                      children: [
                        Obx(() =>
                            Visibility(
                                visible: profileController.isVisable.value,
                                child: const CircularProgressIndicator(color: MyColors.MainColor,)
                            )),
                        Obx(() => profileController.isVisable.value == true
                            ? Container()
                            : GestureDetector(
                                onTap: () {
                                  setState(() {
                                    uploadImage();
                                  });
                                },
                                child: Stack(
                                  children: [
                                    Container(
                                      width: 12.h,
                                      height: 12.h,
                                      decoration: profileController.image !=
                                              null
                                          ? BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              color: MyColors.Dark5,
                                              image: DecorationImage(
                                                  image: FileImage(
                                                      profileController.image!),
                                                  fit: BoxFit.fill),
                                              // border: Border.all(
                                              //     width: 1,
                                              //     color: MyColors.Dark3
                                              // )
                                            )
                                          : BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              image: profileController.sharedPreferencesService.getString("avatarOriginal") != ""
                                                  ? DecorationImage(
                                                      image: NetworkImage(
                                                        profileController.sharedPreferencesService.getString("avatarOriginal")??"",
                                                      ),
                                                      fit: BoxFit.fill)
                                                  : const DecorationImage(
                                                      image: NetworkImage(
                                                          'assets/logo_app.png'),
                                                      fit: BoxFit.fill)),
                                    ),
                                    Positioned(
                                      left: 6,
                                      right: 0,
                                      child: SizedBox(
                                        width: 17.h,
                                        height: 12.h,
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(200),
                                            child: SvgPicture.asset(
                                                'assets/shape.svg')),
                                      ),
                                    ),
                                    Positioned(
                                      left: 60,
                                      right: 0,
                                      bottom: 0,
                                      top: 70,
                                      child: SizedBox(
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(200),
                                            child: SvgPicture.asset(
                                                'assets/camera.svg')),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        Text(
                            profileController.sharedPreferencesService.getString("name")??"", style:  TextStyle(fontSize: 14.sp,
                            fontFamily: 'medium',
                            fontWeight: FontWeight.w500,
                            color: MyColors.MainColor)),
                        Text(
                            profileController.sharedPreferencesService.getString("contact")??"", style:  TextStyle(fontSize: 10.sp,
                            fontFamily: 'regular',
                            fontWeight: FontWeight.w400,
                            color: MyColors.MainTint2)),
                      ],
                    ),
                  ),
                  SizedBox(height: 3.h,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'user_name'.tr(),
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
                        child: Name(),
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('email'.tr(),
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
                        child: email(),
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('phone_number'.tr(),
                            style:  TextStyle(fontSize: 12.sp,
                                fontFamily: 'regular',
                                fontWeight: FontWeight.w400,
                                color: MyColors.MainTint2),
                            textAlign: TextAlign.start,
                          ),
                          /*GestureDetector(
                            onTap: (){
                              Navigator.pushNamed(context, "/change_phone_number_screen");
                            },
                            child: Text(
                              'update'.tr(),
                              style:  TextStyle(fontSize: 12.sp,
                                  fontFamily: 'regular',
                                  fontWeight: FontWeight.w400,
                                  color: MyColors.MainColor),
                              textAlign: TextAlign.start,
                            ),
                          ),*/
                        ],
                      ),
                      SizedBox(height: 1.h,),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(5)),
                            border: Border.all(color: MyColors.Dark5, width: 1.0,),
                            color: Colors.white),
                        child: PhoneNumber(),
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'email_optional'.tr(),
                        style:  TextStyle(fontSize: 12.sp,
                            fontFamily: 'regular',
                            fontWeight: FontWeight.w400,
                            color: MyColors.MainTint2),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(height: 1.h,),
                      Container(
                        height: 15.h,
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(5)),
                            border: Border.all(color: MyColors.Dark5, width: 1.0,),
                            color: Colors.white),
                        child: bio(),
                      ),
                    ],
                  ),
                  SizedBox(height: 1.h,),
                  Center(
                    child: Obx(() =>
                        Visibility(
                            visible: profileController.isVisable2
                                .value,
                            child: const CircularProgressIndicator(color: MyColors.MainColor,)
                        )),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 8.h,
                    child: TextButton(
                      style: flatButtonStyle ,
                      onPressed: (){
                        if(_formKey.currentState!.validate()) {
                           profileController.isVisable2.value = true;
                           profileController.updateProfile(context);
                        }
                      },
                      child: Text('update'.tr(),
                          style:  TextStyle(fontSize: 12.sp,
                              fontFamily: 'heavy',
                              fontWeight: FontWeight.w700,
                              color: Colors.white)),
                    ),
                  ),
                  SizedBox(height: 1.h,),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamedAndRemoveUntil(context,'/Login_screen',ModalRoute.withName('/Login_screen'));
                    },
                    child: Text('delete_account'.tr(),
                        style:  TextStyle(fontSize: 14.sp,
                            fontFamily: 'regular',
                            fontWeight: FontWeight.w400,
                            color: MyColors.STATUSEREDColor)),
                  )
                ],
              ),
            ),
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

  Future<void> uploadImage() async {
    final picker = ImagePicker();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('upload_image'.tr(),style:  TextStyle(fontSize: 16.sp,
              fontFamily: 'bold',
              fontWeight: FontWeight.w800,
              color: MyColors.Dark1)),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  child: Text('camera'.tr(),style:  TextStyle(fontSize: 12.sp,
                      fontFamily: 'medium',
                      fontWeight: FontWeight.w500,
                      color: MyColors.Dark2)),
                  onTap: () async {
                    Navigator.of(context).pop();
                    final pickedImage = await picker.getImage(source: ImageSource.camera);
                    if (pickedImage != null) {
                      //File imageFile = File(pickedImage.path);
                      setState(() {
                        profileController.image=File(pickedImage!.path);
                        WidgetsBinding.instance!.addPostFrameCallback((_) {
                          profileController.isVisable.value=true;
                          profileController.uploadImage(context);
                        });
                      });
                    }
                  },
                ),
                SizedBox(height: 1.h),
                GestureDetector(
                  child: Text('gallery'.tr(),
                      style:  TextStyle(
                          fontSize: 12.sp,
                          fontFamily: 'medium',
                          fontWeight: FontWeight.w500,
                          color: MyColors.Dark2)),
                  onTap: () async {
                    Navigator.of(context).pop();
                    final pickedImage = await picker.getImage(source: ImageSource.gallery);
                    if (pickedImage != null) {
                      //File imageFile = File(pickedImage.path);
                      setState(() {
                        profileController.image=File(pickedImage!.path);
                        profileController.isVisable.value=true;
                        profileController.uploadImage(context);
                      });
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget Name(){
    return TextFormField(
      autovalidateMode:AutovalidateMode.onUserInteraction ,
      controller: profileController.nameController,
      maxLines: 1,
      decoration: InputDecoration(
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
    );
  }

  Widget email (){
    return TextFormField(
      autovalidateMode:AutovalidateMode.onUserInteraction ,
      controller: profileController.emailController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'please_enter_phone_number'.tr();
        }else if(!_isEmailValid(value)){
          return 'enter_your_email'.tr();
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

  bool _isEmailValid(String value) {
    final emailRegExp = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
      caseSensitive: false,
      unicode: true,
    );
    return emailRegExp.hasMatch(value);
  }

  Widget PhoneNumber (){
    return TextFormField(
      autovalidateMode:AutovalidateMode.onUserInteraction ,
      controller: profileController.PhoneController,
      maxLines: 1,
      decoration: InputDecoration(
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
        hintText: 'enter_phone2'.tr(),
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

  Widget bio(){
    return TextFormField(
      autovalidateMode:AutovalidateMode.onUserInteraction ,
      controller: profileController.bioController,
      maxLines: 4,
      decoration: InputDecoration(
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
        hintText: 'enter_bio'.tr(),
        hintStyle:  TextStyle(fontSize: 12.sp,
            fontFamily: 'regular',
            fontWeight: FontWeight.w400,
            color: MyColors.MainColor),
      ),
      style:  TextStyle(fontSize: 12.sp,
          fontFamily: 'regular',
          fontWeight: FontWeight.w400,
          color: MyColors.MainColor),
    );
  }

}