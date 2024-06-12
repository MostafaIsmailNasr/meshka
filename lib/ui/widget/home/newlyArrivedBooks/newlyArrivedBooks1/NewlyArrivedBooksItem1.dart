import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../../../conustant/my_colors.dart';
import '../../../../../data/model/categoryProductModel/CategoryProductResponse.dart';

class NewlyArrivedBooksItem1 extends StatelessWidget{
  CategoryProduct newArr;

  NewlyArrivedBooksItem1({required this.newArr});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 29.h,
            child: Image.network(
              height: 29.h,
              width: 45.w,
              newArr.image?.original??"",
              fit: BoxFit.fill,
              loadingBuilder: (context, child, loadingProgress) =>
              (loadingProgress == null)
                  ? child
                  : const Center(child: CircularProgressIndicator(color: MyColors.MainColor,)),
              errorBuilder: (context, error, stackTrace) =>
                  Center(child:  SvgPicture.asset('assets/logo_login.svg')),
            ),
          ),
          Text(newArr.name??"", style:  TextStyle(fontSize: 12.sp,
              fontFamily: 'regular',
              fontWeight: FontWeight.w400,
              color:MyColors.MainColor)),
          /*SizedBox(
            width: 45.w,
            child: Text("قصة الخلق، طبقات السماوات والأرض وسكانهم، حكاية إبليس...", style:  TextStyle(fontSize: 10.sp,
                fontFamily: 'light',
                fontWeight: FontWeight.w300,
                color:MyColors.MainTint1),maxLines: 2,),
          ),*/
          Row(
            children: [
              newArr.salePrice.toString()!="null"?
              Text("${newArr.price.toString()??""} QR", style:  TextStyle(fontSize: 14.sp,
                  fontFamily: 'heavy',
                  fontWeight: FontWeight.w700,
                  color:MyColors.MainColor))
                  :Text("0 QR", style:  TextStyle(fontSize: 14.sp,
                  fontFamily: 'heavy',
                  fontWeight: FontWeight.w700,
                  color:MyColors.MainColor)),
              SizedBox(width: 1.h,),
              newArr.salePrice.toString()!="null"?
              Text("${newArr.salePrice.toString()??""} QR", style:  TextStyle(fontSize: 12.sp,
                  fontFamily: 'regular',
                  fontWeight: FontWeight.w400,
                  color:MyColors.Dark4,
                  decoration: TextDecoration.lineThrough))
                  :Container(),
            ],
          )
        ],
      ),
    );
  }

}