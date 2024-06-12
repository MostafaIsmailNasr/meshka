import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mashkah_library/data/model/categoryProductModel/CategoryProductResponse.dart';
import 'package:sizer/sizer.dart';
import 'package:localize_and_translate/localize_and_translate.dart';


import '../../../../../conustant/my_colors.dart';
import '../../screens/productDetails/product_details_screen.dart';

class CategoryDetailsItem extends StatelessWidget{
  CategoryProduct? categoryProduct;

  CategoryDetailsItem({required this.categoryProduct});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) {
          return ProductDetailsScreen(productId: categoryProduct!.slug!,
            type: categoryProduct!.productType!,id: categoryProduct!.id!.toString(),);
        },));
        //Navigator.pushNamed(context, "/product_details_screen",arguments: categoryProduct?.slug!);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 29.h,
            child: Image.network(
              height: 29.h,
              width: 45.w,
              categoryProduct?.image?.original??"",
              fit: BoxFit.fill,
              loadingBuilder: (context, child, loadingProgress) =>
              (loadingProgress == null)
                  ? child
                  : const Center(child: CircularProgressIndicator(color: MyColors.MainColor,)),
              errorBuilder: (context, error, stackTrace) =>
               Center(child:  SvgPicture.asset('assets/logo_login.svg')),
            ),
          ),
          Expanded(
            child: Text(categoryProduct?.name??"", style:  TextStyle(fontSize: 12.sp,
                fontFamily: 'regular',
                fontWeight: FontWeight.w400,
                color:MyColors.MainColor),
                maxLines: 1,overflow: TextOverflow.ellipsis),
          ),
          /*SizedBox(
            width: 45.w,
            child: Text(categoryProduct?.description??"", style:  TextStyle(fontSize: 10.sp,
                fontFamily: 'light',
                fontWeight: FontWeight.w300,
                color:MyColors.MainTint1),maxLines: 2,),
          ),*/
          categoryProduct?.productType=="simple"?
          Row(
            children: [
              categoryProduct?.salePrice.toString()!="null"?
              Text("${categoryProduct?.salePrice.toString()??""} ${'currency'.tr()}",
                  style:  TextStyle(fontSize: 14.sp,
                    fontFamily: 'regular',
                    fontWeight: FontWeight.w700,
                    color:MyColors.MainColor,
                  ))
                  :Container(),
              SizedBox(width: 1.h,),
              categoryProduct?.salePrice.toString()!="null"?
              Text(categoryProduct?.price.toString()!="null"?
              "${categoryProduct?.price.toString()??""} ${'currency'.tr()}":"0 ${'currency'.tr()}",
                  style:  TextStyle(fontSize: 12.sp,
                      fontFamily: 'heavy',
                      fontWeight: FontWeight.w400,
                      color:MyColors.Dark4,
                      decoration: TextDecoration.lineThrough))
                  :Text(categoryProduct?.price.toString()!="null"?
              "${categoryProduct?.price.toString()??""} ${'currency'.tr()}":"0 ${'currency'.tr()}",
                  style:  TextStyle(fontSize: 14.sp,
                      fontFamily: 'heavy',
                      fontWeight: FontWeight.w700,
                      color:MyColors.MainColor)),
            ],
          )
          /*Row(
            children: [
              categoryProduct?.price.toString()!="null"?
              Text("${categoryProduct?.price.toString()??""} ${'currency'.tr()}", style:  TextStyle(fontSize: 14.sp,
                  fontFamily: 'heavy',
                  fontWeight: FontWeight.w700,
                  color:MyColors.MainColor))
                  :Text("0 ${'currency'.tr()}", style:  TextStyle(fontSize: 14.sp,
                  fontFamily: 'heavy',
                  fontWeight: FontWeight.w700,
                  color:MyColors.MainColor)),
              SizedBox(width: 1.h,),
              categoryProduct?.salePrice.toString()!="null"?
              Text("${categoryProduct?.salePrice.toString()??""} ${'currency'.tr()}", style:  TextStyle(fontSize: 12.sp,
                  fontFamily: 'regular',
                  fontWeight: FontWeight.w400,
                  color:MyColors.Dark4,
                  decoration: TextDecoration.lineThrough))
                  :Container(),
            ],
          )*/
              :
          Row(
            children: [
              categoryProduct?.maxPrice.toString()!="null"?
              Text("${categoryProduct?.maxPrice.toString()??""} ${'currency'.tr()}", style:  TextStyle(fontSize: 14.sp,
                  fontFamily: 'heavy',
                  fontWeight: FontWeight.w700,
                  color:MyColors.MainColor))
                  :Text("0 ${'currency'.tr()}", style:  TextStyle(fontSize: 14.sp,
                  fontFamily: 'heavy',
                  fontWeight: FontWeight.w700,
                  color:MyColors.MainColor)),
              SizedBox(width: 1.h,),
              categoryProduct?.minPrice.toString()!="null"?
              Text("${categoryProduct?.minPrice.toString()??""} ${'currency'.tr()}", style:  TextStyle(fontSize: 14.sp,
                  fontFamily: 'heavy',
                  fontWeight: FontWeight.w700,
                  color:MyColors.MainColor))
                  :Text("0 ${'currency'.tr()}", style:  TextStyle(fontSize: 14.sp,
                  fontFamily: 'heavy',
                  fontWeight: FontWeight.w700,
                  color:MyColors.MainColor)),
            ],
          )
        ],
      ),
    );
  }

}