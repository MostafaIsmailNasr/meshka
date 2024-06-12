import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:sizer/sizer.dart';

import '../../business/categoryProductsController/CategoryProductsController.dart';
import '../../conustant/my_colors.dart';

class PriceItem extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _PriceItem();
  }

}

class _PriceItem extends State<PriceItem>{
  final categoryProductsController = Get.put(CategoryProductsController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 5.h,
          child: CheckboxListTile(
            checkColor: Colors.white,
            contentPadding: const EdgeInsets.all(0),
            controlAffinity: ListTileControlAffinity.leading,
            value: categoryProductsController.isCheckedPrice50,
            activeColor: MyColors.MainColor,
            title: Text(
              'under50'.tr(),
              style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: 'regular',
                  fontWeight: FontWeight.w400,
                  color: MyColors.Dark2),
            ),
            onChanged: (value) {
              setState(() {
                categoryProductsController.isCheckedPrice50 = value!;
                addToList(0, 50);
              });
            },
          ),
        ),
        SizedBox(
          height: 5.h,
          child: CheckboxListTile(
            checkColor: Colors.white,
            contentPadding: const EdgeInsets.all(0),
            controlAffinity: ListTileControlAffinity.leading,
            value: categoryProductsController.isCheckedPrice100,
            activeColor: MyColors.MainColor,
            title: Text(
              '50to100'.tr(),
              style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: 'regular',
                  fontWeight: FontWeight.w400,
                  color: MyColors.Dark2),
            ),
            onChanged: (value) {
              setState(() {
                categoryProductsController.isCheckedPrice100 = value!;
                addToList(50,100);
              });
            },
          ),
        ),
        SizedBox(
          height: 5.h,
          child: CheckboxListTile(
            checkColor: Colors.white,
            contentPadding: const EdgeInsets.all(0),
            controlAffinity: ListTileControlAffinity.leading,
            value: categoryProductsController.isCheckedPrice150,
            activeColor: MyColors.MainColor,
            title: Text(
              '100to150'.tr(),
              style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: 'regular',
                  fontWeight: FontWeight.w400,
                  color: MyColors.Dark2),
            ),
            onChanged: (value) {
              setState(() {
                categoryProductsController.isCheckedPrice150 = value!;
                addToList(100,150);
              });
            },
          ),
        ),
        SizedBox(
          height: 5.h,
          child: CheckboxListTile(
            checkColor: Colors.white,
            contentPadding: const EdgeInsets.all(0),
            controlAffinity: ListTileControlAffinity.leading,
            value: categoryProductsController.isCheckedPrice200,
            activeColor: MyColors.MainColor,
            title: Text(
              '150to200'.tr(),
              style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: 'regular',
                  fontWeight: FontWeight.w400,
                  color: MyColors.Dark2),
            ),
            onChanged: (value) {
              setState(() {
                categoryProductsController.isCheckedPrice200 = value!;
                addToList(150,200);
              });
            },
          ),
        ),
        SizedBox(
          height: 5.h,
          child: CheckboxListTile(
            checkColor: Colors.white,
            contentPadding: const EdgeInsets.all(0),
            controlAffinity: ListTileControlAffinity.leading,
            value: categoryProductsController.isCheckedPrice300,
            activeColor: MyColors.MainColor,
            title: Text(
              '200to300'.tr(),
              style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: 'regular',
                  fontWeight: FontWeight.w400,
                  color: MyColors.Dark2),
            ),
            onChanged: (value) {
              setState(() {
                categoryProductsController.isCheckedPrice300 = value!;
                addToList(200,300);
              });
            },
          ),
        ),
        SizedBox(
          height: 5.h,
          child: CheckboxListTile(
            checkColor: Colors.white,
            contentPadding: const EdgeInsets.all(0),
            controlAffinity: ListTileControlAffinity.leading,
            value: categoryProductsController.isCheckedPrice500,
            activeColor: MyColors.MainColor,
            title: Text(
              '300to500'.tr(),
              style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: 'regular',
                  fontWeight: FontWeight.w400,
                  color: MyColors.Dark2),
            ),
            onChanged: (value) {
              setState(() {
                categoryProductsController.isCheckedPrice500 = value!;
                addToList(300,500);
              });
            },
          ),
        ),
        SizedBox(
          height: 5.h,
          child: CheckboxListTile(
            checkColor: Colors.white,
            contentPadding: const EdgeInsets.all(0),
            controlAffinity: ListTileControlAffinity.leading,
            value: categoryProductsController.isCheckedPrice1000,
            activeColor: MyColors.MainColor,
            title: Text(
              '500to1000'.tr(),
              style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: 'regular',
                  fontWeight: FontWeight.w400,
                  color: MyColors.Dark2),
            ),
            onChanged: (value) {
              setState(() {
                categoryProductsController.isCheckedPrice1000 = value!;
                addToList(500,1000);
              });
            },
          ),
        ),
        SizedBox(
          height: 5.h,
          child: CheckboxListTile(
            checkColor: Colors.white,
            contentPadding: const EdgeInsets.all(0),
            controlAffinity: ListTileControlAffinity.leading,
            value: categoryProductsController.isCheckedPrice1100,
            activeColor: MyColors.MainColor,
            title: Text(
              'over1000'.tr(),
              style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: 'regular',
                  fontWeight: FontWeight.w400,
                  color: MyColors.Dark2),
            ),
            onChanged: (value) {
              setState(() {
                categoryProductsController.isCheckedPrice1100 = value!;
                if(value==true){
                  categoryProductsController.sendPrice="1000";
                }else{
                  var max= getMaxPrice(categoryProductsController.priceList);
                  var min= getMinPrice(categoryProductsController.priceList);
                  categoryProductsController.sendPrice="$min,$max";
                }
                print("p1 "+categoryProductsController.sendPrice.toString());
                print("pr1 "+categoryProductsController.priceList.toString());
              });
            },
          ),
        ),
       /* Row(
          children: [
            Checkbox(
              activeColor: MyColors.MainColor,
              value: categoryProductsController.isCheckedPrice1000,
              onChanged: (value) {
                setState(() {
                  categoryProductsController.isCheckedPrice1000 = value!;
                  addToList(500,1000);
                });
              },
            ),
            Text(
              '500to1000'.tr(),
              style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: 'regular',
                  fontWeight: FontWeight.w400,
                  color: MyColors.Dark2),
            ),
          ],
        ),*/
        /*Row(
          children: [
            Checkbox(
              activeColor: MyColors.MainColor,
              value: categoryProductsController.isCheckedPrice1100,
              onChanged: (value) {
                setState(() {
                  categoryProductsController.isCheckedPrice1100 = value!;
                  if(value==true){
                    categoryProductsController.sendPrice="1000";
                  }else{
                    var max= getMaxPrice(categoryProductsController.priceList);
                    var min= getMinPrice(categoryProductsController.priceList);
                    categoryProductsController.sendPrice="$min,$max";
                  }
                  print("p1 "+categoryProductsController.sendPrice.toString());
                  print("pr1 "+categoryProductsController.priceList.toString());
                });
              },
            ),
            Text(
              'over1000'.tr(),
              style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: 'regular',
                  fontWeight: FontWeight.w400,
                  color: MyColors.Dark2),
            ),
          ],
        ),*/
      ],
    );
  }

  int getMaxPrice(List<int> priceList) {
    if (priceList == null || priceList.isEmpty) {
      return 0;
    }
    int maxPrice = priceList[0];
    for (int price in priceList) {
      if (price > maxPrice) {
        maxPrice = price;
      }
    }
    return maxPrice;
  }

  int getMinPrice(List<int> priceList) {
    if (priceList == null || priceList.isEmpty) {
      // Handle the case when the list is empty or null
      return 0; // You can change this to an appropriate default value
    }
    int minPrice = priceList[0]; // Assume the first element is the max initially
    for (int price in priceList) {
      if (price < minPrice) {
        minPrice = price;
      }
    }
    return minPrice;
  }

  void addToList(int first, int last) {
    if(!categoryProductsController.priceList.contains(first)){
      categoryProductsController.priceList.add(first);
      var max= getMaxPrice(categoryProductsController.priceList);
      var min= getMinPrice(categoryProductsController.priceList);
      categoryProductsController.sendPrice="$min,$max";
    }else{
      categoryProductsController.priceList.remove(first);
      var max= getMaxPrice(categoryProductsController.priceList);
      var min= getMinPrice(categoryProductsController.priceList);
      categoryProductsController.sendPrice="$min,$max";
    }
    if(!categoryProductsController.priceList.contains(last)){
      categoryProductsController.priceList.add(last);
      var max= getMaxPrice(categoryProductsController.priceList);
      var min= getMinPrice(categoryProductsController.priceList);
      categoryProductsController.sendPrice="$min,$max";
    }else{
      categoryProductsController.priceList.remove(last);
      var max= getMaxPrice(categoryProductsController.priceList);
      var min= getMinPrice(categoryProductsController.priceList);
      categoryProductsController.sendPrice="$min,$max";
    }
    print("pr1 "+categoryProductsController.sendPrice.toString());
    print("pr1 "+categoryProductsController.priceList.toString());
  }

}