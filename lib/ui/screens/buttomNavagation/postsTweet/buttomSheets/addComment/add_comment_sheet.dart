import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../conustant/my_colors.dart';

class AddCommentSheet extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _AddCommentSheet();
  }
}

class _AddCommentSheet extends State<AddCommentSheet>{
  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      backgroundColor: MyColors.MainColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ));
  File? image;
  TextEditingController commentTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
          border: Border.all(color: MyColors.Dark5, width: 1.0,),
          color: Colors.white),
      padding: EdgeInsets.only(right: 1.5.h,left: 1.5.h,top: 1.h,bottom: 1.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          customBar(),
          post(),
          SizedBox(height: 2.h,),
          GestureDetector(
            onTap: (){
              uploadImage();
            },
            child: Row(
              children: [
                SvgPicture.asset('assets/gallery_add.svg'),
                SizedBox(width: 1.h,),
                Text('add_photo'.tr(),style: TextStyle(
                    fontSize: 12.sp,
                    fontFamily: 'regular',
                    color: MyColors.MainColor,
                    fontWeight: FontWeight.w400))
              ],
            ),
          ),
          SizedBox(height: 3.h,),
          SizedBox(
            width: double.infinity,
            height: 8.h,
            child: TextButton(
              style: flatButtonStyle,
              onPressed: () async{

              },
              child: Text('add'.tr(),
                style:  TextStyle(fontSize: 12.sp,
                    fontFamily: 'regular',
                    fontWeight: FontWeight.w500,
                    color: Colors.white),),
            ),
          ),
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

            children: [
              Text('reply_to'.tr(),
                style:  TextStyle(fontSize: 12.sp,
                    fontFamily: 'regular',
                    fontWeight: FontWeight.w400,
                    color: MyColors.Dark3),),
              SizedBox(width: 1.h,),
              Text('mahmoud'.tr(),
                style:  TextStyle(fontSize: 14.sp,
                    fontFamily: 'regular',
                    fontWeight: FontWeight.w400,
                    color: MyColors.SecondryColor),),
              Spacer(),
              IconButton(
                  icon: SvgPicture.asset('assets/close_circle.svg'),
                  onPressed:(){
                    Navigator.pop(context);
                  }
              ),
            ],
          ),
          SizedBox(height: 2.h,),
        ],
      ),
    );
  }

  Widget post(){
    return Container(
      height: 50.h,
      padding: EdgeInsetsDirectional.all(1.h),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all( Radius.circular(10)),
          border: Border.all(color: MyColors.Dark5, width: 1.0,),
          color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 10.5.w,
                height: 7.h,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(200),
                    child: Image.asset(
                      'assets/proff.png',fit: BoxFit.fill,
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
              postText()
            ],
          ),
          Stack(
            children: [
              image!=null? Container(
                  width: MediaQuery.of(context).size.width,
                  height: 15.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                        width: 1,
                        color: MyColors.Dark3
                    ),
                    image: DecorationImage(image: FileImage(image!),fit: BoxFit.fill),
                  )):
              Container(
                // width: MediaQuery.of(context).size.width,
                // height: 15.h,
                // decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(15),
                //     image: const DecorationImage(image: AssetImage('assets/pic5.png',),fit: BoxFit.fill)//:
                // ),
              ),
              Positioned(
                right: 6,
                top: 6,
                child: InkWell(
                  onTap: (){
                    setState(() {
                      image=null;
                    });
                  },
                  child: Center(
                      child: SvgPicture.asset('assets/remove.svg')
                  ),
                ),
              ),
            ],
          ),
          //SizedBox(height: 15.h,)
        ],
      ),
    );
  }

  Widget postText (){
    return Container(
      width: 35.h,
      child: TextFormField(
        autovalidateMode:AutovalidateMode.onUserInteraction,
        controller: commentTextController,
        maxLines: 5,
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
          hintText: 'write_your_response_here'.tr(),
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