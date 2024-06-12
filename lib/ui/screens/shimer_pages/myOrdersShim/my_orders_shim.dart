import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';


class MyOrdersShim extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.all(2.h),
      child: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        children: [
          Column(
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey.withOpacity(0.25),
                highlightColor: Colors.white.withOpacity(0.6),
                period: const Duration(seconds: 1),
                child: Container(
                  height: 1.h,
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
                  height: 1.h,
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
                  height: 1.h,
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
                  height: 1.h,
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
                  height: 1.h,
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
                  height: 6.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey.withOpacity(0.9)
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 2.h,),
          Column(
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey.withOpacity(0.25),
                highlightColor: Colors.white.withOpacity(0.6),
                period: const Duration(seconds: 1),
                child: Container(
                  height: 1.h,
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
                  height: 1.h,
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
                  height: 1.h,
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
                  height: 1.h,
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
                  height: 1.h,
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
                  height: 6.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey.withOpacity(0.9)
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 2.h,),
          Column(
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey.withOpacity(0.25),
                highlightColor: Colors.white.withOpacity(0.6),
                period: const Duration(seconds: 1),
                child: Container(
                  height: 1.h,
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
                  height: 1.h,
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
                  height: 1.h,
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
                  height: 1.h,
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
                  height: 1.h,
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
                  height: 6.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey.withOpacity(0.9)
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 2.h,),
          Column(
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey.withOpacity(0.25),
                highlightColor: Colors.white.withOpacity(0.6),
                period: const Duration(seconds: 1),
                child: Container(
                  height: 1.h,
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
                  height: 1.h,
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
                  height: 1.h,
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
                  height: 1.h,
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
                  height: 1.h,
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
                  height: 6.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey.withOpacity(0.9)
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 2.h,),
          Column(
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey.withOpacity(0.25),
                highlightColor: Colors.white.withOpacity(0.6),
                period: const Duration(seconds: 1),
                child: Container(
                  height: 1.h,
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
                  height: 1.h,
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
                  height: 1.h,
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
                  height: 1.h,
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
                  height: 1.h,
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
                  height: 6.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey.withOpacity(0.9)
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}