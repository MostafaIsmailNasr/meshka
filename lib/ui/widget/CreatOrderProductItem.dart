import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

import '../../conustant/my_colors.dart';
import '../../data/model/orderDetailsModel/OrderDetailsResponse.dart';

class CreatOrderProductItem extends StatelessWidget{
  Products? products;

  CreatOrderProductItem({required this.products});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(bottom: 1.h),
      child: Row(
        children: [
          SizedBox(
            height: 6.h,
            child: Image.network(
              height: 6.h,
              width: 12.w,
              products?.image?.original??"",
              fit: BoxFit.fill,
              loadingBuilder: (context, child, loadingProgress) =>
              (loadingProgress == null)
                  ? child
                  : const Center(child: CircularProgressIndicator(color: MyColors.MainColor,)),
              errorBuilder: (context, error, stackTrace) =>
                  Center(child:  SvgPicture.asset('assets/logo_login.svg')),
            ),
          ),
          //Image(image: AssetImage('assets/featered_books.png',),width: 12.w,height: 6.h,),
          SizedBox(width: 1.h,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(products?.name??"", style:  TextStyle(fontSize: 12.sp,
                  fontFamily: 'regular',
                  fontWeight: FontWeight.w400,
                  color:MyColors.Dark1)),
              Text("${products?.pivot?.orderQuantity.toString()??""} X", style:  TextStyle(fontSize: 11.sp,
                  fontFamily: 'regular',
                  fontWeight: FontWeight.w400,
                  color:MyColors.Dark3)),
            ],
          ),
          const Spacer(),
          products?.salePrice!="null"||products?.salePrice!=null?
          Text("${products?.salePrice.toString()??""} ${'currency'.tr()}", style:  TextStyle(fontSize: 14.sp,
              fontFamily: 'regular',
              fontWeight: FontWeight.w400,
              color:MyColors.MainColor))
              :products?.price!="null"?
          Text("${products?.price.toString()??""} ${'currency'.tr()}", style:  TextStyle(fontSize: 14.sp,
              fontFamily: 'regular',
              fontWeight: FontWeight.w400,
              color:MyColors.MainColor))
              :Text("0 ${'currency'.tr()}", style:  TextStyle(fontSize: 14.sp,
              fontFamily: 'regular',
              fontWeight: FontWeight.w400,
              color:MyColors.MainColor)),
        ],
      ),
    );
  }

}