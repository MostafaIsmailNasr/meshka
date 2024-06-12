import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';


class CategoryShim extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      children: [
        Column(
          children: [
            Shimmer.fromColors(
              baseColor: Colors.grey.withOpacity(0.25),
              highlightColor: Colors.white.withOpacity(0.6),
              period: const Duration(seconds: 1),
              child: Container(
                height: 10.h,
                width: 10.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey.withOpacity(0.9)
                ),
              ),
            ),
            SizedBox(height: 1.h,),
            Shimmer.fromColors(
              baseColor: Colors.grey.withOpacity(0.25),
              highlightColor: Colors.white.withOpacity(0.6),
              period: const Duration(seconds: 1),
              child: Container(
                height: 1.h,
                width: 10.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey.withOpacity(0.9)
                ),
              ),
            ),
          ],
        ),
        SizedBox(width: 1.h,),
        Column(
          children: [
            Shimmer.fromColors(
              baseColor: Colors.grey.withOpacity(0.25),
              highlightColor: Colors.white.withOpacity(0.6),
              period: const Duration(seconds: 1),
              child: Container(
                height: 10.h,
                width: 10.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey.withOpacity(0.9)
                ),
              ),
            ),
            SizedBox(height: 1.h,),
            Shimmer.fromColors(
              baseColor: Colors.grey.withOpacity(0.25),
              highlightColor: Colors.white.withOpacity(0.6),
              period: const Duration(seconds: 1),
              child: Container(
                height: 1.h,
                width: 10.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey.withOpacity(0.9)
                ),
              ),
            ),
          ],
        ),
        SizedBox(width: 1.h,),
        Column(
          children: [
            Shimmer.fromColors(
              baseColor: Colors.grey.withOpacity(0.25),
              highlightColor: Colors.white.withOpacity(0.6),
              period: const Duration(seconds: 1),
              child: Container(
                height: 10.h,
                width: 10.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey.withOpacity(0.9)
                ),
              ),
            ),
            SizedBox(height: 1.h,),
            Shimmer.fromColors(
              baseColor: Colors.grey.withOpacity(0.25),
              highlightColor: Colors.white.withOpacity(0.6),
              period: const Duration(seconds: 1),
              child: Container(
                height: 1.h,
                width: 10.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey.withOpacity(0.9)
                ),
              ),
            ),
          ],
        ),
        SizedBox(width: 1.h,),
        Column(
          children: [
            Shimmer.fromColors(
              baseColor: Colors.grey.withOpacity(0.25),
              highlightColor: Colors.white.withOpacity(0.6),
              period: const Duration(seconds: 1),
              child: Container(
                height: 10.h,
                width: 10.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey.withOpacity(0.9)
                ),
              ),
            ),
            SizedBox(height: 1.h,),
            Shimmer.fromColors(
              baseColor: Colors.grey.withOpacity(0.25),
              highlightColor: Colors.white.withOpacity(0.6),
              period: const Duration(seconds: 1),
              child: Container(
                height: 1.h,
                width: 10.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey.withOpacity(0.9)
                ),
              ),
            ),
          ],
        ),
      ],
    );
    /*Container(
      padding: EdgeInsets.all(1.h),
      // decoration: BoxDecoration(
      //   color: Colors.white,
      //   //borderRadius: const BorderRadius.all(Radius.circular(5)),
      //   boxShadow: <BoxShadow>[
      //     BoxShadow(
      //         color: Colors.grey.withOpacity(0.2),
      //         offset: const Offset(0, 2),
      //         blurRadius: 10.0),
      //   ],
      // ),
      child: Shimmer.fromColors(
        highlightColor: Colors.white,
        baseColor: Colors.grey.shade300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 6,
              child: Center(
                child: Container(
                  width: 20.h,
                  color: Colors.white70,
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 1.h,),
                    Container(width: 15.h,
                      height: 2.h,
                      color: Colors.white70,
                    ),
                    SizedBox(height: 1.h,),
                    Container(width: 15.h,
                      height: 1.h,
                      color: Colors.white70,
                    )
                  ]),
            )
          ],
        ),
      ),*/

  }
}