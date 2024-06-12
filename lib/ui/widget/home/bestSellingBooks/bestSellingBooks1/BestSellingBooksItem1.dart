import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

import '../../../../../conustant/my_colors.dart';
import '../../../../../data/model/categoryProductModel/CategoryProductResponse.dart';
import '../../../../screens/productDetails/product_details_screen.dart';

class BestSellingBooksItem1 extends StatelessWidget{
  CategoryProduct sProduct;

  BestSellingBooksItem1({required this.sProduct});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) {
          return ProductDetailsScreen(productId: sProduct.slug!,
            type: sProduct.productType!,id: sProduct.id!.toString(),);
        },));
        //Navigator.pushNamed(context, "/product_details_screen",arguments: sProduct.slug!);
      },
      child: Container(
        margin: EdgeInsetsDirectional.only(bottom: 1.h),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            border: Border.all(color: MyColors.Dark5, width: 1.0,),
            color:Colors.white),
        child: Row(
          children: [
            // Container(
            //   height: 15.h,
            //     width: 22.w,
            //     decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(15),
            //         image: const DecorationImage(
            //             image: AssetImage('assets/best_books.png'),
            //             fit: BoxFit.fill))),

            Container(
              height: 15.h,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomLeft: Radius.circular(15))
              ),
              child: Image.network(
                height: 15.h,
                width: 22.w,
                sProduct.image?.original??"",
                fit: BoxFit.fill,
                loadingBuilder: (context, child, loadingProgress) =>
                (loadingProgress == null)
                    ? child
                    : const Center(child: CircularProgressIndicator(color: MyColors.MainColor,)),
                errorBuilder: (context, error, stackTrace) =>
                    Center(child:  SvgPicture.asset('assets/logo_login.svg')),
              ),
            ),

            SizedBox(width: 1.h,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(sProduct.name??"", style:  TextStyle(fontSize: 13.sp,
                    fontFamily: 'bold',
                    fontWeight: FontWeight.w700,
                    color:MyColors.MainColor)),
                /*SizedBox(
                  width: 29.h,
                  child: Text("في عام ٢٠١٩ وأثناء ترميم “لوكاندة بير الوطاويط” المجاورة لمسجد “أحمد ابن طولون...",
                      style:  TextStyle(fontSize: 10.sp,
                      fontFamily: 'light',
                      fontWeight: FontWeight.w300,
                      color:MyColors.MainTint1)),
                ),*/
                sProduct.productType=="simple"?
                Row(
                  children: [

                    sProduct.salePrice.toString()!="null"?
                    Text("${sProduct.salePrice.toString()??""} ${'currency'.tr()}",
                        style:  TextStyle(fontSize: 14.sp,
                          fontFamily: 'regular',
                          fontWeight: FontWeight.w700,
                          color:MyColors.MainColor,
                        ))
                        :Container(),
                    SizedBox(width: 1.h,),
                    sProduct.salePrice.toString()!="null"?
                    Text(sProduct.price.toString()!="null"?
                    "${sProduct.price.toString()??""} ${'currency'.tr()}":"0 ${'currency'.tr()}",
                        style:  TextStyle(fontSize: 12.sp,
                            fontFamily: 'heavy',
                            fontWeight: FontWeight.w400,
                            color:MyColors.Dark4,
                            decoration: TextDecoration.lineThrough))
                        :Text(sProduct.price.toString()!="null"?
                    "${sProduct.price.toString()??""} ${'currency'.tr()}":"0 ${'currency'.tr()}",
                        style:  TextStyle(fontSize: 14.sp,
                            fontFamily: 'heavy',
                            fontWeight: FontWeight.w700,
                            color:MyColors.MainColor)),
                  ],
                )
                /*Row(
                  children: [
                    sProduct.price.toString()!="null"?
                    Text("${sProduct.price.toString()??""} ${'currency'.tr()}", style:  TextStyle(fontSize: 14.sp,
                        fontFamily: 'heavy',
                        fontWeight: FontWeight.w700,
                        color:MyColors.MainColor))
                        :Text("0 ${'currency'.tr()}", style:  TextStyle(fontSize: 14.sp,
                        fontFamily: 'heavy',
                        fontWeight: FontWeight.w700,
                        color:MyColors.MainColor)),
                    SizedBox(width: 1.h,),
                    sProduct.salePrice.toString()!="null"?
                    Text("${sProduct.salePrice.toString()??""} ${'currency'.tr()}", style:  TextStyle(fontSize: 12.sp,
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
                    sProduct.maxPrice.toString()!="null"?
                    Text("${sProduct.maxPrice.toString()??""} ${'currency'.tr()}", style:  TextStyle(fontSize: 14.sp,
                        fontFamily: 'heavy',
                        fontWeight: FontWeight.w700,
                        color:MyColors.MainColor))
                        :Text("0 ${'currency'.tr()}", style:  TextStyle(fontSize: 14.sp,
                        fontFamily: 'heavy',
                        fontWeight: FontWeight.w700,
                        color:MyColors.MainColor)),
                    SizedBox(width: 1.h,),
                    sProduct.minPrice.toString()!="null"?
                    Text("${sProduct.minPrice.toString()??""} ${'currency'.tr()}", style:  TextStyle(fontSize: 14.sp,
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
            )
          ],
        ),
      ),
    );
  }

}