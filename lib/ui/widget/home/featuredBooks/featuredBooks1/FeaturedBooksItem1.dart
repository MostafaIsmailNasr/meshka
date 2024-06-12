import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

import '../../../../../conustant/my_colors.dart';
import '../../../../../data/model/categoryProductModel/CategoryProductResponse.dart';
import '../../../../screens/categoryDetails/category_details_screen.dart';
import '../../../../screens/productDetails/product_details_screen.dart';

class FeaturedBooksItem1 extends StatelessWidget{
  CategoryProduct flash;

  FeaturedBooksItem1({required this.flash});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) {
          return ProductDetailsScreen(productId: flash.slug!,
            type: flash.productType!,id: flash.id!.toString(),);
        },));
        //Navigator.pushNamed(context, "/product_details_screen",arguments: flash.slug);
      },
      child: Container(
        margin: EdgeInsetsDirectional.only(end: 1.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 25.h,
              child: Image.network(
                height: 25.h,
                width: 45.w,
                flash.image?.original??"",
                fit: BoxFit.fill,
                loadingBuilder: (context, child, loadingProgress) =>
                (loadingProgress == null)
                    ? child
                    : const Center(child: CircularProgressIndicator(color: MyColors.MainColor,)),
                errorBuilder: (context, error, stackTrace) =>
                    Center(child:  SvgPicture.asset('assets/logo_login.svg')),
              ),
            ),
            Text(flash.name??"", style:  TextStyle(fontSize: 14.sp,
                fontFamily: 'regular',
                fontWeight: FontWeight.w600,
                color:MyColors.Dark1),maxLines: 1,),
            flash.productType=="simple"?
            Row(
              children: [

                flash.salePrice.toString()!="null"?
                Text("${flash.salePrice.toString()??""} ${'currency'.tr()}",
                    style:  TextStyle(fontSize: 14.sp,
                    fontFamily: 'regular',
                    fontWeight: FontWeight.w700,
                    color:MyColors.MainColor,
                    ))
                    :Container(),
                SizedBox(width: 1.h,),
                flash.salePrice.toString()!="null"?
                Text(flash.price.toString()!="null"?
                "${flash.price.toString()??""} ${'currency'.tr()}":"0 ${'currency'.tr()}",
                    style:  TextStyle(fontSize: 12.sp,
                        fontFamily: 'heavy',
                        fontWeight: FontWeight.w400,
                        color:MyColors.Dark4,
                        decoration: TextDecoration.lineThrough))
                    :Text(flash.price.toString()!="null"?
                "${flash.price.toString()??""} ${'currency'.tr()}":"0 ${'currency'.tr()}",
                    style:  TextStyle(fontSize: 14.sp,
                        fontFamily: 'heavy',
                        fontWeight: FontWeight.w700,
                        color:MyColors.MainColor)),
              ],
            )

                :
            Row(
              children: [
                flash.maxPrice.toString()!="null"?
                Text("${flash.maxPrice.toString()??""} ${'currency'.tr()}", style:  TextStyle(fontSize: 14.sp,
                    fontFamily: 'heavy',
                    fontWeight: FontWeight.w700,
                    color:MyColors.MainColor))
                    :Text("0 ${'currency'.tr()}", style:  TextStyle(fontSize: 14.sp,
                    fontFamily: 'heavy',
                    fontWeight: FontWeight.w700,
                    color:MyColors.MainColor)),
                SizedBox(width: 1.h,),
                flash.minPrice.toString()!="null"?
                Text("${flash.minPrice.toString()??""} ${'currency'.tr()}", style:  TextStyle(fontSize: 14.sp,
                    fontFamily: 'heavy',
                    fontWeight: FontWeight.w700,
                    color:MyColors.MainColor))
                    :Text("0 ${'currency'.tr()}", style:  TextStyle(fontSize: 14.sp,
                    fontFamily: 'heavy',
                    fontWeight: FontWeight.w700,
                    color:MyColors.MainColor)),
              ],
            )
/*Row(
              children: [
                flash.price.toString()!="null"?
                Text("${flash.price.toString()??""} ${'currency'.tr()}", style:  TextStyle(fontSize: 14.sp,
                    fontFamily: 'heavy',
                    fontWeight: FontWeight.w700,
                    color:MyColors.MainColor))
                    :Text("0 ${'currency'.tr()}", style:  TextStyle(fontSize: 14.sp,
                    fontFamily: 'heavy',
                    fontWeight: FontWeight.w700,
                    color:MyColors.MainColor)),
                SizedBox(width: 1.h,),
                flash.salePrice.toString()!="null"?
                Text("${flash.salePrice.toString()??""} ${'currency'.tr()}", style:  TextStyle(fontSize: 12.sp,
                    fontFamily: 'regular',
                    fontWeight: FontWeight.w400,
                    color:MyColors.Dark4,
                    decoration: TextDecoration.lineThrough))
                    :Container(),
              ],
            )*/
          ],
        ),
      ),
    );
  }

}