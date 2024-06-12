import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

import '../../../conustant/my_colors.dart';
import '../../../data/model/searchModel/SearchResponse.dart';
import '../../screens/productDetails/product_details_screen.dart';

class SearchItem extends StatelessWidget{
  Search? search;

  SearchItem({required this.search});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) {
          return ProductDetailsScreen(productId: search!.slug!,
            type: search!.productType!,id: search!.id!.toString(),);
        },));
      },
      child: Container(
        margin: EdgeInsetsDirectional.only(bottom: 1.h),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                    height: 15.h,
                    width: 22.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image:  DecorationImage(
                            image: NetworkImage(search?.image?.thumbnail??""),
                            fit: BoxFit.fill))),
                SizedBox(width: 1.h,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(search?.name??"", style:  TextStyle(fontSize: 14.sp,
                        fontFamily: 'regular',
                        fontWeight: FontWeight.w400,
                        color:MyColors.MainColor)),
                    
                    search?.productType=="simple"?
                    /*Row(
                      children: [
                        search?.price.toString()!="null"?
                        Text("${search?.price.toString()??""} ${'currency'.tr()}", style:  TextStyle(fontSize: 14.sp,
                            fontFamily: 'heavy',
                            fontWeight: FontWeight.w700,
                            color:MyColors.MainColor))
                            :Text("0 ${'currency'.tr()}", style:  TextStyle(fontSize: 14.sp,
                            fontFamily: 'heavy',
                            fontWeight: FontWeight.w700,
                            color:MyColors.MainColor)),
                        SizedBox(width: 1.h,),
                        search?.salePrice.toString()!="null"?
                        Text("${search?.salePrice.toString()??""} ${'currency'.tr()}", style:  TextStyle(fontSize: 12.sp,
                            fontFamily: 'regular',
                            fontWeight: FontWeight.w400,
                            color:MyColors.Dark4,
                            decoration: TextDecoration.lineThrough))
                            :Container(),
                      ],
                    )*/
                    Row(
                      children: [

                        search?.salePrice.toString()!="null"?
                        Text("${search?.salePrice.toString()??""} ${'currency'.tr()}",
                            style:  TextStyle(fontSize: 14.sp,
                              fontFamily: 'regular',
                              fontWeight: FontWeight.w700,
                              color:MyColors.MainColor,
                            ))
                            :Container(),
                        SizedBox(width: 1.h,),
                        search?.salePrice.toString()!="null"?
                        Text(search?.price.toString()!="null"?
                        "${search?.price.toString()??""} ${'currency'.tr()}":"0 ${'currency'.tr()}",
                            style:  TextStyle(fontSize: 12.sp,
                                fontFamily: 'heavy',
                                fontWeight: FontWeight.w400,
                                color:MyColors.Dark4,
                                decoration: TextDecoration.lineThrough))
                            :Text(search?.price.toString()!="null"?
                        "${search?.price.toString()??""} ${'currency'.tr()}":"0 ${'currency'.tr()}",
                            style:  TextStyle(fontSize: 14.sp,
                                fontFamily: 'heavy',
                                fontWeight: FontWeight.w700,
                                color:MyColors.MainColor)),
                      ],
                    )
                        :
                    Row(
                      children: [
                        search?.maxPrice.toString()!="null"?
                        Text("${search?.maxPrice.toString()??""} ${'currency'.tr()}", style:  TextStyle(fontSize: 14.sp,
                            fontFamily: 'heavy',
                            fontWeight: FontWeight.w700,
                            color:MyColors.MainColor))
                            :Text("0 ${'currency'.tr()}", style:  TextStyle(fontSize: 14.sp,
                            fontFamily: 'heavy',
                            fontWeight: FontWeight.w700,
                            color:MyColors.MainColor)),
                        SizedBox(width: 1.h,),
                        search?.minPrice.toString()!="null"?
                        Text("${search?.minPrice.toString()??""} ${'currency'.tr()}", style:  TextStyle(fontSize: 14.sp,
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
              ],
            ),
            SizedBox(height: 1.h,),
            SvgPicture.asset('assets/saperator.svg',width: MediaQuery.of(context).size.width,)
          ],
        ),
      ),
    );
  }

}