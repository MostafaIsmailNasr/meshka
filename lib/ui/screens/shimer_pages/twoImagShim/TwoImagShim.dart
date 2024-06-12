import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';


class TwoImagShim extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Shimmer.fromColors(
                baseColor: Colors.grey.withOpacity(0.25),
                highlightColor: Colors.white.withOpacity(0.6),
                period: const Duration(seconds: 1),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 15.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
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
                  width: MediaQuery.of(context).size.width,
                  height: 15.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey.withOpacity(0.9)
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );

  }
}