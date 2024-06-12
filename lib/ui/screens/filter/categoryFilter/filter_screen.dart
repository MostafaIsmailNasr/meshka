import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:mashkah_library/conustant/toast_class.dart';
import 'package:sizer/sizer.dart';

import '../../../../business/categoryProductsController/CategoryProductsController.dart';
import '../../../../conustant/my_colors.dart';
import '../../../../data/model/home/categoryModel/CategoryResponse.dart';
import 'dart:math' as math;

import '../../../widget/priceItem.dart';

class FilterScreen extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _FilterScreen();
  }
}

class _FilterScreen extends State<FilterScreen>{
  List<bool> checkedList2 = List.generate(6, (index) => false);
  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      backgroundColor: MyColors.MainColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ));
  final categoryProductsController = Get.put(CategoryProductsController());
  var firstNum=0;
  var secoundNum=0;

  @override
  void initState() {
    categoryProductsController.getCategories("filter");
    categoryProductsController.getBrands();
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
      padding: EdgeInsets.only(right: 1.h,left: 1.h,top: 1.h,bottom: 9.h),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            customBar(),
            filter(),
          ],
        ),
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                //style: flatButtonStyle,
                onPressed: () async{
                  if(categoryProductsController.sendCatList.isNotEmpty
                      ||categoryProductsController.sendBrandList.isNotEmpty
                      ||categoryProductsController.isCheckedPrice50==true
                      ||categoryProductsController.isCheckedPrice100==true
                      ||categoryProductsController.isCheckedPrice150==true
                      ||categoryProductsController.isCheckedPrice200==true
                      ||categoryProductsController.isCheckedPrice300==true
                      ||categoryProductsController.isCheckedPrice500==true
                      ||categoryProductsController.isCheckedPrice1000==true
                      ||categoryProductsController.isCheckedPrice1100==true) {
                    categoryProductsController.page = 1;
                    categoryProductsController.productCatList.clear();
                    categoryProductsController.sendPrice == "0,0"
                        ? ""
                        : categoryProductsController.sendPrice;
                    categoryProductsController.isVisable.value = true;
                    categoryProductsController.getCategoryProduct(
                        categoryProductsController.page,
                        categoryProductsController.slug,
                        categoryProductsController.sortedBy,
                        categoryProductsController.orderBy,
                        categoryProductsController.sendCatName,
                        categoryProductsController.sendBrandName,
                        categoryProductsController.sendPrice,
                        categoryProductsController.tags);
                    Navigator.pop(context);
                  }else{
                    ToastClass.showCustomToast(context, "choose any item to filter", "error");
                  }
                },
                child: Text('apply'.tr(),
                  style:  TextStyle(fontSize: 14.sp,
                      fontFamily: 'regular',
                      fontWeight: FontWeight.w500,
                      color: MyColors.MainColor),),
              ),
              Text('filter'.tr(),
                style:  TextStyle(fontSize: 16.sp,
                    fontFamily: 'medium',
                    fontWeight: FontWeight.w500,
                    color: MyColors.Dark1),textAlign: TextAlign.center,),
              //const Spacer(),

              //SizedBox(width: 1.h,),
              /*InkWell(
                onTap: (){
                  setState(() {
                    clearData();
                  });
                },
                child: SvgPicture.asset('assets/refresh.svg'),
              ),*/
              IconButton(
                  icon: SvgPicture.asset('assets/close_circle.svg'),
                  onPressed:(){
                    setState(() {
                      clearData();
                      Navigator.pop(context);
                    });
                  }
              ),

            ],
          ),
          SizedBox(height: 1.h,),
          SvgPicture.asset('assets/saperator.svg',width: MediaQuery.of(context).size.width,),
          SizedBox(height: 2.h,),
          /*Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('filter'.tr(),
                style:  TextStyle(fontSize: 16.sp,
                    fontFamily: 'medium',
                    fontWeight: FontWeight.w500,
                    color: MyColors.Dark1),),
              InkWell(
                onTap: (){
                  setState(() {
                    clearData();
                  });
                },
                child: Text('reset'.tr(),
                  style:  TextStyle(fontSize: 12.sp,
                      fontFamily: 'regular',
                      fontWeight: FontWeight.w400,
                      color: MyColors.MainColor),),
              ),
            ],
          ),
          SizedBox(height: 2.h,),
          SvgPicture.asset('assets/saperator.svg',width: MediaQuery.of(context).size.width,),
          SizedBox(height: 1.5.h,),*/
        ],
      ),
    );
  }

  Widget filter(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('categories'.tr(),
          style:  TextStyle(fontSize: 14.sp,
              fontFamily: 'regular',
              fontWeight: FontWeight.w400,
              color: MyColors.Dark2),),
        SizedBox(height: 1.h,),
        Obx(() => !categoryProductsController.isLoadingCat.value? categoryList()
          : const Center(child: CircularProgressIndicator(color: MyColors.MainColor,))),
        SizedBox(height: 1.h,),
        SvgPicture.asset('assets/saperator.svg',width: MediaQuery.of(context).size.width,),
        SizedBox(height: 1.h,),
        Text('brands'.tr(),
          style:  TextStyle(fontSize: 14.sp,
              fontFamily: 'regular',
              fontWeight: FontWeight.w400,
              color: MyColors.Dark2),),
        Obx(() =>
        !categoryProductsController.isLoadingBrands.value ? brandsList()
            : const Center(
            child: CircularProgressIndicator(color: MyColors.MainColor,))),
        SizedBox(height: 1.h,),
        SvgPicture.asset('assets/saperator.svg',width: MediaQuery.of(context).size.width,),
        SizedBox(height: 1.h,),
        Text('price'.tr(),
          style:  TextStyle(fontSize: 14.sp,
              fontFamily: 'regular',
              fontWeight: FontWeight.w400,
              color: MyColors.Dark2),),
        PriceItem(),
        SizedBox(height: 1.h,),
        Center(
          child: Obx(() =>
              Visibility(
                  visible: categoryProductsController.isVisable.value,
                  child: const CircularProgressIndicator(color: MyColors.MainColor,)
              )),
        ),
      ],
    );
  }

  Widget categoryList(){
    return
      ListView.builder(
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: categoryProductsController.categoryList.length,
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 5.h,
            child: CheckboxListTile(
              checkColor: Colors.white,
              contentPadding: const EdgeInsets.all(0),
              controlAffinity: ListTileControlAffinity.leading,
              value: categoryProductsController.selectedIds.contains(categoryProductsController.categoryList[index].id),
              activeColor: MyColors.MainColor,
              title: Text(categoryProductsController.categoryList[index]?.name ?? "", style: TextStyle(fontSize: 14.sp,
                  fontFamily: 'regular',
                  fontWeight: FontWeight.w400,
                  color: MyColors.Dark2),),
              onChanged: (value) {
                setState(() {
                  if (value == true) {
                    categoryProductsController.selectedIds.add(categoryProductsController.categoryList[index].id);
                    categoryProductsController.sendCatList.add(
                        categoryProductsController.categoryList[index].name!);
                    categoryProductsController.sendCatName =
                        categoryProductsController.sendCatList.join(",")
                            .toString();
                    print("cattt " + categoryProductsController.sendCatName);
                  } else {
                    categoryProductsController.selectedIds.remove(categoryProductsController.categoryList[index].id);
                    categoryProductsController.sendCatList.removeLast();
                    categoryProductsController.sendCatName =
                        categoryProductsController.sendCatList.join(",")
                            .toString();
                    print("cattt2 " + categoryProductsController.sendCatName);
                  }
                });
              },
            ),
          );
        },
      );
  }

  Widget brandsList(){
    return
      ListView.builder(
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: categoryProductsController.brandsList.length,
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 5.h,
            child: CheckboxListTile(
              checkColor: Colors.white,
              contentPadding: const EdgeInsets.all(0),
              controlAffinity: ListTileControlAffinity.leading,
              value: categoryProductsController.selectedIdsBrands.contains(categoryProductsController.brandsList[index].id),
              activeColor: MyColors.MainColor,
              title: Text(categoryProductsController.brandsList[index]?.name ?? "", style: TextStyle(fontSize: 14.sp,
                  fontFamily: 'regular',
                  fontWeight: FontWeight.w400,
                  color: MyColors.Dark2),),
              onChanged: (value) {
                setState(() {
                  if (value == true) {
                    categoryProductsController.selectedIdsBrands.add(categoryProductsController.brandsList[index].id);
                    categoryProductsController.sendBrandList.add(categoryProductsController.brandsList[index].name!);
                    categoryProductsController.sendBrandName=categoryProductsController.sendBrandList.join(",").toString();
                    print("brand ${categoryProductsController.sendBrandName}");
                  } else {
                    categoryProductsController.selectedIdsBrands.remove(categoryProductsController.brandsList[index].id);
                    categoryProductsController.sendBrandList.removeLast();
                    categoryProductsController.sendBrandName=categoryProductsController.sendBrandList.join(",").toString();
                    print("brand2 ${categoryProductsController.sendBrandName}");
                  }
                });
              },
            ),
          );
        },
      );
  }

  void clearData() {
    categoryProductsController.sendCatName="";
    categoryProductsController.sendBrandName="";
    categoryProductsController.selectedIds.clear();
    categoryProductsController.selectedIdsBrands.clear();
    categoryProductsController.isCheckedPrice50=false;
    categoryProductsController.isCheckedPrice100=false;
    categoryProductsController.isCheckedPrice150=false;
    categoryProductsController.isCheckedPrice200=false;
    categoryProductsController.isCheckedPrice300=false;
    categoryProductsController.isCheckedPrice500=false;
    categoryProductsController.isCheckedPrice1000=false;
    categoryProductsController.isCheckedPrice1100=false;
    categoryProductsController.sendPrice="";
    categoryProductsController.sendCatList.clear();
    categoryProductsController.sendBrandList.clear();
    categoryProductsController.priceList.clear();
  }


}