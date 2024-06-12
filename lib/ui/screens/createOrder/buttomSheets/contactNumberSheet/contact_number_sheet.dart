import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:sizer/sizer.dart';

import '../../../../../business/createOrderController/CreateOrderController.dart';
import '../../../../../conustant/my_colors.dart';
import '../verifyCodeSheet/verfiy_code_sheet.dart';

class ContactNumberSheet extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _ContactNumberSheet();
  }
}

class _ContactNumberSheet extends State<ContactNumberSheet>with TickerProviderStateMixin{

  final _formKey = GlobalKey<FormState>();
  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      backgroundColor: MyColors.MainColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topRight: Radius.circular(5),bottomRight: Radius.circular(5)),
      ));
  final ButtonStyle flatButtonStyle2 = TextButton.styleFrom(
      backgroundColor: MyColors.MainColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(5),bottomLeft: Radius.circular(5)),
      ));
  final createOrderController = Get.put(CreateOrderController());

  @override
  void initState() {
    createOrderController.phoneController.clear();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 1.5.h,left: 1.5.h,top: 1.h,bottom: 1.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          customBar(),
          number(),
        ],
      ),
    );
  }

  Widget customBar(){
    return Container(
      margin: EdgeInsetsDirectional.only(end: 1.h,start: 1.h,top: 1.h),
      child: Column(
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
                    createOrderController.phoneController.clear();
                  }
              ),
            ],
          ),
          SizedBox(height: 2.h,),
        ],
      ),
    );
  }

  Widget number(){
    return Form(
      key: _formKey,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              height: 8.h,
              decoration:createOrderController.sharedPreferencesService.getString("lang")=="en"?
              BoxDecoration(
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(5),bottomLeft: Radius.circular(5)),
                  border: Border.all(color: MyColors.Dark5, width: 1.0,),
                  color:Colors.white)
                  :BoxDecoration(
                  borderRadius: const BorderRadius.only(topRight: Radius.circular(5),bottomRight: Radius.circular(5)),
                  border: Border.all(color: MyColors.Dark5, width: 1.0,),
                  color:Colors.white),
              child: phoneNumber(),
            ),
          ),
          Expanded(flex: 1,
            child: SizedBox(
              height: 8.h,
              child: TextButton(
                style:createOrderController.sharedPreferencesService.getString("lang")=="en"? flatButtonStyle:flatButtonStyle2,
                onPressed: () async{
                  if(_formKey.currentState!.validate()){
                    Navigator.pop(context);
                   /* showModalBottomSheet<void>(
                        isScrollControlled: true,
                        transitionAnimationController: AnimationController(vsync: this,duration: const Duration(seconds: 1)),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                        ),
                        context: context,
                        backgroundColor: Colors.white,
                        builder: (BuildContext context) => Padding(
                            padding: EdgeInsets.only(
                                bottom: MediaQuery.of(context).viewInsets.bottom),
                            child: VerfiyCodeSheet()));*/
                    setState(() {
                      createOrderController.contactNumber.value=createOrderController.phoneController.text;
                    });

                  }
                },
                child: Text('apply'.tr(),
                  style:  TextStyle(fontSize: 12.sp,
                      fontFamily: 'regular',
                      fontWeight: FontWeight.w500,
                      color: Colors.white),),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget phoneNumber (){
    return TextFormField(
      autovalidateMode:AutovalidateMode.onUserInteraction ,
      controller: createOrderController.phoneController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'enter_phone2'.tr();
        }else if(value.length<10){
          return 'phone_number_must'.tr();
        }
        return null;
      },
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
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
    );
  }

}