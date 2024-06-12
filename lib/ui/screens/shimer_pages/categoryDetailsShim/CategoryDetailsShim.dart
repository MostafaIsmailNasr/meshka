import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';


class CategoryDetailsShim extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Shimmer.fromColors(
            baseColor: Colors.grey.withOpacity(0.25),
            highlightColor: Colors.white.withOpacity(0.6),
            period: const Duration(seconds: 1),
            child: Container(
              height: 10.h,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsetsDirectional.only(start: 1.h,end: 1.h,top: 1.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey.withOpacity(0.9)
              ),
            ),
          ),
          SizedBox(height: 1.h,),
          Container(
            margin: EdgeInsetsDirectional.only(start: 1.h,end: 1.h),
            child: Row(
              children: [
                Expanded(
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey.withOpacity(0.25),
                    highlightColor: Colors.white.withOpacity(0.6),
                    period: const Duration(seconds: 1),
                    child: Container(
                      height: 8.h,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey.withOpacity(0.9)
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 1.h,),
                Expanded(
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey.withOpacity(0.25),
                    highlightColor: Colors.white.withOpacity(0.6),
                    period: const Duration(seconds: 1),
                    child: Container(
                      height: 8.h,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey.withOpacity(0.9)
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 1.h,),
          Container(
            margin: EdgeInsetsDirectional.only(start: 1.h,end: 1.h),
            child: GridView(
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: (6 / 8),
                crossAxisSpacing: 12,
                mainAxisSpacing: 18,
              ),
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
            ),
          ),
        ],
      ),
    );

  }
}