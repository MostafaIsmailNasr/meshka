import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sizer/sizer.dart';

import '../../conustant/my_colors.dart';
import '../../data/model/auth/UserDataModel/UserDataResponse.dart';
import '../screens/createOrder/buttomSheets/deleteSheet/delet_sheet.dart';
import '../screens/createOrder/buttomSheets/editAddressSheet/edit_address_sheet.dart';

class  MyAddressItem extends StatefulWidget{
  final Address address;
  // final addressListController = Get.put(AddressListController());
  MyAddressItem({required this.address});
  @override
  State<StatefulWidget> createState() {
    return _MyAddressItem();
  }

}

class _MyAddressItem extends State<MyAddressItem> with TickerProviderStateMixin{


  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsetsDirectional.only(bottom: 1.h),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          border: Border.all(color: MyColors.Dark5, width: 1.0,),
          color:Colors.white),
      child: Padding(
        padding:  EdgeInsets.all(1.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 30.h,
                  child: Text(widget.address.title??"",
                    style:  TextStyle(fontSize: 12.sp,
                        fontFamily: 'medium',
                        fontWeight: FontWeight.w500,
                        color: MyColors.MainColor),maxLines: 2,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                    onTap: (){
                      showModalBottomSheet<void>(
                          transitionAnimationController: AnimationController(vsync: this,duration: const Duration(seconds: 1)),
                          isScrollControlled: true,
                          context: context,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                          ),
                          //backgroundColor:MyColors.Dark5,
                          builder: (BuildContext context)=>DraggableScrollableSheet(
                              expand: false,
                              initialChildSize: 0.85,
                              minChildSize: 0.32,
                              maxChildSize: 0.9,
                              builder: (BuildContext context, ScrollController scrollController)=> SingleChildScrollView(
                                controller:scrollController,
                                child: EditAddressSheet(address: widget.address),
                              )
                            //return FilterOrdersScreen();
                          )
                      );
                    },
                    child: SvgPicture.asset('assets/edit2.svg',)),
                 SizedBox(width: 1.5.h,),
                GestureDetector(
                    onTap: (){
                      //_onAlertButtonsPressed(context);
                      showModalBottomSheet<void>(
                          isScrollControlled: true,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                          ),
                          context: context,
                          backgroundColor: Colors.white,
                          builder: (BuildContext context) => Padding(
                              padding: EdgeInsets.only(
                                  bottom: MediaQuery.of(context).viewInsets.bottom),
                              child: DeleteScreen(
                                  id: widget.address.id!,
                                tittle: 'delete_location'.tr(),
                                des: 'are_you_sure_you_want_to_delete_location'.tr(),
                                  from: "address",cartItems: null,)));
                    },
                    child: SvgPicture.asset('assets/delete2.svg',))
              ],
            ),
             SizedBox(height: 1.h,),
            SizedBox(
              width: 30.h,
              child: Text(widget.address.address?.streetAddress??"",
                style:  TextStyle(fontSize: 12.sp,
                    fontFamily: 'regular',
                    fontWeight: FontWeight.w400,
                    color: MyColors.MainTint1),maxLines: 2,
              ),
            ),
            SizedBox(height: 1.h,),
          ],
        ),
      ),
    );
  }


  _onAlertButtonsPressed(context) {
    Alert(
      context: context,
      image: SvgPicture.asset('assets/delete2.svg',width: 100,height: 100,),
      title: 'delete_location'.tr(),
      style:  AlertStyle(
          titleStyle:TextStyle(fontSize: 16.sp,
              fontFamily: 'lexend_bold',
              fontWeight: FontWeight.w800,
              color: MyColors.Dark1),
          descStyle: TextStyle(fontSize: 10.sp,
              fontFamily: 'lexend_regular',
              fontWeight: FontWeight.w400,
              color: MyColors.Dark2),
          backgroundColor: Colors.white
      ),
      desc: 'are_you_sure_you_want_to_delete_location'.tr(),
      buttons: [
        DialogButton(
          radius: BorderRadius.circular(50),
          height: 7.h,
          child: Text('delete'.tr(), style:  TextStyle(fontSize: 12.sp,
              fontFamily: 'lexend_bold',
              fontWeight: FontWeight.w700,
              color: Colors.white)),
          onPressed: () => {
          },
          color: MyColors.SecondryColor,
        ),
        DialogButton(
          height: 7.h,
          radius: BorderRadius.circular(50),
          child: Text('cancel'.tr(), style:  TextStyle(fontSize: 12.sp,
              fontFamily: 'lexend_bold',
              fontWeight: FontWeight.w700,
              color: Colors.white)),
          onPressed: () {
            Navigator.pop(context);
          },
          color: MyColors.MainColor,

        )
      ],
    ).show();
  }

}