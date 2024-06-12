import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:sizer/sizer.dart';

import '../../../../../business/createOrderController/CreateOrderController.dart';
import '../../../../../business/homeController/HomeController.dart';
import '../../../../../business/more/addressController/AddressController.dart';
import '../../../../../conustant/my_colors.dart';
import '../../../../widget/ChooseAddressItem.dart';


class ChooseAddress extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _ChooseAddress();
  }
}

class _ChooseAddress extends State<ChooseAddress>{
  var selectedFlageTime;
  final addressController = Get.put(AddressController());
  final homeController = Get.put(HomeController());
  final createOrderController = Get.put(CreateOrderController());
  @override
  void initState() {
    addressController.getAddressList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 2.h,left: 2.h,top: 1.h,bottom: 1.h),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomBar(),
            SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 37.h,
                child: Obx(() => !addressController.isLoading.value?AddressList()
                    :const Center(child: CircularProgressIndicator(color: MyColors.MainColor,),))
            ),
            SizedBox(height: 2.h,),
            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, '/my_location_screen');
              },
              child: Text('add_new_address'.tr(),
                style:  TextStyle(fontSize: 12.sp,
                    fontFamily: 'bold',
                    fontWeight: FontWeight.w400,
                    color: MyColors.MainColor),
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget CustomBar(){
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 3.h,),
        SizedBox(
          height: 4.h,
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              Text('delivery_address2'.tr(),
                style:  TextStyle(fontSize: 12.sp,
                    fontFamily: 'bold',
                    fontWeight: FontWeight.w700,
                    color: MyColors.Dark1),
              ),
              const Spacer(),
              IconButton(iconSize: 3.h,
                  icon: const Icon(Icons.close),
                  color: MyColors.Dark3,
                  onPressed:(){
                    Navigator.pop(context);
                  }
              ),


            ],
          ),
        ),
        SizedBox(height: 1.h,),
      ],
    );
  }

  Widget AddressList(){
    if(addressController.addressList.isNotEmpty){
      return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: addressController.addressList.length,
        itemBuilder: (BuildContext context, int index) {
            return ChooseAddressItem(
                is_selected: selectedFlageTime==index,
                onTap: () {
                    setState(() {
                      selectedFlageTime=index;
                      createOrderController.streetAddress.value=addressController.addressResponse.value.address?[index].address?.streetAddress??"";
                      createOrderController.countryAddress.value=addressController.addressResponse.value.address?[index].address?.city??"";
                      createOrderController.zipAddress.value=addressController.addressResponse.value.address?[index].address?.zip??"";
                      createOrderController.tittleAddress.value=addressController.addressResponse.value.address?[index].title??"";
                      Navigator.pop(context);
                    });

                },
                address: addressController.addressList[index]
            );

        },
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
      margin: EdgeInsets.only(top: 8.h),
      child: Center(
        child: Column(
          children: [
            SvgPicture.asset('assets/empty.svg'),
            SizedBox(height: 1.h,),
            Text('there_are_no_address'.tr(),
              style: TextStyle(fontSize: 14.sp,
                  fontFamily: 'bold',
                  fontWeight: FontWeight.w500,
                  color: MyColors.Dark1),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 1.h,),
          ],
        ),
      ),
    );
  }

}