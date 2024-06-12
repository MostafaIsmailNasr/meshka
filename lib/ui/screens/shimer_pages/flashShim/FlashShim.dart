import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';


class FlashShim extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Shimmer.fromColors(
              baseColor: Colors.grey.withOpacity(0.25),
              highlightColor: Colors.white.withOpacity(0.6),
              period: const Duration(seconds: 1),
              child: Container(
                height: 25.h,
                width: 45.w,
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
                height: 1.h,
                width: 15.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey.withOpacity(0.9)
                ),
              ),
            ),
            SizedBox(height: 1.h,),
            Row(
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.grey.withOpacity(0.25),
                  highlightColor: Colors.white.withOpacity(0.6),
                  period: const Duration(seconds: 1),
                  child: Container(
                    height: 1.h,
                    width: 8.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey.withOpacity(0.9)
                    ),
                  ),
                ),
                SizedBox(width: 1.h,),
                Shimmer.fromColors(
                  baseColor: Colors.grey.withOpacity(0.25),
                  highlightColor: Colors.white.withOpacity(0.6),
                  period: const Duration(seconds: 1),
                  child: Container(
                    height: 1.h,
                    width: 8.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey.withOpacity(0.9)
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
        SizedBox(width: 1.h,),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Shimmer.fromColors(
              baseColor: Colors.grey.withOpacity(0.25),
              highlightColor: Colors.white.withOpacity(0.6),
              period: const Duration(seconds: 1),
              child: Container(
                height: 25.h,
                width: 45.w,
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
                height: 1.h,
                width: 15.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey.withOpacity(0.9)
                ),
              ),
            ),
            SizedBox(height: 1.h,),
            Row(
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.grey.withOpacity(0.25),
                  highlightColor: Colors.white.withOpacity(0.6),
                  period: const Duration(seconds: 1),
                  child: Container(
                    height: 1.h,
                    width: 8.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey.withOpacity(0.9)
                    ),
                  ),
                ),
                SizedBox(width: 1.h,),
                Shimmer.fromColors(
                  baseColor: Colors.grey.withOpacity(0.25),
                  highlightColor: Colors.white.withOpacity(0.6),
                  period: const Duration(seconds: 1),
                  child: Container(
                    height: 1.h,
                    width: 8.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey.withOpacity(0.9)
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
        SizedBox(width: 1.h,),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Shimmer.fromColors(
              baseColor: Colors.grey.withOpacity(0.25),
              highlightColor: Colors.white.withOpacity(0.6),
              period: const Duration(seconds: 1),
              child: Container(
                height: 25.h,
                width: 45.w,
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
                height: 1.h,
                width: 15.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey.withOpacity(0.9)
                ),
              ),
            ),
            SizedBox(height: 1.h,),
            Row(
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.grey.withOpacity(0.25),
                  highlightColor: Colors.white.withOpacity(0.6),
                  period: const Duration(seconds: 1),
                  child: Container(
                    height: 1.h,
                    width: 8.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey.withOpacity(0.9)
                    ),
                  ),
                ),
                SizedBox(width: 1.h,),
                Shimmer.fromColors(
                  baseColor: Colors.grey.withOpacity(0.25),
                  highlightColor: Colors.white.withOpacity(0.6),
                  period: const Duration(seconds: 1),
                  child: Container(
                    height: 1.h,
                    width: 8.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey.withOpacity(0.9)
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ],

    );
  }
}