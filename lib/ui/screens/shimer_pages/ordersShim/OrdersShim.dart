
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';


class OrdersShim extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsetsDirectional.only(top:  3.h,end: 3.h, start: 3.h),
        child: Column(
          children: [
            Shimmer.fromColors(
              baseColor: Colors.grey.withOpacity(0.25),
              highlightColor: Colors.white.withOpacity(0.6),
              period: const Duration(seconds: 1),
              child: Container(
                height: 25.h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
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
                height: 25.h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
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
                height: 25.h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
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
                height: 25.h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey.withOpacity(0.9)
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }
}