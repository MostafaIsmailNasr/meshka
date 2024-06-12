import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:sizer/sizer.dart';

import '../../../../business/categoryProductsController/CategoryProductsController.dart';
import '../../../../conustant/my_colors.dart';

// ignore: camel_case_types, constant_identifier_names
enum dateGroup{kk,created_at,orders_count,min_price,max_price}
class FilterByScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _FilterByScreen();
  }
}

class _FilterByScreen extends State<FilterByScreen>{
  dateGroup date=dateGroup.kk;
  final categoryProductsController = Get.put(CategoryProductsController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 1.h,left: 1.h,top: 1.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          customBar(),
          filter(),
        ],
      ),
    );
  }

  Widget customBar(){
    return Container(
      margin: EdgeInsetsDirectional.only(end: 1.h,start: 1.h,top: 1.h),
      child: SizedBox(
        height: 5.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('filter_by'.tr(),
              style:  TextStyle(fontSize: 16.sp,
                  fontFamily: 'medium',
                  fontWeight: FontWeight.w500,
                  color: MyColors.Dark1),),
            IconButton(
                icon: SvgPicture.asset('assets/close_circle.svg'),
                onPressed:(){
                  Navigator.pop(context);
                }
            ),

          ],
        ),
      ),
    );
  }

  Widget filter(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RadioListTile(
          activeColor: MyColors.MainColor,
          contentPadding: const EdgeInsets.all(0),
          title: Text('older_books'.tr(),
            style:  TextStyle(fontSize: 14.sp,
                fontFamily: 'regular',
                fontWeight: FontWeight.w400,
                color: MyColors.Dark1),),
          value: dateGroup.created_at,
          groupValue: date,
          onChanged: (dateGroup? val){
            setState(() {
              date = val!;
              categoryProductsController.page=1;
              categoryProductsController.productCatList.clear();
              categoryProductsController.sortedBy="ASC";
              categoryProductsController.orderBy="created_at";
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
            });
          },
        ),
        SvgPicture.asset('assets/saperator.svg',width: MediaQuery.of(context).size.width,),
        RadioListTile(
          activeColor: MyColors.MainColor,
          contentPadding: const EdgeInsets.all(0),
          title: Text('the_most_famous_books'.tr(),
            style:  TextStyle(fontSize: 14.sp,
                fontFamily: 'regular',
                fontWeight: FontWeight.w400,
                color: MyColors.Dark1),),
          value: dateGroup.orders_count,
          groupValue: date,
          onChanged: (dateGroup? val){
            setState(() {
              date = val!;
              categoryProductsController.page=1;
              categoryProductsController.sortedBy="DESC";
              categoryProductsController.orderBy="orders_count";
              categoryProductsController.productCatList.clear();
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
            });
          },
        ),
        SvgPicture.asset('assets/saperator.svg',width: MediaQuery.of(context).size.width,),
        RadioListTile(
          activeColor: MyColors.MainColor,
          contentPadding: const EdgeInsets.all(0),
          title: Text('price_from_lowest_to_highest'.tr(),
            style:  TextStyle(fontSize: 14.sp,
                fontFamily: 'regular',
                fontWeight: FontWeight.w400,
                color: MyColors.Dark1),),
          value: dateGroup.min_price,
          groupValue: date,
          onChanged: (dateGroup? val){
            setState(() {
              date = val!;
              categoryProductsController.page=1;
              categoryProductsController.sortedBy="ASC";
              categoryProductsController.orderBy="min_price";
              categoryProductsController.productCatList.clear();
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
            });
          },
        ),
        SvgPicture.asset('assets/saperator.svg',width: MediaQuery.of(context).size.width,),
        RadioListTile(
          activeColor: MyColors.MainColor,
          contentPadding: const EdgeInsets.all(0),
          title: Text('price_from_highest_to_lowest'.tr(),
            style:  TextStyle(fontSize: 14.sp,
                fontFamily: 'regular',
                fontWeight: FontWeight.w400,
                color: MyColors.Dark1),),
          value: dateGroup.max_price,
          groupValue: date,
          onChanged: (dateGroup? val){
            setState(() {
              date = val!;
              categoryProductsController.page=1;
              categoryProductsController.sortedBy="DESC";
              categoryProductsController.orderBy="max_price";
              categoryProductsController.getCategoryProduct(
                  categoryProductsController.page,
                  categoryProductsController.slug,
                  categoryProductsController.sortedBy,
                  categoryProductsController.orderBy,
                  categoryProductsController.sendCatName,
                  categoryProductsController.sendBrandName,
                  categoryProductsController.sendPrice,
                  categoryProductsController.tags
              );
              Navigator.pop(context);
            });
          },
        ),
      ],
    );
  }


}