import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';


class OnSellingShim extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      children: [
        Shimmer.fromColors(
          baseColor: Colors.grey.withOpacity(0.25),
          highlightColor: Colors.white.withOpacity(0.6),
          period: const Duration(seconds: 1),
          child: Container(
            height: 15.h,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
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
            height: 15.h,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
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
            height: 15.h,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
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
            height: 15.h,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
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
            height: 15.h,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey.withOpacity(0.9)
            ),
          ),
        ),
        SizedBox(height: 1.h,),Shimmer.fromColors(
          baseColor: Colors.grey.withOpacity(0.25),
          highlightColor: Colors.white.withOpacity(0.6),
          period: const Duration(seconds: 1),
          child: Container(
            height: 15.h,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
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
            height: 15.h,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
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
            height: 15.h,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
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
            height: 15.h,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
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
            height: 15.h,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey.withOpacity(0.9)
            ),
          ),
        ),
        SizedBox(height: 1.h,),

      ],
    );
  }
}