import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:sizer/sizer.dart';

import 'dart:math' as math;

import '../../../../business/more/addressController/AddressController.dart';
import '../../../../conustant/my_colors.dart';
import '../../../widget/MyAddressItem.dart';
import '../../createOrder/buttomSheets/addAddressSheet/add_address_sheet.dart';

class MyAddressScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MyAddressScreen();
  }
}

class _MyAddressScreen extends State<MyAddressScreen>with TickerProviderStateMixin {
  final addressController = Get.put(AddressController());
 //final changeLanguageController = Get.put(ChangeLanguageController());

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      addressController.getAddressList();
    });
    super.initState();
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
      body:Obx(() => !addressController.isLoading.value?
      Container(
        margin: EdgeInsetsDirectional.only(start: 2.h, end: 2.h, top: 2.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('delivery_addresses'.tr(), style:  TextStyle(fontSize: 16.sp,
                      fontFamily: 'bold',
                      fontWeight: FontWeight.w600,
                      color: MyColors.Dark1),),
                  GestureDetector(
                    onTap: (){
                      showModalBottomSheet<void>(
                          transitionAnimationController: AnimationController(vsync: this,duration: const Duration(seconds: 1)),
                          isScrollControlled: true,
                          context: context,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                          ),
                          backgroundColor: Colors.white,
                          //backgroundColor:MyColors.Dark5,
                          builder: (BuildContext context)=>DraggableScrollableSheet(
                              expand: false,
                              initialChildSize: 0.8,
                              minChildSize: 0.32,
                              maxChildSize: 0.8,
                              builder: (BuildContext context, ScrollController scrollController)=> SingleChildScrollView(
                                controller:scrollController,
                                child: AddAddressSheet(from: ""),
                              )
                            //return FilterOrdersScreen();
                          )
                      );
                    },
                    child: Row(
                      children: [

                        Text('add'.tr(), style:  TextStyle(fontSize: 12.sp,
                            fontFamily: 'regular',
                            fontWeight: FontWeight.w500,
                            color: MyColors.SecondryColor),),
                        SvgPicture.asset('assets/add8.svg'),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 2.h,),
              addressList(),
            ],
          ),
        ),
      )
          :const Center(child: CircularProgressIndicator(color: MyColors.MainColor),)
      ),
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

  Widget addressList() {
    if(addressController.addressList.isNotEmpty){
      return ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: addressController.addressList.length,
          itemBuilder: (context, int index) {
            return MyAddressItem(
                address: addressController.addressList[index]
            );
          }
      );
    }else{
      return empty();
    }
  }
}

class empty extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      //height: MediaQuery.of(context).size.height,
      margin: EdgeInsets.only(top: 20.h),
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SvgPicture.asset('assets/no_location2.svg'),
              SizedBox(height: 1.h,),
              Text('there_are_no_address'.tr(),
                style: TextStyle(fontSize: 14.sp,
                    fontFamily: 'bold',
                    fontWeight: FontWeight.w700,
                    color: MyColors.Dark1),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 1.h,),
              Text('there_are_no_address2'.tr(),
                style: TextStyle(fontSize: 14.sp,
                    fontFamily: 'bold',
                    fontWeight: FontWeight.w400,
                    color: MyColors.Dark1),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

}