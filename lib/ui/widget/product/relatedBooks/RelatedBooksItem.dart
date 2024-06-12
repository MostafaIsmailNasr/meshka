import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

import '../../../../../conustant/my_colors.dart';
import '../../../../data/model/productDetailsModel/ProductDetailsResponse.dart';
import '../../../screens/productDetails/product_details_screen.dart';

class RelatedBooksItem extends StatelessWidget{
  RelatedProducts? relatedProducts;

  RelatedBooksItem({required this.relatedProducts});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        //Navigator.pushReplacementNamed(context, "/product_details_screen",arguments: relatedProducts?.slug!);
        // Navigator.push(context, PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) {
        //   return ProductDetailsScreen(productId: relatedProducts!.slug!,
        //     type: relatedProducts!.productType!,id: relatedProducts!.id!.toString(),);
        // },));

        Navigator.pushReplacement(context, PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) {
          return ProductDetailsScreen(productId: relatedProducts!.slug!,
            type: relatedProducts!.productType!,id: relatedProducts!.id!.toString(),);
        },));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 25.h,
            child: Image.network(
              height: 25.h,
              width: 45.w,
              relatedProducts?.image?.original??"",
              fit: BoxFit.fill,
              loadingBuilder: (context, child, loadingProgress) =>
              (loadingProgress == null)
                  ? child
                  : const Center(child: CircularProgressIndicator(color: MyColors.MainColor,)),
              errorBuilder: (context, error, stackTrace) =>
                  Center(child:  SvgPicture.asset('assets/logo_login.svg')),
            ),
          ),
          Text(relatedProducts?.name??"", style:  TextStyle(fontSize: 12.sp,
              fontFamily: 'regular',
              fontWeight: FontWeight.w400,
              color:MyColors.MainColor),maxLines: 1,overflow: TextOverflow.ellipsis,),
          // SizedBox(
          //   width: 45.w,
          //   child: Text("قصة الخلق، طبقات السماوات والأرض وسكانهم، حكاية إبليس...", style:  TextStyle(fontSize: 10.sp,
          //       fontFamily: 'light',
          //       fontWeight: FontWeight.w300,
          //       color:MyColors.MainTint1),maxLines: 2,),
          // ),

          relatedProducts?.productType=="simple"?
          Row(
            children: [
              relatedProducts?.salePrice.toString()!="null"?
              Text(relatedProducts?.price.toString()!="null"?
              "${relatedProducts?.price.toString()??""} ${'currency'.tr()}":"0 ${'currency'.tr()}",
                  style:  TextStyle(fontSize: 12.sp,
                      fontFamily: 'heavy',
                      fontWeight: FontWeight.w400,
                      color:MyColors.Dark4,
                      decoration: TextDecoration.lineThrough))

                  :Text(relatedProducts?.price.toString()!="null"?
              "${relatedProducts?.price.toString()??""} ${'currency'.tr()}":"0 ${'currency'.tr()}",
                  style:  TextStyle(fontSize: 14.sp,
                      fontFamily: 'heavy',
                      fontWeight: FontWeight.w700,
                      color:MyColors.MainColor)),
              SizedBox(width: 1.h,),
              relatedProducts?.salePrice.toString()!="null"?
              Text("${relatedProducts?.salePrice.toString()??""} ${'currency'.tr()}",
                  style:  TextStyle(fontSize: 14.sp,
                    fontFamily: 'regular',
                    fontWeight: FontWeight.w700,
                    color:MyColors.MainColor,
                  ))
                  :Container(),
            ],
          )
              :
          Row(
            children: [
              relatedProducts?.maxPrice.toString()!="null"?
              Text("${relatedProducts?.maxPrice.toString()??""} ${'currency'.tr()}", style:  TextStyle(fontSize: 14.sp,
                  fontFamily: 'heavy',
                  fontWeight: FontWeight.w700,
                  color:MyColors.MainColor))
                  :Text("0 ${'currency'.tr()}", style:  TextStyle(fontSize: 14.sp,
                  fontFamily: 'heavy',
                  fontWeight: FontWeight.w700,
                  color:MyColors.MainColor)),
              SizedBox(width: 1.h,),
              relatedProducts?.minPrice.toString()!="null"?
              Text("${relatedProducts?.minPrice.toString()??""} ${'currency'.tr()}", style:  TextStyle(fontSize: 14.sp,
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