import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:sizer/sizer.dart';

import '../../conustant/my_colors.dart';

class AnswerQuestionItem extends StatelessWidget{
  // Faqs faqs;
  var question;
  var answer;
  AnswerQuestionItem({required this.question,required this.answer});

  @override
  build(BuildContext context) {
    return ExpandableNotifier(
      child: Container(
        margin: EdgeInsetsDirectional.all(1.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),border: Border.all(color:  MyColors.Dark5)
        ),
        child: Padding(
          padding:  EdgeInsets.all(1.h),
          child: Column(
            children: <Widget>[
              ScrollOnExpand(
                scrollOnExpand: true,
                scrollOnCollapse: false,
                child: ExpandablePanel(
                  theme: const ExpandableThemeData(
                    hasIcon: true,
                    iconPlacement: ExpandablePanelIconPlacement.right,
                    iconColor: Colors.black,
                    collapseIcon: Icons.keyboard_arrow_up_outlined,
                    expandIcon: Icons.keyboard_arrow_down_outlined,
                    headerAlignment: ExpandablePanelHeaderAlignment.center,
                    tapBodyToCollapse: true,
                  ),
                  header: Padding(
                    padding:  EdgeInsets.all(1.h),
                    child: Row(
                      children: [
                        Text(
                          question??"",
                          style:  TextStyle(fontSize: 14.sp,
                              fontFamily: 'medium',
                              fontWeight: FontWeight.w500,
                              color: MyColors.MainColor),
                        ),
                      ],
                    ),
                  ),
                  collapsed: const SizedBox.shrink(),
                  expanded: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      for (var _ in Iterable.generate(1))
                        Padding(
                            padding:  EdgeInsets.only(bottom: 1.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset('assets/saperator.svg',width: MediaQuery.of(context).size.width,),
                                SizedBox(height: 1.h,),
                                Text(answer??"",style:  TextStyle(fontSize: 12.sp,
                                    fontFamily: 'regular',
                                    fontWeight: FontWeight.w400,
                                    color: MyColors.MainTint1),)
                              ],
                            )
                          //Text(answer!,),
                        ),
                    ],
                  ),
                  builder: (_, collapsed, expanded) {
                    return Padding(
                      padding:  EdgeInsets.only(
                        left: 1.h,
                        right: 1.h,
                        bottom: 1.h,
                      ),
                      child: Expandable(
                        collapsed: collapsed,
                        expanded: expanded,
                        theme: const ExpandableThemeData(crossFadePoint: 0),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}