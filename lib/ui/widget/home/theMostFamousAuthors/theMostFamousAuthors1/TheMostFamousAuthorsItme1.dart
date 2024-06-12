import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../conustant/my_colors.dart';
import '../../../../../data/model/filterModel/BrandsModel/BrandsResponse.dart';
import '../../../../screens/categoryDetails/category_details_screen.dart';

class TheMostFamousAuthorsItme1 extends StatelessWidget{
  BrandsResponse? brandsResponse;

  TheMostFamousAuthorsItme1({required this.brandsResponse});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        //Navigator.pushNamed(context, "/auther_details_screen",);
        Navigator.push(
            context,
            PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    CategoryDetailsScreen(
                      slug: "type.slug:hipster;status:publish",
                      name: brandsResponse?.name??"",
                      tags: "hipster",
                      from: "",
                    )));
      },
      child: Container(
        margin: EdgeInsetsDirectional.only(end: 1.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                height: 12.h,
                width: 22.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image:  DecorationImage(
                        image: NetworkImage((brandsResponse?.promotionalSliders?[0].thumbnail)??""),
                        fit: BoxFit.fill))),
            SizedBox(height: 1.h,),
            Text(brandsResponse?.name??"", style:  TextStyle(fontSize: 11.sp,
                fontFamily: 'regular',
                fontWeight: FontWeight.w400,
                color:MyColors.MainColor)),
          ],
        ),
      ),
    );
  }

}