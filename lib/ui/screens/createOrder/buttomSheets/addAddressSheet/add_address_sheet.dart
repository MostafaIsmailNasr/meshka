import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:sizer/sizer.dart';

import '../../../../../business/more/addressController/AddressController.dart';
import '../../../../../conustant/my_colors.dart';

enum dateGroup{invoices,delivery_address}
class AddAddressSheet extends StatefulWidget{
  var from;

  AddAddressSheet({required this.from});

  @override
  State<StatefulWidget> createState() {
    return _AddAddressSheet();
  }
}

class _AddAddressSheet extends State<AddAddressSheet>{
  dateGroup date=dateGroup.invoices;
  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      backgroundColor: MyColors.MainColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ));
  final _formKey = GlobalKey<FormState>();

  final addressController = Get.put(AddressController());

  @override
  void initState() {
    addressController.addressTxtController.clear();
    addressController.cityController.clear();
    addressController.stateController.clear();
    addressController.zipCodeController.clear();
    addressController.streetController.clear();
    addressController.isActive2.value=1;
    addressController.isActive=false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
          border: Border.all(color: MyColors.Dark5, width: 1.0,),
          color: Colors.white),
      padding: EdgeInsets.only(right: 1.5.h,left: 1.5.h,top: 1.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          customBar(),
          address(),
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
              Text('add_new_address'.tr(),
                style:  TextStyle(fontSize: 16.sp,
                    fontFamily: 'medium',
                    fontWeight: FontWeight.w500,
                    color: MyColors.Dark1),),
              IconButton(
                  icon: SvgPicture.asset('assets/close_circle.svg'),
                  onPressed:(){
                    Navigator.pop(context);
                    addressController.addressTxtController.clear();
                    addressController.cityController.clear();
                    addressController.stateController.clear();
                    addressController.zipCodeController.clear();
                    addressController.streetController.clear();
                  }
              ),
            ],
          ),
          SizedBox(height: 2.h,),
        ],
      ),
    );
  }

  Widget address(){
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //type(),
          //SizedBox(height: 1.h,),
          mainAddress(),
          SizedBox(height: 1.h,),
          SizedBox(
            height: 5.h,
            child: CheckboxListTile(
              checkColor: Colors.white,
              contentPadding: const EdgeInsets.all(0),
              controlAffinity: ListTileControlAffinity.leading,
              value: addressController.isActive,
              activeColor: MyColors.MainColor,
              title: Text(
                'default'.tr(),
                style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: 'regular',
                    fontWeight: FontWeight.w400,
                    color: MyColors.Dark2),
              ),
              onChanged: (value) {
                setState(() {
                  addressController.isActive = value!;
                });
              },
            ),
          ),
          /*SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 53,
              child: Row(
                children: [
                  Obx(() =>   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Radio(
                            activeColor:MyColors.MainColor,
                            value: 1,
                            groupValue: addressController.isActive2.value,
                            onChanged: (value){
                              setState(() {
                                addressController.isActive.value=false;
                                addressController.isActive2.value=1;
                                //value=addDelegateController.isActive.value;
                              });
                            },
                          ),
                          const SizedBox(width: 5,),
                          Text( "inActive")
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            activeColor:MyColors.MainColor,
                            value: 0,
                            groupValue: addressController.isActive2.value,
                            onChanged: (value){
                              setState(() {
                                addressController.isActive.value=true;
                                addressController.isActive2.value=0;
                              });

                            },),
                          const SizedBox(width: 5,),
                          Text("defult")
                        ],
                      ),

                    ],)),
                ],
              )
          ),*/
          SizedBox(height: 1.h,),
          country(),
          SizedBox(height: 1.h,),
          state(),
          SizedBox(height: 1.h,),
          streetAddress(),
          SizedBox(height: 1.h,),
          Center(
            child: Obx(() =>
                Visibility(
                    visible: addressController.isVisable.value,
                    child: const CircularProgressIndicator(color: MyColors.MainColor,)
                )),
          ),
          SizedBox(height: 1.h,),
          SizedBox(
            width: double.infinity,
            height: 8.h,
            child: TextButton(
              style: flatButtonStyle,
              onPressed: () {
                if(_formKey.currentState!.validate()){
                  if(widget.from=="createOrder"){
                    addressController.addAddressForOrder(context);
                  }else{
                    addressController.addAddress(context);
                  }

                }
              },
              child: Text('save_address'.tr(),
                style:  TextStyle(fontSize: 12.sp,
                    fontFamily: 'regular',
                    fontWeight: FontWeight.w700,
                    color: Colors.white),),
            ),
          ),
        ],
      ),
    );
  }

  Widget type(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('type2'.tr(),
          style:  TextStyle(fontSize: 12.sp,
              fontFamily: 'regular',
              fontWeight: FontWeight.w400,
              color: MyColors.Dark1),),
        Row(
          children: [
            Row(
              children: [
                Radio(
                  activeColor: MyColors.Dark2,
                  value: dateGroup.invoices,
                  groupValue: date,
                  onChanged: (dateGroup? val){
                    setState(() {
                      date = val!;
                    });
                  },
                ),
                Text('invoices'.tr(),
                  style:  TextStyle(fontSize: 14.sp,
                      fontFamily: 'regular',
                      fontWeight: FontWeight.w400,
                      color: MyColors.Dark2),)
              ],
            ),
            SizedBox(width: 1.h,),
            Row(
              children: [
                Radio(
                  activeColor: MyColors.Dark2,
                  value: dateGroup.delivery_address,
                  groupValue: date,
                  onChanged: (dateGroup? val){
                    setState(() {
                      date = val!;
                    });
                  },
                ),
                Text('delivery_address2'.tr(),
                  style:  TextStyle(fontSize: 14.sp,
                      fontFamily: 'regular',
                      fontWeight: FontWeight.w400,
                      color: MyColors.Dark2),)
              ],
            ),
          ],
        )
      ],
    );
  }

  Widget mainAddress(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('address'.tr(),
          style:  TextStyle(fontSize: 12.sp,
              fontFamily: 'regular',
              fontWeight: FontWeight.w400,
              color: MyColors.Dark1),),
        Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: Border.all(color: MyColors.Dark5, width: 1.0,),
              color: Colors.white),
          child: addAddress(),
        ),
      ],
    );
  }

  Widget addAddress (){
    return TextFormField(
      autovalidateMode:AutovalidateMode.onUserInteraction ,
      controller: addressController.addressTxtController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'please_enter_address'.tr();
        }
        return null;
      },
      maxLines: 1,
      decoration: InputDecoration(
        errorBorder:  const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.red,style: BorderStyle.solid),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.white70,style: BorderStyle.solid),
        ),
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(style: BorderStyle.solid,color: Colors.white70,)
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.red,style: BorderStyle.solid),
        ) ,
        hintText: 'address'.tr(),
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
    );
  }

  Widget country(){
    return Row(
      children: [
        /*Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('country'.tr(),
                style:  TextStyle(fontSize: 12.sp,
                    fontFamily: 'regular',
                    fontWeight: FontWeight.w400,
                    color: MyColors.Dark1),),
              Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: MyColors.Dark5, width: 1.0,),
                    color: Colors.white),
                child: countryText(),
              ),
            ],
          ),
        ),
        SizedBox(width: 1.h,),*/
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('city'.tr(),
                style:  TextStyle(fontSize: 12.sp,
                    fontFamily: 'regular',
                    fontWeight: FontWeight.w400,
                    color: MyColors.Dark1),),
              Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: MyColors.Dark5, width: 1.0,),
                    color: Colors.white),
                child: cityText(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget countryText (){
    return TextFormField(
      autovalidateMode:AutovalidateMode.onUserInteraction ,
      controller: addressController.countryController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'please_enter_country'.tr();
        }
        return null;
      },
      maxLines: 1,
      decoration: InputDecoration(
        errorBorder:  const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.red,style: BorderStyle.solid),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.white70,style: BorderStyle.solid),
        ),
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(style: BorderStyle.solid,color: Colors.white70,)
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.red,style: BorderStyle.solid),
        ) ,
        hintText: 'country'.tr(),
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
    );
  }

  Widget cityText (){
    return TextFormField(
      autovalidateMode:AutovalidateMode.onUserInteraction ,
      controller: addressController.cityController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'please_enter_city'.tr();
        }
        return null;
      },
      maxLines: 1,
      decoration: InputDecoration(
        errorBorder:  const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.red,style: BorderStyle.solid),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.white70,style: BorderStyle.solid),
        ),
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(style: BorderStyle.solid,color: Colors.white70,)
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.red,style: BorderStyle.solid),
        ) ,
        hintText: 'city'.tr(),
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
    );
  }

  Widget state(){
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('state'.tr(),
                style:  TextStyle(fontSize: 12.sp,
                    fontFamily: 'regular',
                    fontWeight: FontWeight.w400,
                    color: MyColors.Dark1),),
              Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: MyColors.Dark5, width: 1.0,),
                    color: Colors.white),
                child: stateText(),
              ),
            ],
          ),
        ),
        SizedBox(width: 1.h,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('zip_code'.tr(),
                style:  TextStyle(fontSize: 12.sp,
                    fontFamily: 'regular',
                    fontWeight: FontWeight.w400,
                    color: MyColors.Dark1),),
              Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: MyColors.Dark5, width: 1.0,),
                    color: Colors.white),
                child: zipCodeText(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget stateText (){
    return TextFormField(
      autovalidateMode:AutovalidateMode.onUserInteraction ,
      controller: addressController.stateController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'please_enter_state'.tr();
        }
        return null;
      },
      maxLines: 1,
      decoration: InputDecoration(
        errorBorder:  const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.red,style: BorderStyle.solid),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.white70,style: BorderStyle.solid),
        ),
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(style: BorderStyle.solid,color: Colors.white70,)
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.red,style: BorderStyle.solid),
        ) ,
        hintText: 'state'.tr(),
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
    );
  }

  Widget zipCodeText (){
    return TextFormField(
      autovalidateMode:AutovalidateMode.onUserInteraction ,
      controller: addressController.zipCodeController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'please_enter_zip_code'.tr();
        }
        return null;
      },
      maxLines: 1,
      decoration: InputDecoration(
        errorBorder:  const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.red,style: BorderStyle.solid),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.white70,style: BorderStyle.solid),
        ),
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(style: BorderStyle.solid,color: Colors.white70,)
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.red,style: BorderStyle.solid),
        ) ,
        hintText: 'zip_code'.tr(),
        hintStyle:  TextStyle(fontSize: 12.sp,
            fontFamily: 'regular',
            fontWeight: FontWeight.w400,
            color: MyColors.Dark3),
      ),
      style:  TextStyle(fontSize: 12.sp,
          fontFamily: 'regular',
          fontWeight: FontWeight.w400,
          color: MyColors.Dark3),
      keyboardType: TextInputType.phone,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly,],
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
    );
  }

  Widget streetAddress(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('street_address'.tr(),
          style:  TextStyle(fontSize: 12.sp,
              fontFamily: 'regular',
              fontWeight: FontWeight.w400,
              color: MyColors.Dark1),),
        Container(
          height: 13.h,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: Border.all(color: MyColors.Dark5, width: 1.0,),
              color: Colors.white),
          child: streetText(),
        ),
      ],
    );
  }

  Widget streetText (){
    return TextFormField(
      autovalidateMode:AutovalidateMode.onUserInteraction ,
      controller: addressController.streetController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'please_enter_street'.tr();
        }
        return null;
      },
      maxLines: 1,
      decoration: InputDecoration(
        errorBorder:  const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.red,style: BorderStyle.solid),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.white70,style: BorderStyle.solid),
        ),
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(style: BorderStyle.solid,color: Colors.white70,)
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.red,style: BorderStyle.solid),
        ) ,
        hintText: 'street_address'.tr(),
        hintStyle:  TextStyle(
            fontSize: 12.sp,
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
    );
  }
}