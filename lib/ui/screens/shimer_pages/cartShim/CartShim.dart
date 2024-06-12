import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';


class CartShim extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 3.h,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey.withOpacity(0.25),
                highlightColor: Colors.white.withOpacity(0.6),
                period: const Duration(seconds: 1),
                child: Container(
                  height: 18.h,
                  width: 15.h,
                  margin: EdgeInsetsDirectional.only(start: 1.h,end: 1.h,top: 1.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.grey.withOpacity(0.9)
                  ),
                ),
              ),
              SizedBox(width: 1.h,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Shimmer.fromColors(
                    baseColor: Colors.grey.withOpacity(0.25),
                    highlightColor: Colors.white.withOpacity(0.6),
                    period: const Duration(seconds: 1),
                    child: Container(
                      height: 1.h,
                      width: 15.h,
                      margin: EdgeInsetsDirectional.only(start: 1.h,end: 1.h,top: 1.h),
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
                      width: 10.h,
                      margin: EdgeInsetsDirectional.only(start: 1.h,end: 1.h,top: 1.h),
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
                      height: 7.h,
                      width: 15.h,
                      margin: EdgeInsetsDirectional.only(start: 1.h,end: 1.h,top: 1.h),
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
          SizedBox(height: 1.h,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey.withOpacity(0.25),
                highlightColor: Colors.white.withOpacity(0.6),
                period: const Duration(seconds: 1),
                child: Container(
                  height: 18.h,
                  width: 15.h,
                  margin: EdgeInsetsDirectional.only(start: 1.h,end: 1.h,top: 1.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.grey.withOpacity(0.9)
                  ),
                ),
              ),
              SizedBox(width: 1.h,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Shimmer.fromColors(
                    baseColor: Colors.grey.withOpacity(0.25),
                    highlightColor: Colors.white.withOpacity(0.6),
                    period: const Duration(seconds: 1),
                    child: Container(
                      height: 1.h,
                      width: 15.h,
                      margin: EdgeInsetsDirectional.only(start: 1.h,end: 1.h,top: 1.h),
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
                      width: 10.h,
                      margin: EdgeInsetsDirectional.only(start: 1.h,end: 1.h,top: 1.h),
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
                      height: 7.h,
                      width: 15.h,
                      margin: EdgeInsetsDirectional.only(start: 1.h,end: 1.h,top: 1.h),
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
          SizedBox(height: 1.h,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey.withOpacity(0.25),
                highlightColor: Colors.white.withOpacity(0.6),
                period: const Duration(seconds: 1),
                child: Container(
                  height: 18.h,
                  width: 15.h,
                  margin: EdgeInsetsDirectional.only(start: 1.h,end: 1.h,top: 1.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.grey.withOpacity(0.9)
                  ),
                ),
              ),
              SizedBox(width: 1.h,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Shimmer.fromColors(
                    baseColor: Colors.grey.withOpacity(0.25),
                    highlightColor: Colors.white.withOpacity(0.6),
                    period: const Duration(seconds: 1),
                    child: Container(
                      height: 1.h,
                      width: 15.h,
                      margin: EdgeInsetsDirectional.only(start: 1.h,end: 1.h,top: 1.h),
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
                      width: 10.h,
                      margin: EdgeInsetsDirectional.only(start: 1.h,end: 1.h,top: 1.h),
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
                      height: 7.h,
                      width: 15.h,
                      margin: EdgeInsetsDirectional.only(start: 1.h,end: 1.h,top: 1.h),
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
          SizedBox(height: 1.h,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey.withOpacity(0.25),
                highlightColor: Colors.white.withOpacity(0.6),
                period: const Duration(seconds: 1),
                child: Container(
                  height: 18.h,
                  width: 15.h,
                  margin: EdgeInsetsDirectional.only(start: 1.h,end: 1.h,top: 1.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.grey.withOpacity(0.9)
                  ),
                ),
              ),
              SizedBox(width: 1.h,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Shimmer.fromColors(
                    baseColor: Colors.grey.withOpacity(0.25),
                    highlightColor: Colors.white.withOpacity(0.6),
                    period: const Duration(seconds: 1),
                    child: Container(
                      height: 1.h,
                      width: 15.h,
                      margin: EdgeInsetsDirectional.only(start: 1.h,end: 1.h,top: 1.h),
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
                      width: 10.h,
                      margin: EdgeInsetsDirectional.only(start: 1.h,end: 1.h,top: 1.h),
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
                      height: 7.h,
                      width: 15.h,
                      margin: EdgeInsetsDirectional.only(start: 1.h,end: 1.h,top: 1.h),
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
          SizedBox(height: 1.h,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey.withOpacity(0.25),
                highlightColor: Colors.white.withOpacity(0.6),
                period: const Duration(seconds: 1),
                child: Container(
                  height: 18.h,
                  width: 15.h,
                  margin: EdgeInsetsDirectional.only(start: 1.h,end: 1.h,top: 1.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.grey.withOpacity(0.9)
                  ),
                ),
              ),
              SizedBox(width: 1.h,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Shimmer.fromColors(
                    baseColor: Colors.grey.withOpacity(0.25),
                    highlightColor: Colors.white.withOpacity(0.6),
                    period: const Duration(seconds: 1),
                    child: Container(
                      height: 1.h,
                      width: 15.h,
                      margin: EdgeInsetsDirectional.only(start: 1.h,end: 1.h,top: 1.h),
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
                      width: 10.h,
                      margin: EdgeInsetsDirectional.only(start: 1.h,end: 1.h,top: 1.h),
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
                      height: 7.h,
                      width: 15.h,
                      margin: EdgeInsetsDirectional.only(start: 1.h,end: 1.h,top: 1.h),
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
        ],
      ),
    );

  }
}