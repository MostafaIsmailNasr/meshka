import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../conustant/my_colors.dart';
import '../../../../../data/model/productDetailsModel/ProductDetailsResponse.dart';

class VariableItemShape extends StatefulWidget{
  Values? values;
  final bool selected;
  GestureTapCallback? onTap;

  VariableItemShape({required this.values,required this.selected,required this.onTap});

  @override
  State<StatefulWidget> createState() {
    return _VariableItemShap();
  }
}

class _VariableItemShap extends State<VariableItemShape>{
  Color? color;
  bool isSelected=false;
  bool selectedId=false;

  int? itemId=0;
  @override
  Widget build(BuildContext context) {
    if(widget.values?.meta!=null||widget.values?.meta!="null") {
      return GestureDetector(
        onTap: widget.onTap,
        child: Container(
          margin: EdgeInsetsDirectional.only(end: 1.h,bottom: 1.h),
          padding: EdgeInsetsDirectional.all(1.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color:widget.selected?
              MyColors.MainColor:MyColors.Dark5, width: 2)),
          child: Center(
            child: Text(
                widget.values?.value ?? "", style: TextStyle(fontSize: 12.sp,
                fontFamily: 'regular',
                fontWeight: FontWeight.w500,
                color: MyColors.Dark2), textAlign: TextAlign.center,
                maxLines: 1, overflow: TextOverflow.ellipsis),
          ),
        ),
      );
    }else{
      color=widget.values!.meta!.replaceAll("#", "0xff");
      return GestureDetector(
        onTap: widget.onTap,
        child: Container(
          width: 5.h,
          height: 5.h,
          margin: EdgeInsetsDirectional.only(end: 1.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color:widget.selected?MyColors.MainColor: MyColors.Dark5, width: 0.2),
            color: color
          ),
        ),
      );
    }
  }

}