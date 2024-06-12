import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';


class OrderDetailsShim extends StatelessWidget {
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
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey.withOpacity(0.25),
                highlightColor: Colors.white.withOpacity(0.6),
                period: const Duration(seconds: 1),
                child: Container(
                  height: 10.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey.withOpacity(0.9)
                  ),
                ),
              ),
              SizedBox(height: 1.h,),
              Row(
                children: [
                  Expanded(
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey.withOpacity(0.25),
                      highlightColor: Colors.white.withOpacity(0.6),
                      period: const Duration(seconds: 1),
                      child: Container(
                        height: 10.h,
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
                        height: 10.h,
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
              SizedBox(height: 1.h,),
              Row(
                children: [
                  Expanded(
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey.withOpacity(0.25),
                      highlightColor: Colors.white.withOpacity(0.6),
                      period: const Duration(seconds: 1),
                      child: Container(
                        height: 10.h,
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
                        height: 10.h,
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
              SizedBox(height: 2.h,),
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
              SizedBox(height: 2.h,),
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
              SizedBox(height: 2.h,),
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
                      height: 8.h,
                      width: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey.withOpacity(0.9)
                      ),
                    ),
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
                          height: 1.h,
                          width: 15.h,
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
              SizedBox(height: 1.h,),
              Row(
                children: [
                  Shimmer.fromColors(
                    baseColor: Colors.grey.withOpacity(0.25),
                    highlightColor: Colors.white.withOpacity(0.6),
                    period: const Duration(seconds: 1),
                    child: Container(
                      height: 8.h,
                      width: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey.withOpacity(0.9)
                      ),
                    ),
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
                          height: 1.h,
                          width: 15.h,
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
              SizedBox(height: 1.h,),
              Row(
                children: [
                  Shimmer.fromColors(
                    baseColor: Colors.grey.withOpacity(0.25),
                    highlightColor: Colors.white.withOpacity(0.6),
                    period: const Duration(seconds: 1),
                    child: Container(
                      height: 8.h,
                      width: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey.withOpacity(0.9)
                      ),
                    ),
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
                          height: 1.h,
                          width: 15.h,
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

        ],
      ),
    );
  }
}