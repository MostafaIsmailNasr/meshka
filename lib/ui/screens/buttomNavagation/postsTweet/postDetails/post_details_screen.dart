import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'dart:math' as math;
import '../../../../../conustant/my_colors.dart';
import '../../../../widget/CommintsItem.dart';

class PostDetailsScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _PostDetailsScreen();
  }
}

class _PostDetailsScreen extends State<PostDetailsScreen>{
  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      backgroundColor: MyColors.MainTint4,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ));
  TextEditingController commentTextController = TextEditingController();
  File? image;
  var isFavorate=false;
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
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 15.w,
                    height: 8.h,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(200),
                        child: Image.asset(
                          'assets/proff.png',
                          //   loadingBuilder: (context, child,
                          //       loadingProgress) =>
                          //   (loadingProgress == null)
                          //       ? child
                          //       : Center(
                          //       child: CircularProgressIndicator()),
                          // ),
                        )
                    ),
                  ),
                  SizedBox(width: 1.h,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("mahmoud", style:  TextStyle(fontSize: 16.sp,
                          fontFamily: 'medium',
                          fontWeight: FontWeight.w500,
                          color:MyColors.Dark1)),
                      Text("@mahmoudadel12", style:  TextStyle(fontSize: 12.sp,
                          fontFamily: 'regular',
                          fontWeight: FontWeight.w400,
                          color:MyColors.Dark3)),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 1.h,),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Text("7 Books To Beat Laziness In 2023 (1)", style:  TextStyle(fontSize: 14.sp,
                    fontFamily: 'regular',
                    fontWeight: FontWeight.w400,
                    color:MyColors.Dark1)),
              ),
              SizedBox(height: 1.h,),
              Image.asset('assets/post.png',width: MediaQuery.of(context).size.width,height: 32.h,fit: BoxFit.fill,),
              SizedBox(height: 1.h,),
              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("12:30م", style:  TextStyle(fontSize: 12.sp,
                      fontFamily: 'regular',
                      fontWeight: FontWeight.w400,
                      color:MyColors.Dark3)),
                  SizedBox(width: 1.h,),
                  SvgPicture.asset('assets/divider.svg'),
                  SizedBox(width: 1.h,),
                  Text("4 يونيو 2023", style:  TextStyle(fontSize: 12.sp,
                      fontFamily: 'regular',
                      fontWeight: FontWeight.w400,
                      color:MyColors.Dark3)),
                  SizedBox(width: 1.h,),
                  Text("${'comments'.tr()}54", style:  TextStyle(fontSize: 12.sp,
                      fontFamily: 'regular',
                      fontWeight: FontWeight.w400,
                      color:MyColors.Dark3)),
                  SizedBox(width: 1.h,),
                  SvgPicture.asset('assets/divider.svg'),
                  SizedBox(width: 1.h,),
                  Text("${'likes'.tr()}178", style:  TextStyle(fontSize: 12.sp,
                      fontFamily: 'regular',
                      fontWeight: FontWeight.w400,
                      color:MyColors.Dark3)),
                ],
              ),
              SizedBox(height: 1.h,),
              SvgPicture.asset('assets/saperator.svg',width: MediaQuery.of(context).size.width,),
              SizedBox(height: 1.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: GestureDetector(
                          onTap: (){

                          },
                          child: SvgPicture.asset('assets/comment.svg',width: 8.h,height: 3.5.h,))
                  ),
                  Expanded(
                      child: GestureDetector(
                          onTap: (){
                            setState(() {
                              isFavorate=!isFavorate;
                            });

                          },
                          child:!isFavorate? SvgPicture.asset('assets/heart2.svg',width: 8.h,height: 3.5.h)
                              :SvgPicture.asset('assets/heart_fill.svg',width: 8.h,height: 3.5.h)
                      )
                  ),
                  Expanded(
                      child: GestureDetector(
                          onTap: (){},
                          child: SvgPicture.asset('assets/repeat.svg',width: 8.h,height: 3.5.h))),
                  Expanded(
                      child: GestureDetector(
                          onTap: (){},
                          child: SvgPicture.asset('assets/share.svg',width: 8.h,height: 3.5.h)))
                ],
              ),
              SizedBox(height: 1.h,),
              SvgPicture.asset('assets/saperator.svg',width: MediaQuery.of(context).size.width,),
              SizedBox(height: 1.h,),
              Padding(
                padding:  EdgeInsets.only(bottom: 17.h),
                child: commentsList(),
              )
            ],
          ),
        ),
      ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked ,
      floatingActionButton:
      Container(
        height: 15.h,
        margin: EdgeInsetsDirectional.only(start: 2.h,end: 2.h,bottom: 1.h),
        padding: EdgeInsetsDirectional.all(1.h),
        decoration:  BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            border: Border.all(color: MyColors.Dark5, width: 1.0,),
            color:Colors.white),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 8.w,
                  height: 5.h,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(200),
                      child: Image.asset(
                        'assets/proff.png',
                        //   loadingBuilder: (context, child,
                        //       loadingProgress) =>
                        //   (loadingProgress == null)
                        //       ? child
                        //       : Center(
                        //       child: CircularProgressIndicator()),
                        // ),
                      )
                  ),
                ),
                SizedBox(width: 1.h),
                Expanded(child: comment()),
                 GestureDetector(
                     onTap: (){
                       uploadImage();
                     },
                     child: SvgPicture.asset('assets/gallery_add.svg')),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: TextButton(
                style: flatButtonStyle,
                onPressed: () async{

                },
                child: Text('add'.tr(),
                  style:  TextStyle(fontSize: 12.sp,
                      fontFamily: 'regular',
                      fontWeight: FontWeight.w500,
                      color: MyColors.MainColor),),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget commentsList(){
    return ListView.builder(
        scrollDirection: Axis.vertical,
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        itemCount:5,
        itemBuilder: (context,int index){
          return CommintsItem();
        }
    );
  }

  Widget comment (){
    return Container(
      //width: 35.h,
      child: TextFormField(
        autovalidateMode:AutovalidateMode.onUserInteraction,
        controller: commentTextController,
        maxLines: 1,
        // validator: (value) {
        //   if (value == null || value.isEmpty) {
        //     return 'please_enter_phone_number'.tr();
        //   }else if(value.length<10){
        //     return 'phone_number_must'.tr();
        //   }
        //   return null;
        // },
        decoration: InputDecoration(contentPadding: EdgeInsetsDirectional.all(1.h),
          errorBorder:  const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(color: Colors.red,style: BorderStyle.solid),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(color: Colors.white,style: BorderStyle.solid),
          ),
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(style: BorderStyle.solid,color: Colors.white,)
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(color:Colors.white,style: BorderStyle.solid),
          ) ,
          hintText: 'add_reply'.tr(),
          hintStyle:  TextStyle(fontSize: 12.sp,
              fontFamily: 'regular',
              fontWeight: FontWeight.w400,
              color: MyColors.Dark3),
        ),
        style:  TextStyle(fontSize: 12.sp,
            fontFamily: 'regular',
            fontWeight: FontWeight.w400,
            color: MyColors.Dark3),
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
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
                        image=File(pickedImage!.path);
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
                        image=File(pickedImage!.path);
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

}