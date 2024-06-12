import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../../../../conustant/my_colors.dart';
import '../../../../../data/model/home/categoryModel/CategoryResponse.dart';



class ShopByCategory extends StatelessWidget{
  //Category category;

  //ShopByCategory({required this.category});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        // Navigator.push(context, PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation)=>
        //     CategoryDetailsScreen(slug: category.slug!,name: category.name!,)
        // ));
      },
      child: Container(
        margin: EdgeInsetsDirectional.only(end: 1.h),
        child: Column(
          children: [
            Container(
              padding: EdgeInsetsDirectional.all(2.5.h),
              // decoration:  BoxDecoration(
              //     borderRadius: BorderRadius.circular(50),
              //     border: Border.all(color: MyColors.Dark5, width: 0.2,),
              //     image: DecorationImage(image: NetworkImage(category.image?.thumbnail??"",),fit: BoxFit.fill)//:
              // ),
              child: SvgPicture.asset('assets/book.svg'),
            ),
            SizedBox(height: 1.h,),
            Text("ff", style:  TextStyle(fontSize: 12.sp,
                fontFamily: 'regular',
                fontWeight: FontWeight.w400,
                color:MyColors.Dark1),textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }

}