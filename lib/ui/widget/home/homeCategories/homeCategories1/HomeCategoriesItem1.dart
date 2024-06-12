import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../../../../conustant/my_colors.dart';
import '../../../../../data/model/home/categoryModel/CategoryResponse.dart';
import '../../../../screens/categoryDetails/category_details_screen.dart';



class HomeCategoriesItem1 extends StatelessWidget{
  Category category;

  HomeCategoriesItem1({required this.category});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation)=>
          CategoryDetailsScreen(
            slug: "categories.slug:${category.slug!};status:publish"
            ,name: category.name!,
            tags: "",
          from: "",)
        ));
        //Navigator.pushNamed(context, "/category_details_screen",arguments: category.slug);
      },
      child: Container(
        margin: EdgeInsetsDirectional.only(end: 1.h),
        child: Column(
          children: [
            Container(
              height: 10.h,
              width: 10.h,
              padding: EdgeInsetsDirectional.all(2.5.h),
              decoration:  BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                border: Border.all(color: MyColors.Dark5, width: 0.2,),
                  image: DecorationImage(image:
                  NetworkImage(category.image?.thumbnail??"",),fit: BoxFit.fill)//:
              ),
              //child: SvgPicture.asset('assets/book.svg'),
            ),
            SizedBox(height: 1.h,),
            Text(category.name??"", style:  TextStyle(fontSize: 12.sp,
                fontFamily: 'regular',
                fontWeight: FontWeight.w500,
                color:MyColors.Dark1),textAlign: TextAlign.center,
                maxLines: 1,overflow: TextOverflow.ellipsis),
          ],
        ),
      ),
    );
  }

}